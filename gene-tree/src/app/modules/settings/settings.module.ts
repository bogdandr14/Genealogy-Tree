import { PreferenceSettingsComponent } from './components/preference-settings/preference-settings.component';
import { UserModule } from './../user/user.module';
import { AccessibilitySettingsComponent } from './components/accessibility-settings/accessibility-settings.component';
import { NgModule } from '@angular/core';
import { SettingsPageRoutingModule } from './settings-routing.module';

import { SettingsPage } from './page/settings.page';
import { ChangePasswordComponent } from './components/change-password/change-password.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  imports: [
    SharedModule,
    SettingsPageRoutingModule,
    UserModule
  ],
  declarations: [SettingsPage, AccessibilitySettingsComponent, ChangePasswordComponent, PreferenceSettingsComponent]
})
export class SettingsPageModule { }
