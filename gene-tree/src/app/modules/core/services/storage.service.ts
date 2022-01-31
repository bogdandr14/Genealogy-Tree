/* eslint-disable no-debugger */
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../account/models/account-settings.model';
import { UserModel } from '../models/user.model';
import { Storage } from '@ionic/storage-angular';

@Injectable({
  providedIn: 'root',
})
export class StorageService {
  private _storage: Storage | null = null;

  private token = new BehaviorSubject<string>('');
  public token$ = this.token.asObservable();

  private user = new BehaviorSubject<UserModel>(new UserModel());
  public user$ = this.user.asObservable();

  private darkTheme = new BehaviorSubject<boolean>(false);
  public darkTheme$ = this.darkTheme.asObservable();

  private language = new BehaviorSubject<string>(environment.defaultLanguage);
  public language$ = this.language.asObservable();

  constructor(private storage: Storage) {
    this.init();
  }

  private async init() {
    this._storage = await this.storage.create();

    this.token.next(await this.getJWT());
    this.user.next(await this.getUser());
    const preferences = await this.getPreferences();
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
    this.token.next(token);
  }

  async getJWT(): Promise<string | null> {
    const jwt = await this.get<string>('jwt');
    return jwt;
  }

  removeJWT() {
    this.remove('jwt');
    this.token.next(null);
  }

  setUser(user: UserModel) {
    this.set('user', user);
    this.user.next(user);
  }

  async getUser(): Promise<UserModel | null> {
    const user = await this.get<UserModel>('user');
    return user;
  }

  removeUser() {
    this.remove('user');
    this.user.next(null);
  }

  setPreferences(preferences: AccountSettingsModel) {
    this.set('preferences', preferences);
    this.darkTheme.next(preferences.themePreference);
    this.language.next(preferences.languagePreference);
  }

  async getPreferences(): Promise<AccountSettingsModel> {
    const preferences = await this.get<AccountSettingsModel>('preferences');
    return preferences;
  }

  removePreferences() {
    this.remove('preferences');
    this.darkTheme.next(false);
    this.language.next(environment.defaultLanguage);
  }

  set(key: string, value: any) {
    this._storage.set(key, JSON.stringify(value));
  }

  async get<T>(key: string): Promise<T | null> {
    const value = <T>JSON.parse(await this._storage.get(key));
    return value;
  }

  remove(key: string) {
    this._storage.remove(key);
  }
}
