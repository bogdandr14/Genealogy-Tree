import { UtilsService } from './../../../shared/services/utils.service';
import { TranslateService } from '@ngx-translate/core';
import { UpdateInfoModel } from './../../models/update-info.model';
import { RelativeService } from './../../../relative/services/relative.service';
import { RelativeUpdatesModel } from './../../models/relative-updates.model';
import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { UpdateTypeEnum } from '../../models/update-type.enum';

@Component({
  selector: 'app-relative-updates-notification',
  templateUrl: './relative-updates-notification.component.html',
  styleUrls: ['./relative-updates-notification.component.scss'],
})
export class RelativeUpdatesNotificationComponent implements OnInit {
  @Input() relativeUpdate: RelativeUpdatesModel;
  @Output() refreshNotifications = new EventEmitter<boolean>();
  constructor(
    private relativeService: RelativeService,
    private translateService: TranslateService,
    public utilsService: UtilsService
  ) { }

  get relativeName() {
    return `${this.relativeUpdate.relative.firstName} ${this.relativeUpdate.relative.lastName}`;
  }
  ngOnInit() { }

  public getTranslatedMessage(update: UpdateInfoModel) {
    switch (update.updateType) {
      case UpdateTypeEnum.PersonCreated:
        return this.translateService.instant('_updates.personCreated', {
          name: update.affectedPeopleNames[0],
        });
      case UpdateTypeEnum.PersonModified:
        return this.translateService.instant('_updates.personModified', {
          name: update.affectedPeopleNames[0],
        });
      case UpdateTypeEnum.MarriageCreated:
        return this.translateService.instant('_updates.marriageCreated', {
          firstPerson: update.affectedPeopleNames[0],
          secondPerson: update.affectedPeopleNames[1],
        });
      case UpdateTypeEnum.MarriageModified:
        return this.translateService.instant('_updates.marriageModified', {
          firstPerson: update.affectedPeopleNames[0],
          secondPerson: update.affectedPeopleNames[1],
        });
      case UpdateTypeEnum.ParentChildAdded:
        return this.translateService.instant('_updates.parentChildAdded', {
          firstPerson: update.affectedPeopleNames[0],
          secondPerson: update.affectedPeopleNames[1],
        });
    }
  }

  public markAsChecked() {
    this.relativeService.markChangesAsChecked(this.relativeUpdate.relativeId);
  }
}
