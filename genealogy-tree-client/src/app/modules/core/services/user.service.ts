import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../models/http-interceptor-config.model';
import { UserModel } from '../models/user.model';
import { DataService } from './data.service';

@Injectable({ providedIn: 'root' })
export class UserService extends DataService {
  private user = new BehaviorSubject<UserModel>(new UserModel());
  public user$ = this.user.asObservable();

  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/user', environment.baseApiUrl);
  }
  public setUser(user: UserModel): void {
    this.user.next(user);
  }

  public checkUsernameTaken(username: string): Observable<boolean> {
    const params: HttpInterceptorConfig={hideLoading: true};
    const path = `usernameAvailable/${username}`;
    return this.getOneByPath<boolean>(path, params);
  }

  public checkEmailTaken(email: string): Observable<boolean> {
    const params: HttpInterceptorConfig={hideLoading: true};
    const path = `emailAvailable/${email}`;
    return this.getOneByPath<boolean>(path, params);
  }

  public getPersonalInfo<UserProfileModel>(
    username: string,
  ): Observable<UserProfileModel> {
    const path = `info/${username}`;
    return this.getOneByPath<UserProfileModel>(path);
  }
}
