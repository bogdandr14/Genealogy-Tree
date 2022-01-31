import { HttpClient } from '@angular/common/http';
import {
  Injectable,
  Injector,
  Renderer2,
  RendererFactory2,
} from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { UserSettingsModel } from '../../user/models/user-settings.model';
import { HttpInterceptorConfig } from '../models/http-interceptor-config.model';
import { UserModel } from '../models/user.model';
import { DataService } from './data.service';

@Injectable({ providedIn: 'root' })
export class UserService extends DataService {
  private user = new BehaviorSubject<UserModel>(new UserModel());
  public user$ = this.user.asObservable();
  private renderer: Renderer2;

  constructor(
    httpClient: HttpClient,
    private injector: Injector,
    rendererFactory: RendererFactory2
  ) {
    super(httpClient, 'api/user', environment.baseApiUrl);
    this.renderer = rendererFactory.createRenderer(null, null);
  }
  public setUser(user: UserModel): void {
    this.setPreferences();
    this.user.next(user);
  }

  public async setPreferences() {
    const username = JSON.parse(sessionStorage.getItem('user')).username;
    if (username) {
      this.getUserSettings(username)
        .pipe()
        .subscribe((userSettings) => {
          let translateService = this.injector.get(TranslateService);
          if (userSettings.themePreference) {
            this.renderer.setAttribute(document.body, 'color-theme', 'dark');
          } else {
            this.renderer.setAttribute(document.body, 'color-theme', 'light');
          }
          if (userSettings.languagePreference) {
            translateService.use(userSettings.languagePreference);
          }
        });
    }
  }

  public isCurrentUser(userId: string) {
    const id = JSON.parse(sessionStorage.getItem('user')).userId;
    return id == userId;
  }

  public getUserSettings(username: string) {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path = `settings/${username}`;
    return super.getOneByPath<UserSettingsModel>(path, params);
  }

  public saveUserSettings(settings: UserSettingsModel) {
    const path = `settings/update`;
    return super.put<UserSettingsModel>(path, settings);
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

  public getPersonalInfo<UserProfileModel>(
    username: string
  ): Observable<UserProfileModel> {
    const path = `info/${username}`;
    return super.getOneByPath<UserProfileModel>(path);
  }
}
