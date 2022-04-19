import { SharedModule } from './../../shared/shared.module';
import { NgModule } from '@angular/core';
import { OccupationEditComponent } from './components/occupation-edit/occupation-edit.component';
import { OccupationListComponent } from './components/occupation-list/occupation-list.component';

@NgModule({
  declarations: [OccupationEditComponent, OccupationListComponent],
  imports: [
    SharedModule
  ],
  exports: [OccupationEditComponent, OccupationListComponent],

})
export class OccupationModule { }
