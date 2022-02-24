import { OccupationService } from './../../../shared/services/occupation.service';
import { OccupationModel } from './../../../user/models/occupation.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-occupation-edit',
  templateUrl: './occupation-edit.component.html',
  styleUrls: ['./occupation-edit.component.scss'],
})
export class OccupationEditComponent {
  @Input() occupation = new OccupationModel();
  @Input() isUpdate = false;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  constructor(
    private modalCtrl: ModalController,
    private occupationService: OccupationService
  ) {}

  onSubmit() {
    if (this.isUpdate) {
      this.occupationService.updateOccupation(this.occupation).subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
    } else {
      this.occupationService.addOccupation(this.occupation).subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
    }
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
