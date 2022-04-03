import { LocationsComponent } from './components/locations/locations.component';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { SyncedListComponent } from './components/synced-list/synced-list.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SyncPage } from './pages/sync.page';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: '/sync/list',
  },
  {
    path: '',
    component: SyncPage,
    children: [
      {
        path: 'list',
        component: SyncedListComponent,
        data: { title: '_pages.relatives' },
      },
      {
        path: 'search',
        component: UserSearchComponent,
        data: { title: '_pages.findRelatives' },
      },
      {
        path: 'location',
        component: LocationsComponent,
        data: { title: '_pages.location' }
      }
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SyncRoutingModule {}
