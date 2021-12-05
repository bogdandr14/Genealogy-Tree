import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { AuthPage } from './auth-page/auth.page';
import { LoginComponent } from './auth-page/login/login.component';
import { SignupComponent } from './auth-page/signup/signup.component';

const routes: Routes = [
  {
    path: '',
    component: AuthPage,
  },
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
  ],
  declarations: [AuthPage, LoginComponent, SignupComponent],
})
export class AuthPageModule {}
