import { PersonModule } from './../person/person.module';
import { SyncedListComponent } from './components/synced-list/synced-list.component';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { SyncPage } from './pages/sync.page';
import { SharedModule } from './../shared/shared.module';
import { NgModule } from '@angular/core';
import { SyncRoutingModule } from './sync-routing.module';
import { LocationsComponent } from './components/locations/locations.component';

@NgModule({
  imports: [SharedModule, SyncRoutingModule, PersonModule],
  declarations: [
    LocationsComponent,
    SyncedListComponent,
    UserSearchComponent,
    SyncPage,
  ],
})
export class SyncModule {}
