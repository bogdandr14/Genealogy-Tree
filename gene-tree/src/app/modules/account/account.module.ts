import { OccupationEditComponent } from './components/occupation-edit/occupation-edit.component';
import { EducationEditComponent } from './components/education-edit/education-edit.component';
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
import { UserModule } from '../user/user.module';

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
    EducationEditComponent,
    OccupationEditComponent
  ],
  imports: [SharedModule, AccountRoutingModule, PersonModule, UserModule],
  providers: [Clipboard],
})
export class AccountModule {}
