/* eslint-disable no-debugger */
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/modules/core/services/auth.service';
import { UserService } from 'src/app/modules/core/services/user.service';
import { UserSettingsModel } from '../../models/user-settings.model';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],
})
export class SettingsComponent implements OnInit {
  public userSettings: UserSettingsModel = new UserSettingsModel();
  constructor(
    private router: Router,
    private userService: UserService,
    public authService: AuthService
  ) {}

  ngOnInit() {
    if (this.authService.isLoggedIn()) {
      const user = JSON.parse(sessionStorage.getItem('user'));
      this.userService.getUserSettings(user.username).subscribe((settings) => {
        this.userSettings = settings;
      });
    }
  }

  saveSettings(){
    //this.userService.saveSettings();
  }

  onLanguageChange(language: string){
    this.userSettings.languagePreference = language;
  }
  onThemeChange(theme: boolean){
    this.userSettings.themePreference = theme;
  }

  onLogout() {
    this.authService.logout();
    this.router.navigateByUrl('/auth');
  }
}
