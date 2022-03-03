import { RelativesService } from './../../../services/relatives.service';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { TranslateService } from '@ngx-translate/core';
import { RelativeModel } from './../../../models/relative/relative.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-relative-card',
  templateUrl: './relative-card.component.html',
  styleUrls: ['./relative-card.component.scss'],
})
export class RelativeCardComponent implements OnInit {
  @Input() relative: RelativeModel;
  @Input() isParent: boolean = true;
  @Input() canModify: boolean = false;
  @Output() deleteConfirmed = new EventEmitter<boolean>();

  constructor(
    private translateService: TranslateService,
    private alertService: AlertService,
    private relativesService: RelativesService
  ) {}

  ngOnInit() {}
  get imageUrl(): string {
    if (this.relative && this.relative.imageFile) {
      return `data:${this.relative.imageFile.mimeType};base64,${this.relative.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  async confirmDeleteRelative() {
    await this.alertService.presentAlert(
      this.translateService.instant(
        this.isParent ? '_delete.parent' : '_delete.child'
      ),
      this.translateService.instant(
        this.isParent ? '_delete.parentMessage' : '_delete.childMessage',
        {
          firstName: this.relative.firstName,
          lastName: this.relative.lastName,
        }
      ),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteRelative
    );
  }

  deleteRelative() {
    return this.relativesService
      .deleteRelative(this.relative.relativeId)
      .subscribe(() => {
        this.deleteConfirmed.emit();
      });
  }
}
