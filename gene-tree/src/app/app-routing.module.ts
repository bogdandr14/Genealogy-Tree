import { AuthGuard } from './modules/core/guards/auth.guard';
import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { IntroGuard } from './modules/core/guards/intro.guard';

const routes: Routes = [
  {
    path: 'home',
    loadChildren: () => import('./modules/home/home.module').then(m => m.HomePageModule),
    canLoad: [IntroGuard],
    data: { title: '_pages.home' }
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'user',
    loadChildren: () => import('./modules/user/user.module').then((m) => m.UserModule),
  },
  {
    path: 'person',
    loadChildren: () => import('./modules/person/person.module').then((m) => m.PersonModule),
    canLoad: [AuthGuard]
  },
  {
    path: 'intro',
    loadChildren: () => import('./modules/intro/intro.module').then(m => m.IntroPageModule),
    data: { title: '_pages.intro' }
  },
  {
    path: 'support',
    loadChildren: () => import('./modules/support/support.module').then(m => m.SupportPageModule),
    data: { title: '_pages.support' }
  },
  {
    path: 'map',
    loadChildren: () => import('./modules/map/map.module').then(m => m.MapPageModule),
    data: { title: '_pages.map' }
  },
  {
    path: 'tree',
    loadChildren: () => import('./modules/tree/tree.module').then(m => m.TreePageModule),
    data: { title: '_pages.tree' }
  },
  {
    path: 'settings',
    loadChildren: () => import('./modules/settings/settings.module').then(m => m.SettingsPageModule),
    data: { title: '_pages.settings' }
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
