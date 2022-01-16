import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../shared/shared.module';
import { UserRoutingModule } from './user-routing.module';
import { ProfileComponent } from './components/profile/profile.component';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { CoreModule } from '../core/core.module';
import { SettingsComponent } from './components/settings/settings.component';

@NgModule({
  declarations: [
    ProfileComponent,
    UserSearchComponent,
    UserSearchComponent,
    SettingsComponent,
  ],
  imports: [SharedModule, UserRoutingModule],
})
export class UserModule {}
