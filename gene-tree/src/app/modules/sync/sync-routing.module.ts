import { SyncedListPage } from './pages/synced-list/synced-list.page';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserSearchPage } from './pages/user-search/user-search.page';


const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'list'
  },
  {
    path: 'list',
    component: SyncedListPage,
    data: { title: '_pages.relatives' }
  },
  {
    path: 'search',
    component: UserSearchPage,
    data: { title: '_pages.findRelatives' }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SyncRoutingModule { }
