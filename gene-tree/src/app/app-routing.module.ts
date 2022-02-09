import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './modules/core/guards/auth.guard';

const routes: Routes = [
  {
    path: 'home',
    loadChildren: () => import('./pages/home/home.module').then( m => m.HomePageModule),
    canActivate:[AuthGuard]
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'account',
    loadChildren: () =>
      import('./modules/account/account.module').then((m) => m.AccountModule),
  },
  {
    path: 'user',
    loadChildren: () =>
      import('./modules/user/user.module').then((m) => m.UserModule),
    canActivate: [AuthGuard],
  },
  {
    path: 'person',
    loadChildren: () =>
      import('./modules/person/person.module').then((m) => m.PersonModule),
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
