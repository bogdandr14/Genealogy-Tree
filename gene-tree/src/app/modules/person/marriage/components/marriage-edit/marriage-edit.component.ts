import { MarriageDetailsModel } from '../../models/marriage-details.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MarriageService } from '../../service/marriage.service';
import { MarriageEditModel } from '../../models/marriage-edit.model';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-marriage-edit',
  templateUrl: './marriage-edit.component.html',
  styleUrls: ['./marriage-edit.component.scss'],
})
export class MarriageEditComponent implements OnInit {
  @Input() set marriageId(marriageId: number) {
    this.marriageService.getMarriage(marriageId).subscribe((marriage) => {
      this.setMarriage(marriage);
    });
  }
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public marriageDetails = new MarriageDetailsModel();
  public marriageUpdate = new MarriageEditModel();
  constructor(
    private marriageService: MarriageService,
    private modalCtrl: ModalController
  ) {}

  ngOnInit() {}

  setMarriage(marriage: MarriageDetailsModel) {
    this.marriageDetails = marriage;
    this.marriageUpdate = {
      id: marriage.id,
      startDate: marriage.marriageStarted,
      endDate: marriage.marriageEnded,
      firstPersonId: marriage.firstPerson.personId,
      secondPersonId: marriage.personMarriedTo.personId,
    };
  }

  editMarriage() {
    this.marriageService.updateMarriage(this.marriageUpdate).subscribe(() => {
      this.saveConfirmed.emit(true);
      this.dismiss();
    });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
