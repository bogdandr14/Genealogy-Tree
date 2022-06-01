import { AccountProfileModel } from './../models/profile.model';
import { NotificationsBundle } from './../../notifications/models/nofitications-bundle.model';
import { UserPositionModel } from './../../genealogy/models/user-position.model';
import { PositionModel } from './../../genealogy/models/position.model';
import { UserEditModel } from '../models/user-edit.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable, Subscription, timer } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AccountSettingsModel } from '../../settings/models/account-settings.model';
import { CurrentUserModel } from '../../core/models/current-user.model';
import { BaseService } from '../../core/services/base.service';
import { DataService } from '../../core/services/data.service';
import { switchMap, tap } from 'rxjs/operators';
import { SupportTicketModel } from '../../support/models/support-ticket.model';
import { InfiniteScrollFilter } from '../../shared/models/infinite-scroll.filter';
import { FoundUsersModel } from '../models/found-users.model';

@Injectable({ providedIn: 'root' })
export class UserService extends BaseService {
  private userState = new BehaviorSubject<CurrentUserModel>(null);
  private notificationCount = new BehaviorSubject<number>(0);
  public notificationCount$ = this.notificationCount.asObservable();
  private notificationSubscription: Subscription;

  constructor(httpClient: HttpClient, private dataService: DataService) {
    super(httpClient, 'api/user', environment.baseApiUrl);
    this.initUserSubscriber();
  }

  private initUserSubscriber() {
    this.dataService.user$.subscribe((user) => {
      this.userState.next(user);
      if (user && Object.keys(user).length > 0) {
        this.notificationSubscription = timer(100, 60000)
          .pipe(
            switchMap(() => this.getNotificationsCount()),
            tap((count) => this.notificationCount.next(count))
          )
          .subscribe();
      } else if (this.notificationSubscription) {
        this.notificationSubscription.unsubscribe();
      }
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

  public getNotificationsCount(){
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getOneByPath<number>(`notificationsCount/${user.userId}`,BaseService.noLoadingConfig)
    ));
  }

  public getNotifications(){
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getOneByPath<NotificationsBundle>(`notifications/${user.userId}`)
    ));
  }

  public findUsers(filter: InfiniteScrollFilter) {
    return super.getOneByPath<FoundUsersModel>(`find/${this.turnFilterIntoUrl(filter)}`);
  }

  public checkUsernameTaken(username: string): Observable<boolean> {
    return super.getOneByPath<boolean>(
      `usernameAvailable/${username}`, BaseService.noLoadingConfig
    );
  }

  public checkEmailTaken(email: string): Observable<boolean> {
    return super.getOneByPath<boolean>(
      `emailAvailable/${email}`, BaseService.noLoadingConfig
    );
  }

  public sendSupportTicket(supportTicket: SupportTicketModel): Observable<null> {
    return super.add(supportTicket, 'support');
  }

  public getPersonalInfo<AccountProfileModel>(): Observable<AccountProfileModel> {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getOneByPath<AccountProfileModel>(`info/${user.username}`)
    ));
  }

  public getUser<AccountProfileModel>(userId: Guid | string): Observable<AccountProfileModel> {
    return super.getOneById<AccountProfileModel>(userId);
  }

  public getTreeRoot<AccountProfileModel>(treeId: Guid|string):Observable<AccountProfileModel>{
    return super.getOneById<AccountProfileModel>(treeId, 'treeRoot');
  }

  public getUserSettings() {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getOneById<AccountSettingsModel>(user.userId, 'settings', BaseService.noLoadingConfig)
    ));
  }

  public saveUserSettings(settings: AccountSettingsModel) {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.updateById<AccountSettingsModel>(user.userId, settings, 'settings')
    ));
  }

  public updateUserInfo(userEdit: UserEditModel) {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.updateById<AccountSettingsModel>(user.userId, userEdit)
    ));
  }
  public updateUserPosition(position: PositionModel) {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.updateById<UserPositionModel>(user.userId, position, 'position')
    ));
  }
}
