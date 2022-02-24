import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { EducationModel } from '../../models/education.model';

@Component({
  selector: 'app-education-list',
  templateUrl: './education-list.component.html',
  styleUrls: ['./education-list.component.scss'],
})
export class EducationListComponent implements OnInit {
  @Input() educations: EducationModel[];
  @Output() refreshRequested = new EventEmitter();
  constructor() {}

  ngOnInit() {}

  refreshEducation() {
    this.refreshRequested.emit();
  }
}
