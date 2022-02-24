import { Component, Input, OnInit } from '@angular/core';
import { Guid } from 'guid-typescript';
import { OccupationService } from 'src/app/modules/shared/services/occupation.service';
import { OccupationModel } from '../../models/occupation.model';

@Component({
  selector: 'app-occupation-list',
  templateUrl: './occupation-list.component.html',
  styleUrls: ['./occupation-list.component.scss'],
})
export class OccupationListComponent implements OnInit {
  @Input() occupations: OccupationModel[];
  @Input() userId: Guid;
  @Input() canModify: boolean = false;
  constructor(
    private occupationService: OccupationService,
  ) {}

  ngOnInit() {}

  refreshOccupation() {
    this.occupationService
      .getOccupationsForUser(this.userId)
      .subscribe((occupations) => {
        this.occupations = occupations;
      });
  }
}
