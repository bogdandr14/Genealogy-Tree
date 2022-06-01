import { RequestResponseModel } from './../../../relative/models/request-response.model';
import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { RelativeService } from 'src/app/modules/relative/services/relative.service';

@Component({
  selector: 'app-request-response-notification',
  templateUrl: './request-response-notification.component.html',
  styleUrls: ['./request-response-notification.component.scss'],
})
export class RequestResponseNotificationComponent implements OnInit {
  @Input() requestResponse: RequestResponseModel;
  @Output() refreshNotifications = new EventEmitter<boolean>();
  constructor(private relativeService: RelativeService) {}

  get receiverName() {
    return `${this.requestResponse.receiverUser.firstName} ${this.requestResponse.receiverUser.lastName}`;
  }
  ngOnInit() {}
  get imageUrl(): string {
    if (
      this.requestResponse.receiverUser &&
      this.requestResponse.receiverUser.imageFile
    ) {
      return `data:${this.requestResponse.receiverUser.imageFile.mimeType};base64,${this.requestResponse.receiverUser.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }
  removeResponse() {
    this.relativeService
      .removeRequest(this.requestResponse.id)
      .subscribe(() => this.refreshNotifications.emit());
  }
}
