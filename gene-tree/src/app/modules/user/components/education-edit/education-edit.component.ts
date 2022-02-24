import { EducationService } from './../../../shared/services/education.service';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { EducationModel } from './../../../user/models/education.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-education-edit',
  templateUrl: './education-edit.component.html',
  styleUrls: ['./education-edit.component.scss'],
})
export class EducationEditComponent implements OnInit {
  @Input() education = new EducationModel();
  @Input() isUpdate = false;
  @Output() saveConfirmed = new EventEmitter<boolean>();
  public educationLevels: CommonObject[] = [];

  constructor(
    private modalCtrl: ModalController,
    private educationService: EducationService
  ) {}

  ngOnInit() {
    this.educationService.getEducationLevels().subscribe((levels) => {
      this.educationLevels = levels;
    });
  }
  onSubmit() {
    if (this.isUpdate) {
      this.educationService.updateEducation(this.education).subscribe(() => {
        this.saveConfirmed.emit(true);
      });
    } else {
      this.educationService.addEducation(this.education).subscribe(() => {
        this.saveConfirmed.emit(true);
      });
    }
    this.dismiss();
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
