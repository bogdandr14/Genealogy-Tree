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
  private token = new BehaviorSubject<string>('');
  public token$ = this.token.asObservable();

  private user = new BehaviorSubject<CurrentUserModel>(new CurrentUserModel());
  public user$ = this.user.asObservable();

  private darkTheme = new BehaviorSubject<boolean>(false);
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
    this.getJWT().subscribe((value) => this.token.next(value));
    this.getCurrentUser().subscribe((value) => this.user.next(value));
    this.getPreferences().subscribe((value) => this.checkPreferences(value));
    this.storageReady.next(true);
  }

  checkPreferences(preferences: AccountSettingsModel) {
    if (preferences) {
      this.darkTheme.next(preferences.themePreference);
      this.language.next(preferences.languagePreference);
    } else {
      this.darkTheme.next(false);
      this.language.next(environment.defaultLanguage);
    }
  }

  setTheme(theme: boolean) {
    this.darkTheme.next(theme);
  }

  setLanguage(language: string) {
    this.language.next(language);
  }

  setJWT(token: string | null) {
    this.set('jwt', token);
    debugger;
    this.token.next(token);
  }

  getJWT(): Observable<string | null> {
    const jwt = this.get<string>('jwt');
    return jwt;
  }

  removeJWT() {
    this.remove('jwt');
    this.token.next(null);
  }

  setCurrentUser(user: CurrentUserModel) {
    this.set('user', user);
    this.user.next(user);
  }

  getCurrentUser(): Observable<CurrentUserModel | null> {
    const user = this.get<CurrentUserModel>('user');
    return user;
  }

  removeUser() {
    this.remove('user');
    this.user.next(null);
  }

  setPreferences(preferences: AccountSettingsModel) {
    this.set('preferences', preferences);
    this.checkPreferences(preferences);
  }

  getPreferences(): Observable<AccountSettingsModel> {
    const preferences = this.get<AccountSettingsModel>('preferences');
    return preferences;
  }

  removePreferences() {
    this.remove('preferences');
    this.darkTheme.next(false);
    this.language.next(environment.defaultLanguage);
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
}
