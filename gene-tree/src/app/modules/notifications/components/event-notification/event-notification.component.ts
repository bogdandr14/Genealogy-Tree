import { Component, Input, OnInit } from '@angular/core';
import { EventInTreeModel } from 'src/app/modules/genealogy/models/event-in-tree.model';
import { ImageFile } from 'src/app/modules/shared/models/image-file';

@Component({
  selector: 'app-event-notification',
  templateUrl: './event-notification.component.html',
  styleUrls: ['./event-notification.component.scss'],
})
export class EventNotificationComponent implements OnInit {
  @Input() event: EventInTreeModel;
  public currentDate = new Date();
  constructor() {}

  ngOnInit() {}
  public getImageUrl(imageFile: ImageFile) {
    if (imageFile) {
      return `data:${imageFile.mimeType};base64,${imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

}
