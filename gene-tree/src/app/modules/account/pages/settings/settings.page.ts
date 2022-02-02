import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/modules/core/services/auth.service';
import { StorageService } from 'src/app/modules/core/services/storage.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { AccountSettingsModel } from '../../models/account-settings.model';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.page.html',
  styleUrls: ['./settings.page.scss'],
})
export class SettingsPage implements OnInit {
  public userSettings: AccountSettingsModel = new AccountSettingsModel();
  public openModal = false;
  constructor(
    private router: Router,
    private userService: UserService,
    public authService: AuthService,
    public storageService: StorageService
  ) {}

  ngOnInit() {
    if (this.authService.isLoggedIn()) {
      this.storageService.getPreferences().then((settings) => {
        this.userSettings = settings;
      });
    }
  }

  saveSettings() {
    this.userService
      .saveUserSettings(this.userSettings)
      .subscribe((settings) => this.storageService.setPreferences(settings));
  }

  onLanguageChange(language: string) {
    this.userSettings.languagePreference = language;
  }
  onThemeChange(theme: boolean) {
    this.userSettings.themePreference = theme;
  }

  onLogout() {
    this.authService.logout();
    this.router.navigateByUrl('/account');
  }
}
