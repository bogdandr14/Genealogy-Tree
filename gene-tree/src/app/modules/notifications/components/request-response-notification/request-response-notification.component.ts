import { RequestResponseModel } from './../../../relative/models/request-response.model';
import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { RelativeService } from 'src/app/modules/relative/services/relative.service';
import { UtilsService } from 'src/app/modules/shared/services/utils.service';

@Component({
  selector: 'app-request-response-notification',
  templateUrl: './request-response-notification.component.html',
  styleUrls: ['./request-response-notification.component.scss'],
})
export class RequestResponseNotificationComponent implements OnInit {
  @Input() requestResponse: RequestResponseModel;
  @Output() refreshNotifications = new EventEmitter<boolean>();
  constructor(private relativeService: RelativeService,
    public utilsService: UtilsService) { }

  get receiverName() {
    return `${this.requestResponse.receiverUser.firstName} ${this.requestResponse.receiverUser.lastName}`;
  }
  ngOnInit() { }

  removeResponse() {
    this.relativeService
      .removeRequest(this.requestResponse.id)
      .subscribe(() => this.refreshNotifications.emit());
  }
}
