import { Component, OnInit, ViewChild } from '@angular/core';
import { IonAccordionGroup } from '@ionic/angular';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { UserService } from 'src/app/modules/core/services/user.service';
import { UserProfileModel } from '../../models/user-profile.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent implements OnInit {
  @ViewChild(IonAccordionGroup, { static: true })
  accordionGroup: IonAccordionGroup;
  personalInfo: UserProfileModel;
  public occupations: any[] = [];
  public educations: any[] = [];
  constructor(
    private clipboard: Clipboard,
    private alertService: AlertService,
    private userService: UserService,
  ) {}

  ngOnInit() {
    const user = JSON.parse(sessionStorage.getItem('user'));
    if (!!user) {
      this.userService
        .getPersonalInfo<UserProfileModel>(user.username)
        .subscribe((res) => {
          this.personalInfo = res;
        });
    }
  }

  copyPhone(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_informationMessage.phoneCopied');
  }

  copyMail(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_informationMessage.emailCopied');
  }
}
