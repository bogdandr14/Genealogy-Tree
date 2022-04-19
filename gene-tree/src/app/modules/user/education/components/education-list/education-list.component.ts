import { TranslateService } from '@ngx-translate/core';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { EducationService } from './../../service/education.service';
import { Component, Input, OnInit } from '@angular/core';
import { EducationModel } from '../../models/education.model';
import { Guid } from 'guid-typescript';

@Component({
  selector: 'app-education-list',
  templateUrl: './education-list.component.html',
  styleUrls: ['./education-list.component.scss'],
})
export class EducationListComponent implements OnInit {
  @Input() educations: EducationModel[];
  @Input() userId: Guid;
  @Input() canModify: boolean = false;
  private educationToDelete: EducationModel;
  constructor(
    private educationService: EducationService,
    private alertService: AlertService,
    private translateService: TranslateService
  ) { }

  ngOnInit() { }

  refreshEducation() {
    this.educationService
      .getEducationsForUser(this.userId)
      .subscribe((educations) => this.educations = educations);
  }

  async confirmDeleteEducation(education: EducationModel) {
    this.educationToDelete = education;
    await this.alertService.presentAlert(
      this.translateService.instant('_delete.education'),
      this.translateService.instant('_delete.educationMessage', {
        instituteName: education.educationInstituteName,
        educationLevel: this.translateService.instant(
          '_educationlevels.' + education.educationLevel.name.toLowerCase()
        ),
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteEducation
    );
  }
  deleteEducation() {
    return this.educationService
      .deleteEducation(this.educationToDelete.id)
      .subscribe(() => {
        this.refreshEducation();
      });
  }
}
