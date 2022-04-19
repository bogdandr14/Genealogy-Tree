import { UserService } from '../../../user/service/user.service';
import { DataService } from './../../../core/services/data.service';
import { AlertService } from './../../../core/services/alert.service';
import { AuthService } from './../../../core/services/auth.service';
import { Component, OnInit, ViewChild, OnDestroy } from '@angular/core';
import { NgForm } from '@angular/forms';
import { filter, switchMap, take } from 'rxjs/operators';

import { AccountSettingsModel } from '../../models/account-settings.model';

@Component({
  selector: 'app-preference-settings',
  templateUrl: './preference-settings.component.html',
  styleUrls: ['./preference-settings.component.scss'],
})
export class PreferenceSettingsComponent implements OnInit, OnDestroy {
  @ViewChild('form') ngForm: NgForm;
  public userSettings: AccountSettingsModel = new AccountSettingsModel();
  public openModal = false;
  constructor(
    private userService: UserService,
    public authService: AuthService,
    private dataService: DataService,
    private alertService: AlertService
  ) { }

  ngOnInit() {
    this.authService.isLoggedIn$.pipe(filter((isLoggedIn) => isLoggedIn),
      take(1),
      switchMap(() => this.userService.getUserSettings())
    ).subscribe((settings) => {
      this.userSettings = settings;
    });
  }


  saveSettings() {
    this.userService
      .saveUserSettings(this.userSettings).pipe(take(1))
      .subscribe((settings) => {
        this.ngForm.form.markAsPristine();
        this.dataService.setPreferences(settings);
        this.alertService.showSuccess('_message._success.preferencesSaved');
      });
  }

  ngOnDestroy(): void {
    if (this.ngForm.dirty) {
      this.alertService.showWarning('_message._warning.unsavedPreferences');
    }
  }
}
