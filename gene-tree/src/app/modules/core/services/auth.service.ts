/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, of, Subscription } from 'rxjs';
import { delay, tap } from 'rxjs/operators';
import { LoginModel } from '../../account/models/login.model';
import { RegisterModel } from '../../account/models/register.model';
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
    return super.post<LoginResponseModel>('login', userCredentials).pipe(
      tap((login) => {
        this.storageService.setJWT(login.token);
        this.setUserInfo(login);
        this.router.navigate(['home']);
      })
    );
  }

  public register(registerDetails: RegisterModel): Observable<void> {
    const path = `register`;
    return super.post<void>(path, registerDetails);
  }

  public logout(): void {
    this.timerSubscription.unsubscribe();
    this.storageService.removeJWT();
    this.storageService.removeUser();
    this.storageService.removePreferences();
    this.router.navigate(['account', 'login']);
  }

  public isLoggedIn(): boolean {
    return this.authState.value;
  }

  private setUserInfo(loginResponse: LoginResponseModel) {
    const tokenInfo = JSON.parse(atob(loginResponse.token.split('.')[1]));
    this.storageService.setUser({
      userId: loginResponse.userId,
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
