import { MarriageEditComponent } from './components/marriage/marriage-edit/marriage-edit.component';
import { MarriageAddComponent } from './components/marriage/marriage-add/marriage-add.component';
import { LinkedRelativeAddComponent } from './components/relative/linked-relative-add/linked-relative-add.component';
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
import { MarriageCardComponent } from './components/marriage/marriage-card/marriage-card.component';
import { MarriageListComponent } from './components/marriage/marriage-list/marriage-list.component';
import { LinkedRelativesListComponent } from './components/relative/linked-relatives-list/linked-relatives-list.component';
import { RelativeOptionCardComponent } from './components/relative/relative-option-card/relative-option-card.component';
import { RemovableRelativeChipComponent } from './components/relative/removable-relative-chip/removable-relative-chip.component';
import { RelativeCardComponent } from './components/relative/relative-card/relative-card.component';

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
    RemovableRelativeChipComponent,
    MarriageAddComponent,
    MarriageCardComponent,
    RelativeCardComponent,
    MarriageEditComponent
  ],
  imports: [SharedModule, PersonRoutingModule],
  exports: [
    PhotoUploadComponent,
    PersonInfoComponent,
    PersonAvatarComponent
  ]
})
export class PersonModule { }
