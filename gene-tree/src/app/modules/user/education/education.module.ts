import { SharedModule } from './../../shared/shared.module';
import { EducationListComponent } from './components/education-list/education-list.component';
import { EducationEditComponent } from './components/education-edit/education-edit.component';
import { NgModule } from '@angular/core';



@NgModule({
  declarations: [
    EducationEditComponent,
    EducationListComponent
  ],
  imports: [
    SharedModule
  ],
  exports: [
    EducationEditComponent,
    EducationListComponent
  ]
})
export class EducationModule { }
