import { SharedModule } from './../shared/shared.module';
import { SyncedListPage } from './pages/synced-list/synced-list.page';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';


import { SyncRoutingModule } from './sync-routing.module';
import { UserSearchPage } from './pages/user-search/user-search.page';

@NgModule({
  imports: [
    SharedModule,
    SyncRoutingModule,
  ],
  declarations: [SyncedListPage, UserSearchPage
  ]
})
export class SyncModule { }
