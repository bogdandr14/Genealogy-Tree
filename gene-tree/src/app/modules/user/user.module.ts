import { PersonModule } from './../person/person.module';
import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { UserRoutingModule } from './user-routing.module';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { UserInfoComponent } from './components/user-info/user-info.component';
import { EducationEditComponent } from './components/education-edit/education-edit.component';
import { OccupationEditComponent } from './components/occupation-edit/occupation-edit.component';
import { EmailCheckDirective } from './directives/emailCheck.directive';
import { MatchPasswordDirective } from './directives/matchPassword.directive';
import { PasswordPatternDirective } from './directives/passwordPattern.directive';
import { UsernameCheckDirective } from './directives/usernameCheck.directive';
import { LoginPage } from './pages/login/login.page';
import { ProfilePage } from './pages/profile/profile.page';
import { RegisterPage } from './pages/register/register.page';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { OccupationListComponent } from './components/occupation-list/occupation-list.component';
import { EducationListComponent } from './components/education-list/education-list.component';
import { UserEditComponent } from './components/user-edit/user-edit.component';


@NgModule({
  declarations: [
    MatchPasswordDirective,
    PasswordPatternDirective,
    UsernameCheckDirective,
    EmailCheckDirective,
    RegisterPage,
    LoginPage,
    ProfilePage,
    EducationEditComponent,
    OccupationEditComponent,
    UserSearchComponent,
    UserInfoComponent,
    OccupationListComponent,
    EducationListComponent,
    UserEditComponent
  ],
  imports: [SharedModule, UserRoutingModule, PersonModule],
  exports: [UserInfoComponent, MatchPasswordDirective, PasswordPatternDirective],
  providers: [Clipboard],
})
export class UserModule { }
