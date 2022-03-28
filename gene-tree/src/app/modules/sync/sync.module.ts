import { SyncPage } from './pages/sync/sync.page';
import { SharedModule } from './../shared/shared.module';
import { SyncedListPage } from './pages/synced-list/synced-list.page';
import { NgModule } from '@angular/core';



import { SyncRoutingModule } from './sync-routing.module';
import { UserSearchPage } from './pages/user-search/user-search.page';

@NgModule({
  imports: [
    SharedModule,
    SyncRoutingModule,
  ],
  declarations: [SyncedListPage, UserSearchPage, SyncPage
  ]
})
export class SyncModule { }
