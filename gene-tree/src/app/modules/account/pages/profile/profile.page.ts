import { Component, OnInit, ViewChild } from '@angular/core';
import { IonAccordionGroup } from '@ionic/angular';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AccountProfileModel } from '../../models/profile.model';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  @ViewChild(IonAccordionGroup, { static: true })
  accordionGroup: IonAccordionGroup;
  personalInfo: AccountProfileModel;
  public occupations: any[] = [];
  public educations: any[] = [];
  private clipboard: Clipboard;
  constructor(
    private alertService: AlertService,
    private userService: UserService
  ) {}

  ngOnInit() {
    this.userService.getPersonalInfo<AccountProfileModel>().pipe(first()).subscribe((res) => {
      this.personalInfo = res;
    });
  }

  copyPhone(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_message._information.phoneCopied');
  }

  copyMail(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_message._information.emailCopied');
  }
}
