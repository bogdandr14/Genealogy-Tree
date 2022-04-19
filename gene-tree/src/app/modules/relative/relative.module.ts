import { PersonModule } from './../person/person.module';
import { RelativeMapComponent } from './components/relative-map/relative-map.component';
import { RelativeSearchComponent } from './components/relative-search/relative-search.component';
import { RelativeListComponent } from './components/relative-list/relative-list.component';
import { SharedModule } from './../shared/shared.module';
import { NgModule } from '@angular/core';
import { RelativePage } from './page/relative.page';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { RelativePageRoutingModule } from './relative-routing.module';

@NgModule({
  declarations: [
    RelativePage,
    RelativeListComponent,
    RelativeSearchComponent,
    RelativeMapComponent
  ],
  imports: [
    SharedModule,
    RelativePageRoutingModule,
    PersonModule,
    Ng2SearchPipeModule
  ],
})
export class RelativePageModule { }
