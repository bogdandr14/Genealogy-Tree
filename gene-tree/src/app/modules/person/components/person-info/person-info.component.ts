import { UserService } from 'src/app/modules/user/services/user.service';
import { Component, Input, OnInit } from '@angular/core';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { PersonEditModel } from '../../models/person/person-edit.model';
import { LocationModel } from 'src/app/modules/shared/models/location.model';
import { state } from '@angular/animations';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-person-info',
  templateUrl: './person-info.component.html',
  styleUrls: ['./person-info.component.scss'],
})
export class PersonInfoComponent implements OnInit {
  @Input() personInfo: PersonEditModel;
  @Input() showHeader = true;
  constructor(private userService: UserService, private translateService: TranslateService) { }

  ngOnInit() { }
  public get canDelete() {
    return !this.userService.isCurrentUser(this.personInfo?.userId);
  }
  getLocationText(location: LocationModel) {
    let locationText = '';
    if (location){
      if (location.state != null && location.state.length > 0) {
        locationText += location.state;
      }
      if (location.country != null && location.country.length > 0) {
        if (locationText.length > 0) {
          locationText += ',';
        }
        locationText += location.country;
      }
      if (location.city != null && location.city.length > 0) {
        if (locationText.length > 0) {
          locationText += ',';
        }
        locationText += location.city;
      }
    }
    if(locationText.length == 0){
      locationText = this.translateService.instant('_common.unknown');
    }
    return locationText;
  }
}
