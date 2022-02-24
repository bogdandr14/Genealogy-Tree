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
  @ViewChild(IonAccordionGroup, { static: true })
  accordionGroup: IonAccordionGroup;
  personalInfo: AccountProfileModel;
  public image;
  constructor(
    private alertService: AlertService,
    private userService: UserService,
    private clipboard: Clipboard
  ) {}

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

  get imageUrl() {
    if (this.personalInfo && this.personalInfo.imageFile) {
      return `data:${this.personalInfo.imageFile.mimeType};base64,${this.personalInfo.imageFile.fileInBytes}`;
    } else {
      return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
    }
  }

  setImageFile(image: ImageFile) {
    this.personalInfo.imageFile = image;
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
