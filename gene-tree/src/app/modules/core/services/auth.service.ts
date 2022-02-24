/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, of, Subscription } from 'rxjs';
import { delay, tap } from 'rxjs/operators';
import { ChangePasswordModel } from '../../user/models/change-password.model';
import { LoginModel } from '../../user/models/login.model';
import { RegisterModel } from '../../user/models/register.model';

import { LoginResponseModel } from '../models/login-response.model';
import { DataService } from './data.service';
import { StorageService } from './storage.service';

@Injectable({ providedIn: 'root' })
export class AuthService extends DataService {
  private timerSubscription = new Subscription();
  private authState = new BehaviorSubject(false);

  constructor(
    public http: HttpClient,
    private router: Router,
    private storageService: StorageService
  ) {
    super(http, 'api/auth');
    this.checkLoggedIn();
  }

  checkLoggedIn() {
    this.storageService.token$.subscribe((token) => {
      this.authState.next(!!token);
      if (token) {
        this.setExpirationCounter(token);
      }
    });
  }

  public login(userCredentials: LoginModel): Observable<LoginResponseModel> {
    return super.add<LoginResponseModel>(userCredentials, 'login').pipe(
      tap((login) => {
        this.storageService.setJWT(login.token);
        this.setUserInfo(login);
        this.router.navigate(['home']);
      })
    );
  }

  public register(registerDetails: RegisterModel): Observable<void> {
    return super.add<void>(registerDetails, 'register');
  }

  public async changePassword(changePassword: ChangePasswordModel) {
    const user = await this.storageService.getCurrentUser();
    changePassword.username = user.username;
    return super.update<void>(changePassword, 'changePassword');
  }

  public logout(): void {
    this.timerSubscription.unsubscribe();
    this.storageService.removeJWT();
    this.storageService.removeUser();
    this.storageService.removePreferences();
    this.router.navigate(['user', 'login']);
  }

  public isLoggedIn(): boolean {
    return this.authState.value;
  }

  private setUserInfo(loginResponse: LoginResponseModel) {
    const tokenInfo = JSON.parse(atob(loginResponse.token.split('.')[1]));
    this.storageService.setCurrentUser({
      personId: loginResponse.personId,
      userId: tokenInfo.jti,
      treeId: loginResponse.treeId,
      firstName: tokenInfo.given_name,
      lastName: tokenInfo.family_name,
      username: tokenInfo.unique_name,
    });
  }

  private setExpirationCounter(token: string) {
    const expiration = <number>JSON.parse(atob(token.split('.')[1])).exp * 1000; //expiration in milliseconds
    const timeout = expiration - new Date().valueOf();
    if (timeout < 0) {
      this.logout();
    } else {
      this.timerSubscription.unsubscribe();
      this.timerSubscription = of(null)
        .pipe(delay(timeout))
        .subscribe((expired) => {
          console.log('TOKEN EXPIRED!!');
          this.logout();
        });
    }
  }
}
