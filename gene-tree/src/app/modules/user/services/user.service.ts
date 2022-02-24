/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../models/account-settings.model';
import { CurrentUserModel } from '../../core/models/current-user.model';
import { DataService } from '../../core/services/data.service';
import { StorageService } from '../../core/services/storage.service';

@Injectable({ providedIn: 'root' })
export class UserService extends DataService {
  private userState = new BehaviorSubject<CurrentUserModel>(null);

  constructor(httpClient: HttpClient, private storageService: StorageService) {
    super(httpClient, 'api/user', environment.baseApiUrl);
    this.init();
  }
  init() {
    this.storageService.user$.subscribe((user) => {
      this.userState.next(user);
      if (user && user.userId) {
        this.setPreferences();
      }
    });
  }

  public setPreferences() {
    this.getUserSettings()
      .pipe()
      .subscribe((userSettings) => {
        this.storageService.setPreferences(userSettings);
      });
  }

  public isCurrentUser(userId: Guid) {
    const l = this.userState.value.userId == userId;
    return l;
  }

  public getCurrentUser() {
    return this.userState.value;
  }

  public checkUsernameTaken(username: string): Observable<boolean> {
    return super.getOneByPath<boolean>(
      `usernameAvailable/${username}`,
      DataService.noLoadingConfig
    );
  }

  public checkEmailTaken(email: string): Observable<boolean> {
    return super.getOneByPath<boolean>(
      `emailAvailable/${email}`,
      DataService.noLoadingConfig
    );
  }

  public getPersonalInfo<UserProfileModel>(): Observable<UserProfileModel> {
    const path = `info/${this.userState.getValue().username}`;
    return super.getOneByPath<UserProfileModel>(path);
  }

  public getUser<UserProfileModel>(
    userId: number
  ): Observable<UserProfileModel> {
    return super.getOneById<UserProfileModel>(userId);
  }

  public getUserSettings() {
    return super.getOneById<AccountSettingsModel>(
      this.userState.value.userId,
      'settings',
      DataService.noLoadingConfig
    );
  }

  public saveUserSettings(settings: AccountSettingsModel) {
    return super.updateById<AccountSettingsModel>(
      this.userState.value.userId,
      settings,
      'settings'
    );
  }
}
