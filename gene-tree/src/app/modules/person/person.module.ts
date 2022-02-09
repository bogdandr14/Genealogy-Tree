import { LocationEditComponent } from './components/location-edit/location-edit.component';
import { PersonEditPage } from './pages/person-edit/person-edit.page';
import { PersonDeleteCardComponent } from './components/person-delete-card/person-delete-card.component';
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
    PersonDeleteCardComponent,
    LocationEditComponent
  ],
  imports: [SharedModule, PersonRoutingModule],
  exports:[
    PhotoUploadComponent
  ]
})
export class PersonModule {}
