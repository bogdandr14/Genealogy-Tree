import { Component, Input, OnInit } from '@angular/core';
import { EventInTreeModel } from 'src/app/modules/genealogy/models/event-in-tree.model';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { UtilsService } from 'src/app/modules/shared/services/utils.service';

@Component({
  selector: 'app-event-notification',
  templateUrl: './event-notification.component.html',
  styleUrls: ['./event-notification.component.scss'],
})
export class EventNotificationComponent implements OnInit {
  @Input() event: EventInTreeModel;
  public currentDate = new Date();
  constructor(public utilsService:UtilsService) {}

  ngOnInit() {}
}
