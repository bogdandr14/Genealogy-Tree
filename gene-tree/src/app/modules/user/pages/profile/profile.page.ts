import { Component, OnInit, ViewChild } from '@angular/core';
import { IonAccordionGroup } from '@ionic/angular';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AccountProfileModel } from '../../models/profile.model';
import { first } from 'rxjs/operators';
import { ImageFile } from 'src/app/modules/shared/models/image-file';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  personalInfo: AccountProfileModel;
  constructor(private userService: UserService) {}

  ngOnInit() {
    this.setProfileInfo();
  }

  setProfileInfo() {
    this.userService
      .getPersonalInfo<AccountProfileModel>()
      .pipe(first())
      .subscribe((res) => {
        this.personalInfo = res;
      });
  }

  get isCurrentUser() {
    return this.userService.isCurrentUser(this.personalInfo?.userId);
  }
}
