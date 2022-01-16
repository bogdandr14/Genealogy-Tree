/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable, of, Subscription } from 'rxjs';
import { delay, tap } from 'rxjs/operators';
import { LoginModel } from '../../auth/models/login.model';
import { RegisterModel } from '../../auth/models/register.model';
import { LoginResponseModel } from '../models/login-response.model';
import { DataService } from './data.service';
import { UserService } from './user.service';

@Injectable({ providedIn: 'root' })
export class AuthService extends DataService {
  timerSubscription = new Subscription();
  constructor(public http: HttpClient, private router: Router, private userService: UserService) {
    super(http, 'api/auth');
    if (this.isLoggedIn()) {
      this.setExpirationCounter();
    }
  }


  public login(userCredentials: LoginModel): Observable<LoginResponseModel> {
    return super
      .post<LoginResponseModel>('login', userCredentials)
      .pipe(
        tap(login => {
          this.setJwt(login.token);
          this.setExpirationCounter();
          this.setUserInfo(login);
          this.router.navigate(['home']);
        }));
  }

  public register(registerDetails: RegisterModel): Observable<void> {
    debugger;
    const path = `register`;

    return super
      .post<void>(path, registerDetails);
  }

  public logout(): void {
    this.timerSubscription.unsubscribe();
    sessionStorage.removeItem('token');
    this.router.navigate(['auth', 'login']);
  }

  public isLoggedIn(): boolean {
    return !!this.getJwt();
  }
  public getJwt(): string | null {
    return sessionStorage.getItem('token');
  }

  private setJwt(token: string): void {
    sessionStorage.setItem('token', token);
  }

  private getTokenExpiration(): number {
    const token = this.getJwt();
    const expiration = <number>(JSON.parse(atob(token.split('.')[1]))).exp * 1000; //expiration in milliseconds
    return expiration;
  }

  private setUserInfo(loginResponse: LoginResponseModel) {
    const tokenInfo = (JSON.parse(atob(loginResponse.token.split('.')[1])));
    sessionStorage.setItem('user',JSON.stringify({ username: tokenInfo.unique_name, firstName: tokenInfo.given_name, lastName: tokenInfo.family_name, treeId: loginResponse.treeId, userId: loginResponse.userId }));
    this.userService.setUser({ id: loginResponse.userId, treeId: loginResponse.treeId, firstName: tokenInfo.given_name, lastName: tokenInfo.family_name });
  }

  private setExpirationCounter() {
    const expiration = this.getTokenExpiration();
    const timeout = expiration - new Date().valueOf();
    if (timeout < 0) {
      this.logout();
    }
    else {
      this.timerSubscription.unsubscribe();
      this.timerSubscription = of(null).pipe(delay(timeout)).subscribe((expired) => {
        console.log('EXPIRED!!');
        this.logout();
      });
    }
  }
}
