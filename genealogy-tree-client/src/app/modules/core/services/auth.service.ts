import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';
import { LoginModel } from '../../auth/models/login.model';
import { RegisterModel } from '../../auth/models/register.model';
import { LoginResponseModel } from '../models/login-response.model';
import { DataService } from './data.service';
import { UserService } from './user.service';

@Injectable({providedIn: 'root'})
export class AuthService extends DataService {
  constructor(public http: HttpClient, private router: Router, private usserService: UserService) {
    super(http, 'authenticate');
  }

  public login(userCredentials: LoginModel): Observable<LoginResponseModel> {
    return super
      .post<LoginResponseModel>('login', userCredentials)
      .pipe(
        tap(login => {
        this.setJwt(login.token);
        this.usserService.setUser({id: login.id, fullName: login.fullName})
        this.router.navigate(['']);
      }));
  }

  public register(registerDetails: RegisterModel): Observable<void> {
    const path = `register`;

    return super
      .post<void>(path, registerDetails);
  }

  public logout(): void {
    sessionStorage.removeItem('token');
    this.router.navigate(['auth', 'login']);
  }

  public isLoggedIn(): boolean {
    return !!this.getJwt();
  }

  private setJwt(tokens: string): void {
    sessionStorage.setItem('token', tokens);
  }

  public getJwt(): string | null {
    return sessionStorage.getItem('token');
  }
}
