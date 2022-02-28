import { RelativeOptionCardComponent } from './components/relative-option-card/relative-option-card.component';
import { LinkedRelativeAddComponent } from './components/linked-relative-add/linked-relative-add.component';
import { LinkedRelativesListComponent } from './components/linked-relatives-list/linked-relatives-list.component';
import { MarriageListComponent } from './components/marriage-list/marriage-list.component';
import { PersonCardComponent } from './components/person-card/person-card.component';
import { PersonInfoComponent } from './components/person-info/person-info.component';
import { LocationEditComponent } from './components/location-edit/location-edit.component';
import { PersonEditPage } from './pages/person-edit/person-edit.page';
import { PersonDetailsPage } from './pages/person-details/person-details.page';
import { RelativesListPage } from './pages/relatives-list/relatives-list.page';
import { NgModule } from '@angular/core';
import { PersonRoutingModule } from './person-routing.module';
import { SharedModule } from '../shared/shared.module';
import { PhotoUploadComponent } from './components/photo-upload/photo-upload.component';
import { FileMaxSizeDirective } from './directives/file-max-size.directive';
import { PersonAvatarComponent } from './components/person-avatar/person-avatar.component';
import { RemovableRelativeChipComponent } from './components/removable-relative-chip/removable-relative-chip.component';

@NgModule({
  declarations: [
    PhotoUploadComponent,
    PersonDetailsPage,
    RelativesListPage,
    PersonEditPage,
    FileMaxSizeDirective,
    LocationEditComponent,
    PersonInfoComponent,
    PersonAvatarComponent,
    PersonCardComponent,
    MarriageListComponent,
    LinkedRelativesListComponent,
    LinkedRelativeAddComponent,
    RelativeOptionCardComponent,
    RemovableRelativeChipComponent
  ],
  imports: [SharedModule, PersonRoutingModule],
  exports: [
    PhotoUploadComponent,
    PersonInfoComponent,
    PersonAvatarComponent
  ]
})
export class PersonModule { }
