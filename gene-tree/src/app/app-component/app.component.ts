import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { AuthService } from '../modules/core/services/auth.service';
import { DataService } from '../modules/core/services/data.service';
import { UserService } from '../modules/user/services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class AppComponent {
  dark = false;
  constructor(
    public authService: AuthService,
    private dataService: DataService,
    private translateService: TranslateService,
    private userService: UserService
  ) {
    this.loadData();
  }

  loadData() {
    this.dataService.getPreferences().subscribe((preferences) => {
      if (preferences != null) {
        if(preferences.languagePreference != null){
          this.translateService.use(preferences.languagePreference);
        }
        if(preferences.themePreference!=null){
          this.dark = preferences.themePreference;
        }
      }
      this.setSubscribers();
    });
  }

  private setSubscribers() {
    this.dataService.darkTheme$.subscribe((theme) => {
      if (theme != null && this.dark != theme) {
        this.dark = theme;
      }
    });
    this.dataService.language$.subscribe((language) => {
      if (language != null) {
        this.translateService.use(language);
      }
    });
  }
}
