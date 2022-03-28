import { GenealogyListComponent } from './components/genealogy-list/genealogy-list.component';
import { GenealogyTreeComponent } from './components/genealogy-tree/genealogy-tree.component';
import { NgModule } from '@angular/core';

import { GenealogyPageRoutingModule } from './genealogy-routing.module';

import { GenealogyPage } from './page/genealogy.page';
import { SharedModule } from '../shared/shared.module';
import { PersonModule } from '../person/person.module';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

@NgModule({
  imports: [
    SharedModule,
    GenealogyPageRoutingModule,
    PersonModule,
    Ng2SearchPipeModule
  ],
  declarations: [GenealogyPage, GenealogyTreeComponent, GenealogyListComponent]
})
export class GenealogyPageModule { }
