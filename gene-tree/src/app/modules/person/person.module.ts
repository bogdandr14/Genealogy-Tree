import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PeopleListComponent } from './components/people-list/people-list.component';
import { PersonEditComponent } from './components/person-edit/person-edit.component';
import { PersonDetailComponent } from './components/person-detail/person-detail.component';
import { PersonRoutingModule } from './person-routing.module';
import { SharedModule } from '../shared/shared.module';
import { PhotoUploadComponent } from './components/photo-upload/photo-upload.component';

@NgModule({
  declarations: [
    PeopleListComponent,
    PersonEditComponent,
    PersonDetailComponent,
    PhotoUploadComponent
  ],
  imports: [CommonModule,SharedModule, PersonRoutingModule],
  exports:[
    PhotoUploadComponent
  ]
})
export class PersonModule {}
