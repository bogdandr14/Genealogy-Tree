import { ParentChildModule } from './parent-child/parent-child.module';
import { PersonInfoComponent } from './components/person-info/person-info.component';
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
    PersonInfoComponent,
    PersonAvatarComponent,
  ],
  imports: [SharedModule, MarriageModule, ParentChildModule, PersonRoutingModule, RouterModule],
  exports: [PhotoUploadComponent, PersonInfoComponent, PersonAvatarComponent],
  providers: [NgxImageCompressService],
})
export class PersonModule { }
