import { PersonInfoComponent } from './components/person-info/person-info.component';
import { PersonDeleteComponent } from './components/person-delete/person-delete.component';
import { LocationEditComponent } from './components/location-edit/location-edit.component';
import { PersonEditPage } from './pages/person-edit/person-edit.page';
import { LinkUserButtonsComponent } from './components/link-user-buttons/link-user-buttons.component';
import { PersonDetailsPage } from './pages/person-details/person-details.page';
import { RelativesListPage } from './pages/relatives-list/relatives-list.page';
import { NgModule } from '@angular/core';
import { PersonRoutingModule } from './person-routing.module';
import { SharedModule } from '../shared/shared.module';
import { PhotoUploadComponent } from './components/photo-upload/photo-upload.component';
import { FileMaxSizeDirective } from './directives/file-max-size.directive';

@NgModule({
  declarations: [
    PhotoUploadComponent,
    PersonDetailsPage,
    RelativesListPage,
    PersonEditPage,
    FileMaxSizeDirective,
    LinkUserButtonsComponent,
    LocationEditComponent,
    PersonDeleteComponent,
    PersonInfoComponent
  ],
  imports: [SharedModule, PersonRoutingModule],
  exports:[
    PhotoUploadComponent,
    PersonInfoComponent
  ]
})
export class PersonModule {}
