import { ParentChildModule } from './parent-child/parent-child.module';
import { PersonCardComponent } from './components/person-card/person-card.component';
import { PersonInfoComponent } from './components/person-info/person-info.component';
import { LocationEditComponent } from './components/location-edit/location-edit.component';
import { PersonEditPage } from './pages/person-edit/person-edit.page';
import { PersonDetailsPage } from './pages/person-details/person-details.page';
import { NgModule } from '@angular/core';
import { PersonRoutingModule } from './person-routing.module';
import { SharedModule } from '../shared/shared.module';
import { PhotoUploadComponent } from './components/photo-upload/photo-upload.component';
import { FileMaxSizeDirective } from './directives/file-max-size.directive';
import { PersonAvatarComponent } from './components/person-avatar/person-avatar.component';
import { NgxImageCompressService } from 'ngx-image-compress';
import { MarriageModule } from './marriage/marriage.module';
import { RouterModule } from '@angular/router';
@NgModule({
  declarations: [
    PhotoUploadComponent,
    PersonDetailsPage,
    PersonEditPage,
    FileMaxSizeDirective,
    LocationEditComponent,
    PersonInfoComponent,
    PersonAvatarComponent,
    PersonCardComponent,
  ],
  imports: [SharedModule, MarriageModule, ParentChildModule, PersonRoutingModule, RouterModule],
  exports: [PhotoUploadComponent, PersonInfoComponent, PersonAvatarComponent, PersonCardComponent],
  providers: [NgxImageCompressService],
})
export class PersonModule { }
