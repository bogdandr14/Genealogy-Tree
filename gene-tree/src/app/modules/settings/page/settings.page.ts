import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/modules/core/services/auth.service';
import { DataService } from 'src/app/modules/core/services/data.service';
import { UserService } from 'src/app/modules/user/service/user.service';
import { AccountSettingsModel } from '../models/account-settings.model';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.page.html',
  styleUrls: ['./settings.page.scss'],
})
export class SettingsPage implements OnInit {
  public openModal = false;
  constructor(
    private router: Router,
    public authService: AuthService,
    public dataService: DataService
  ) {}

  ngOnInit() {
  }

  onLogout() {
    this.authService.logout();
    this.router.navigateByUrl('/user');
  }
}
