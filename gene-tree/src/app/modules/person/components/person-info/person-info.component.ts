import { PersonService } from './../../services/person.service';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { Component, Input, OnInit } from '@angular/core';
import { PersonEditModel } from '../../models/person/person-edit.model';
import { LocationModel } from 'src/app/modules/shared/models/location.model';
import { TranslateService } from '@ngx-translate/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-person-info',
  templateUrl: './person-info.component.html',
  styleUrls: ['./person-info.component.scss'],
})
export class PersonInfoComponent implements OnInit {
  @Input() personInfo: PersonEditModel;
  @Input() showHeader = true;
  @Input() canModify: boolean = false;
  constructor(
    private userService: UserService,
    public router: Router,
    private translateService: TranslateService,
    private alertService: AlertService,
    private PersonService: PersonService
  ) { }

  ngOnInit() { }
  public get canDelete() {
    return (
      this.canModify && !this.userService.isCurrentUser(this.personInfo?.userId)
    );
  }

  getLocationText(location: LocationModel) {
    let locationText = '';
    if (location) {
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
    if (locationText.length == 0) {
      locationText = this.translateService.instant('_common.unknown');
    }
    return locationText;
  }

  async confirmDeletePerson() {
    await this.alertService.presentAlert(
      this.translateService.instant('_delete.person'),
      this.translateService.instant('_delete.personMessage', {
        firstName: this.personInfo.firstName,
        lastName: this.personInfo.lastName,
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deletePerson
    );
  }

  deletePerson() {
    return this.PersonService.deletePerson(this.personInfo.personId)
      .subscribe(() => {
        this.router.navigate(['/person/list'])
      });
  }
}
