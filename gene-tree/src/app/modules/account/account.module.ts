import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { EmailCheckDirective } from './directives/emailCheck.directive';
import { MatchPasswordDirective } from './directives/matchPassword.directive';
import { PasswordPatternDirective } from './directives/passwordPattern.directive';
import { UsernameCheckDirective } from './directives/usernameCheck.directive';
import { RegisterPage } from './pages/register/register.page';
import { LoginPage } from './pages/login/login.page';
import { AccountRoutingModule } from './account-routing.module';
import { SettingsPage } from './pages/settings/settings.page';
import { ProfilePage } from './pages/profile/profile.page';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { ChangePasswordComponent } from './components/change-password/change-password.component';
import { PersonModule } from '../person/person.module';

@NgModule({
  declarations: [
    MatchPasswordDirective,
    PasswordPatternDirective,
    UsernameCheckDirective,
    EmailCheckDirective,
    RegisterPage,
    LoginPage,
    ProfilePage,
    SettingsPage,
    ChangePasswordComponent,
  ],
  imports: [SharedModule, AccountRoutingModule, PersonModule],
  providers: [Clipboard],
})
export class AccountModule {}
