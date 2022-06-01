import { RequestResponseModel } from './../../../relative/models/request-response.model';
import { RelativeService } from './../../../relative/services/relative.service';
import { RequestDetailsModel } from './../../../relative/models/request-details.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AlertService } from '../../../core/services/alert.service';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-request-notification',
  templateUrl: './request-notification.component.html',
  styleUrls: ['./request-notification.component.scss'],
})
export class RequestNotificationComponent implements OnInit {
  @Input() request: RequestDetailsModel;
  @Input() isSent: boolean = false;
  @Output() refreshNotifications = new EventEmitter<boolean>();

  constructor(
    private alertService: AlertService,
    private translateService: TranslateService,
    private relativeService: RelativeService
  ) {}

  get senderName() {
    return `${this.request.senderUser.firstName} ${this.request.senderUser.lastName}`;
  }
  ngOnInit() {}
  get imageUrl(): string {
    if (this.request.senderUser && this.request.senderUser.imageFile) {
      return `data:${this.request.senderUser.imageFile.mimeType};base64,${this.request.senderUser.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  async confirmRejectRequest() {
    console.log('in reject');
    await this.alertService.presentAlert(
      this.translateService.instant('_relative.decline'),
      this.translateService.instant('_relative.declineMessage', {
        name: `${this.request.senderUser.firstName} ${this.request.senderUser.lastName}`,
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.rejectRequest
    );
  }

  rejectRequest() {
    const response = new RequestResponseModel();
    response.id = this.request.id;
    response.response = false;
    return this.relativeService.respondToRequest(response).subscribe(() => {
      this.refreshNotifications.emit();
    });
  }
}
