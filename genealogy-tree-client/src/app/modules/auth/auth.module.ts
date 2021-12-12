import { NgModule } from '@angular/core';
import { AuthRoutingModule } from './auth-routing.module';

import { SharedModule } from '../shared/shared.module';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { MatchPasswordDirective } from './directives/matchPassword.directive';
import { PasswordPatternDirective } from './directives/passwordPattern.directive';
import { CommonModule } from '@angular/common';

@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    MatchPasswordDirective,
    PasswordPatternDirective,
  ],
  imports: [SharedModule, AuthRoutingModule],
  providers: []
})
export class AuthModule {}
