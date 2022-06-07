import { AlertService } from 'src/app/modules/core/services/alert.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { Router } from '@angular/router';
import { MarriedPersonModel } from '../../models/married-person.model';
import { MarriageService } from '../../service/marriage.service';
import { first } from 'rxjs/operators';
import { UtilsService } from '../../../../shared/services/utils.service';

@Component({
  selector: 'app-marriage-card',
  templateUrl: './marriage-card.component.html',
  styleUrls: ['./marriage-card.component.scss'],
})
export class MarriageCardComponent implements OnInit {
  @Input() marriage: MarriedPersonModel;
  @Input() canModify: boolean = false;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  constructor(
    private marriageService: MarriageService,
    private translateService: TranslateService,
    private alertService: AlertService,
    public router: Router,
    public utilsService: UtilsService
  ) { }

  ngOnInit() { }

  async confirmDeleteMarriage() {
    await this.alertService.presentAlert(
      this.translateService.instant('_delete.marriage'),
      this.translateService.instant('_delete.marriageMessage', {
        firstName: this.marriage.personMarriedTo.firstName,
        lastName: this.marriage.personMarriedTo.lastName,
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteMarriage
    );
  }

  deleteMarriage() {
    return this.marriageService.deleteMarriage(this.marriage.id)
      .pipe(first())
      .subscribe(() => {
        this.saveConfirmed.emit();
      });
  }
}
