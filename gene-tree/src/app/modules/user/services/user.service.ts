/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../account/models/account-settings.model';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
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
      if (user && user.username) {
        this.setPreferences(user.username);
      }
    });
  }

  public setPreferences(username: string) {
    if (username) {
      this.getUserSettings(username)
        .pipe()
        .subscribe((userSettings) => {
          this.storageService.setPreferences(userSettings);
        });
    }
  }

  public isCurrentUser(userId: Guid) {
    const l = this.userState.value.userId == userId;
    console.log("🚀 ~ file: user.service.ts ~ line 42 ~ UserService ~ isCurrentUser ~ l", l)
    return l;
  }

  public getCurrentUser(){
    return this.userState.value;
  }

  public getUserSettings(username: string) {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path = `settings/${username}`;
    return super.getOneByPath<AccountSettingsModel>(path, params);
  }

  public saveUserSettings(settings: AccountSettingsModel) {
    const path = `settings/update`;
    return super.put<AccountSettingsModel>(path, settings);
  }

  public checkUsernameTaken(username: string): Observable<boolean> {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path = `usernameAvailable/${username}`;
    return super.getOneByPath<boolean>(path, params);
  }

  public checkEmailTaken(email: string): Observable<boolean> {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path = `emailAvailable/${email}`;
    return super.getOneByPath<boolean>(path, params);
  }

  public getPersonalInfo<UserProfileModel>(): Observable<UserProfileModel> {
    const path = `info/${this.userState.getValue().username}`;
    return super.getOneByPath<UserProfileModel>(path);
  }
}
