import { UtilsService } from './../../../../shared/services/utils.service';
import { ParentChildService } from '../../service/parent-child.service';
import { AlertService } from '../../../../core/services/alert.service';
import { TranslateService } from '@ngx-translate/core';
import { ParentChildBaseModel } from '../../models/parent-child-base.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { take } from 'rxjs/operators';

@Component({
  selector: 'app-parent-child-card',
  templateUrl: './parent-child-card.component.html',
  styleUrls: ['./parent-child-card.component.scss'],
})
export class ParentChildCardComponent implements OnInit {
  @Input() parentChild: ParentChildBaseModel;
  @Input() isParent: boolean = true;
  @Input() canModify: boolean = false;
  @Output() deleteConfirmed = new EventEmitter<boolean>();

  constructor(
    private translateService: TranslateService,
    private alertService: AlertService,
    private parentChildService: ParentChildService,
    public utilsService: UtilsService
  ) { }

  ngOnInit() { }

  async confirmDeleteParentChild() {
    await this.alertService.presentAlert(
      this.translateService.instant(
        this.isParent ? '_delete.parent' : '_delete.child'
      ),
      this.translateService.instant(
        this.isParent ? '_delete.parentMessage' : '_delete.childMessage',
        {
          firstName: this.parentChild.firstName,
          lastName: this.parentChild.lastName,
        }
      ),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteParentChild
    );
  }

  deleteParentChild() {
    return this.parentChildService
      .deleteParentChild(this.parentChild.parentChildId)
      .pipe(take(1))
      .subscribe(() => {
        this.deleteConfirmed.emit();
      });
  }
}
