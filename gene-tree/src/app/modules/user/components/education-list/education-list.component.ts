import { UserService } from 'src/app/modules/user/services/user.service';
import { EducationService } from './../../../shared/services/education.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
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
  constructor(private educationService: EducationService) {}

  ngOnInit() {}

  refreshEducation() {
    this.educationService
      .getEducationsForUser(this.userId)
      .subscribe((educations) => {
        this.educations = educations;
      });
  }
}
