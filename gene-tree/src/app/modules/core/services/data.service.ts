import { filter, switchMap } from 'rxjs/operators';
/* eslint-disable no-debugger */
import { Injectable } from '@angular/core';
import { BehaviorSubject, from, Observable, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../user/models/account-settings.model';
import { CurrentUserModel } from '../models/current-user.model';
import { Storage } from '@ionic/storage-angular';
import * as CordovaSQLiteDriver from 'localforage-cordovasqlitedriver';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  private user = new BehaviorSubject<CurrentUserModel>(new CurrentUserModel());
  public user$ = this.user.asObservable();

  private darkTheme = new BehaviorSubject<boolean>(null);
  public darkTheme$ = this.darkTheme.asObservable();

  private language = new BehaviorSubject<string>(environment.defaultLanguage);
  public language$ = this.language.asObservable();

  private storageReady = new BehaviorSubject(false);
  constructor(private storage: Storage) {
    this.initData();
  }

  async initData() {
    await this.storage.defineDriver(CordovaSQLiteDriver);
    await this.storage.create();
    this.getCurrentUser().subscribe((value)=>this.user.next(value));
    this.getTheme().subscribe((value)=>this.darkTheme.next(value));
    this.getLanguage().subscribe((value)=>this.language.next(value));
    this.storageReady.next(true);
  }

  set(key: string, value: any) {
    this.storage.set(key, JSON.stringify(value));
  }

  get<T>(key: string): Observable<T | null> {
    return this.storageReady.pipe(
      filter((ready) => ready),
      switchMap(() => {
        return (
          from(this.storage.get(key).then((value) => <T>JSON.parse(value))) ||
          of(null)
        );
      })
    );
  }

  remove(key: string) {
    this.storage.remove(key);
  }

  setTheme(theme: boolean) {
    this.set('dark-theme', theme);
    this.darkTheme.next(theme);
  }

  getTheme(): Observable<boolean | null> {
    const theme = this.get<boolean>('dark-theme');
    return theme;
  }

  setLanguage(language: string) {
    this.set('lang', language);
    this.language.next(language);
  }

  getLanguage(): Observable<string | null> {
    const lang = this.get<string>('lang');
    return lang;
  }

  setJWT(token: string | null) {
    this.set('jwt', token);
  }

  getJWT(): Observable<string | null> {
    const jwt = this.get<string>('jwt');
    return jwt;
  }

  removeJWT() {
    this.remove('jwt');
  }

  setCurrentUser(user: CurrentUserModel) {
    this.set('current-user', user);
    this.user.next(user);
  }

  getCurrentUser(): Observable<CurrentUserModel | null> {
    const user = this.get<CurrentUserModel>('current-user');
    return user;
  }

  removeCurrentUser() {
    this.remove('current-user');
    this.user.next(null);
  }

  setPreferences(preferences: AccountSettingsModel) {
    this.set('preferences', preferences);
  }

  getPreferences(): Observable<AccountSettingsModel> {
    const preferences = this.get<AccountSettingsModel>('preferences');
    return preferences;
  }

  removePreferences() {
    this.remove('preferences');
  }
}
