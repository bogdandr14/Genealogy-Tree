import { UserEditModel } from './../models/user-edit.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../settings/models/account-settings.model';
import { CurrentUserModel } from '../../core/models/current-user.model';
import { BaseService } from '../../core/services/base.service';
import { DataService } from '../../core/services/data.service';
import { switchMap } from 'rxjs/operators';
import { SupportTicketModel } from '../../support/models/support-ticket.model';
import { InfiniteScrollFilter } from '../../shared/models/infinite-scroll.filter';
import { FoundUsersModel } from '../models/found-users.model';

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
    return userId === this.userState.value.userId;
  }

  public isUserTree(treeId: Guid) {
    return treeId === this.userState.value.treeId;
  }

  public getUserId() {
    return this.userState.value.userId;
  }

  public getUserEmail() {
    return this.userState.value.email;
  }

  public findUsers(filter: InfiniteScrollFilter) {
    return super.getOneByPath<FoundUsersModel>(`find/${this.turnFilterIntoUrl(filter)}`);
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

  public sendSupportTicket(supportTicket: SupportTicketModel): Observable<null> {
    return super.add(supportTicket, 'support');
  }

  public getPersonalInfo<
    AccountProfileModel
  >(): Observable<AccountProfileModel> {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => {
        const path = `info/${user.username}`;
        return super.getOneByPath<AccountProfileModel>(path);
      })
    );
  }

  public getUser<AccountProfileModel>(
    userId: Guid
  ): Observable<AccountProfileModel> {
    return super.getOneById<AccountProfileModel>(userId);
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
