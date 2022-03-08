import { UserEditModel } from './../models/user-edit.model';
/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../models/account-settings.model';
import { CurrentUserModel } from '../../core/models/current-user.model';
import { BaseService } from '../../core/services/base.service';
import { DataService } from '../../core/services/data.service';

@Injectable({ providedIn: 'root' })
export class UserService extends BaseService {
  private userState = new BehaviorSubject<CurrentUserModel>(null);

  constructor(httpClient: HttpClient, private dataService: DataService) {
    super(httpClient, 'api/user', environment.baseApiUrl);
    this.loadUser();
  }
  loadUser() {
    this.dataService.getCurrentUser().subscribe((user) => {
      this.userState.next(user);
      if (user && user.userId) {
        this.setPreferences();
      }
      this.initUserSubscriber();
    });
  }
  private initUserSubscriber() {
    this.dataService.user$.subscribe((user) => {
      this.userState.next(user);
      if (user && user.userId) {
        this.setPreferences();
      }
    });
  }

  public setPreferences() {
    this.getUserSettings().subscribe((userSettings) => {
      this.dataService.setPreferences(userSettings);
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
      BaseService.noLoadingConfig
    );
  }

  public checkEmailTaken(email: string): Observable<boolean> {
    return super.getOneByPath<boolean>(
      `emailAvailable/${email}`,
      BaseService.noLoadingConfig
    );
  }

  public getPersonalInfo<UserProfileModel>(): Observable<UserProfileModel> {
    const path = `info/${this.userState.value.username}`;
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
      BaseService.noLoadingConfig
    );
  }

  public saveUserSettings(settings: AccountSettingsModel) {
    return super.updateById<AccountSettingsModel>(
      this.userState.value.userId,
      settings,
      'settings'
    );
  }

  public updateUserInfo(userEdit: UserEditModel) {
    return super.updateById<AccountSettingsModel>(
      this.userState.value.userId,
      userEdit
    );
  }
}
