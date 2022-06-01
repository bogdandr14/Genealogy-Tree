import { UserCardComponent } from './components/user-card/user-card.component';
import { PersonModule } from './../person/person.module';
import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { UserRoutingModule } from './user-routing.module';
import { UserInfoComponent } from './components/user-info/user-info.component';
import { EmailCheckDirective } from './directives/emailCheck.directive';
import { MatchPasswordDirective } from './directives/matchPassword.directive';
import { PasswordPatternDirective } from './directives/passwordPattern.directive';
import { UsernameCheckDirective } from './directives/usernameCheck.directive';
import { LoginPage } from './pages/login/login.page';
import { ProfilePage } from './pages/profile/profile.page';
import { RegisterPage } from './pages/register/register.page';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { UserEditComponent } from './components/user-edit/user-edit.component';
import { EducationModule } from './education/education.module';
import { OccupationModule } from './occupation/occupation.module';

@NgModule({
  declarations: [
    MatchPasswordDirective,
    PasswordPatternDirective,
    UsernameCheckDirective,
    EmailCheckDirective,
    RegisterPage,
    LoginPage,
    ProfilePage,
    UserInfoComponent,
    UserEditComponent,
    UserCardComponent,
  ],
  imports: [SharedModule, UserRoutingModule, PersonModule, EducationModule, OccupationModule],
  exports: [UserInfoComponent, MatchPasswordDirective, PasswordPatternDirective, UserCardComponent],
  providers: [Clipboard],
})
export class UserModule { }
