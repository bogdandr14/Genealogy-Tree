import { AlertService } from 'src/app/modules/core/services/alert.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { Router } from '@angular/router';
import { MarriedPersonModel } from '../../../models/marriage/married-person.model';
import { MarriageService } from '../../../services/marriage.service';
import { first } from 'rxjs/operators';

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
  ) {}

  ngOnInit() {}
  get imageUrl(): string {
    if (this.marriage && this.marriage.personMarriedTo.imageFile) {
      return `data:${this.marriage.personMarriedTo.imageFile.mimeType};base64,${this.marriage.personMarriedTo.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

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
