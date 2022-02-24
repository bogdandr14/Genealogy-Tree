import { UserDetailsModel } from './../../models/user-details.model';
import { Component, Input, OnInit } from '@angular/core';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { Clipboard } from '@ionic-native/clipboard/ngx';

@Component({
  selector: 'app-user-info',
  templateUrl: './user-info.component.html',
  styleUrls: ['./user-info.component.scss'],
})
export class UserInfoComponent implements OnInit {
 @Input() userInfo: UserDetailsModel;
  constructor(private alertService: AlertService,
    private clipboard: Clipboard) { }

  ngOnInit() {}

  copyPhone(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_message._information.phoneCopied');
  }

  copyMail(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo('_message._information.emailCopied');
  }
}
