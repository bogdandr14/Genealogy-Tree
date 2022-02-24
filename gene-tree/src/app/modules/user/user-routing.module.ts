import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../core/guards/auth.guard';
import { LoginGuard } from '../core/guards/login.guard';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { LoginPage } from './pages/login/login.page';
import { ProfilePage } from './pages/profile/profile.page';
import { RegisterPage } from './pages/register/register.page';
import { SettingsPage } from './pages/settings/settings.page';


const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'login'
  },
  {
    path: 'login',
    component: LoginPage,
    canActivate: [LoginGuard],
  },
  {
    path: 'register',
    component: RegisterPage,
    canActivate: [LoginGuard],
  },
  {
    path: 'profile',
    component: ProfilePage,
    canActivate: [AuthGuard]
  },
  {
    path: 'settings',
    component: SettingsPage,
    canActivate: [AuthGuard]
  },
  {
    path: 'search',
    component: UserSearchComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class UserRoutingModule {}
