import { UtilsService } from '../../../../shared/services/utils.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AlertService } from '../../../../core/services/alert.service';
import { TranslateService } from '@ngx-translate/core';
import { ParentChildBaseModel } from '../../models/parent-child-base.model';
import { ParentChildService } from '../../service/parent-child.service';

@Component({
  selector: 'app-removable-parent-child-chip',
  templateUrl: './removable-parent-child-chip.component.html',
  styleUrls: ['./removable-parent-child-chip.component.scss'],
})
export class RemovableParentChildChipComponent implements OnInit {
  @Input() parentChild: ParentChildBaseModel;
  @Input() isParent: boolean = true;
  @Output() deleteConfirmed = new EventEmitter<boolean>();
  constructor(
    private alertService: AlertService,
    private translateService: TranslateService,
    private parentChildService: ParentChildService,
    public utilsService: UtilsService
  ) { }

  ngOnInit() { }

  async confirmDeleteParentChild() {
    await this.alertService.presentAlert(
      this.translateService.instant(
        this.isParent ? '_delete.parent' : '_delete.child'
      ),
      this.translateService.instant(this.isParent ? '_delete.parentMessage' : '_delete.childMessage', {
        firstName: this.parentChild.firstName,
        lastName: this.parentChild.lastName,
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteParentChild
    );
  }

  deleteParentChild() {
    return this.parentChildService
      .deleteParentChild(this.parentChild.parentChildId)
      .subscribe(() => {
        this.deleteConfirmed.emit(true);
      });
  }
}
