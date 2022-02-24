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
  public educationLevels: CommonObject[];
  public selectedStartDate: Date;
  public selectedEndDate: Date;

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
    this.education.endDate = new Date(this.education.endDate);
    this.education.startDate = new Date(this.education.startDate);

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

  formatDate(date: string): Date {
    return new Date(date);
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
