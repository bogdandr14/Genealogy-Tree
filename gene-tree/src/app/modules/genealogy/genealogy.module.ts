import { GenealogyEventsComponent } from './components/genealogy-events/genealogy-events.component';
import { GenealogyListComponent } from './components/genealogy-list/genealogy-list.component';
import { GenealogyTreeComponent } from './components/genealogy-tree/genealogy-tree.component';
import { NgModule } from '@angular/core';

import { GenealogyPageRoutingModule } from './genealogy-routing.module';

import { GenealogyPage } from './page/genealogy.page';
import { SharedModule } from '../shared/shared.module';
import { PersonModule } from '../person/person.module';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { NgCalendarModule } from 'ionic2-calendar';

@NgModule({
  imports: [
    SharedModule,
    GenealogyPageRoutingModule,
    PersonModule,
    Ng2SearchPipeModule,
    NgCalendarModule
  ],
  declarations: [GenealogyPage, GenealogyTreeComponent, GenealogyListComponent, GenealogyEventsComponent]
})
export class GenealogyPageModule { }
