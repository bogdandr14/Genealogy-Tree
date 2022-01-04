import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { UserModel } from '../models/user.model';
import { DataService } from './data.service';

@Injectable({providedIn: 'root'})
export class UserService extends DataService {
  private user = new BehaviorSubject<UserModel>(new UserModel());
  public user$ = this.user.asObservable();

  constructor(httpClient: HttpClient) {
    super(httpClient, 'user', environment.baseApiUrl);
  }
  public setUser(user: UserModel): void {
    this.user.next(user);
  }
}
