import { OccupationService } from './../../service/occupation.service';
import { OccupationModel } from '../../models/occupation.model';
import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { take } from 'rxjs/operators';
import { iif } from 'rxjs';

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
  ) { }

  onSubmit() {
    iif(() => this.isUpdate,
      this.occupationService.updateOccupation(this.occupation),
      this.occupationService.addOccupation(this.occupation)
    ).pipe(take(1)).subscribe(() => {
      this.saveConfirmed.emit(true);
      this.dismiss();
    });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
