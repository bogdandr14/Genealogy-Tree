import { UserEditModel } from './../models/user-edit.model';
/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../settings/models/account-settings.model';
import { CurrentUserModel } from '../../core/models/current-user.model';
import { BaseService } from '../../core/services/base.service';
import { DataService } from '../../core/services/data.service';
import { mergeMap } from 'rxjs/operators';
import { SupportTicketModel } from '../../support/models/support-ticket.model';

@Injectable({ providedIn: 'root' })
export class UserService extends BaseService {
  private userState = new BehaviorSubject<CurrentUserModel>(null);

  constructor(httpClient: HttpClient, private dataService: DataService) {
    super(httpClient, 'api/user', environment.baseApiUrl);
    this.initUserSubscriber();
  }

  private initUserSubscriber() {
    this.dataService.user$.subscribe((user) => {
      this.userState.next(user);
    });
  }

  public isCurrentUser(userId: Guid) {
    return this.userState.value.userId == userId;
  }

  public getLoggedInUser() {
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

  public sendSupportTicket(supportTicket: SupportTicketModel): Observable<null>{
    return super.add(supportTicket, 'support');
  }

  public getPersonalInfo<UserProfileModel>(): Observable<UserProfileModel> {
    return this.dataService.getCurrentUser().pipe(
      mergeMap((user) => {
        const path = `info/${user.username}`;
        return super.getOneByPath<UserProfileModel>(path);
      })
    );
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
