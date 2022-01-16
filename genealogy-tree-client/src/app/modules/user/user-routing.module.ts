import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProfileComponent } from './components/profile/profile.component';
import { SettingsComponent } from './components/settings/settings.component';
import { UserSearchComponent } from './components/user-search/user-search.component';


const routes: Routes = [
  {
    path: '',
    redirectTo: 'profile'
  },
  {
    path: 'profile',
    component: ProfileComponent,
  },
  {
    path: 'search',
    component: UserSearchComponent,
  },
  {
    path: 'settings',
    component: SettingsComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class UserRoutingModule {}
