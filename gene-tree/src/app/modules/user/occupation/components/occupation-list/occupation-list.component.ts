import { AlertService } from 'src/app/modules/core/services/alert.service';
import { Component, Input, OnInit } from '@angular/core';
import { Guid } from 'guid-typescript';
import { OccupationService } from '../../service/occupation.service';
import { OccupationModel } from '../../models/occupation.model';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-occupation-list',
  templateUrl: './occupation-list.component.html',
  styleUrls: ['./occupation-list.component.scss'],
})
export class OccupationListComponent implements OnInit {
  @Input() occupations: OccupationModel[];
  @Input() userId: Guid;
  @Input() canModify: boolean = false;
  private occupationToDelete: OccupationModel;
  constructor(
    private occupationService: OccupationService,
    private alertService: AlertService,
    private translateService: TranslateService
  ) { }

  ngOnInit() { }

  refreshOccupation() {
    this.occupationService
      .getOccupationsForUser(this.userId)
      .subscribe((occupations) => {
        this.occupations = occupations;
      });
  }

  async confirmDeleteOccupation(occupation: OccupationModel) {
    this.occupationToDelete = occupation;
    await this.alertService.presentAlert(
      this.translateService.instant('_delete.occupation'),
      this.translateService.instant('_delete.occupationMessage', {
        occupationName: occupation.occupationName,
        workingPlace: occupation.workingPlaceName,
      }),
      this.translateService.instant('_common.cancel'),
      this.translateService.instant('_common.confirm'),
      this,
      this.deleteOccupation
    );
  }

  deleteOccupation() {
    return this.occupationService
      .deleteOccupation(this.occupationToDelete.id)
      .subscribe(() => {
        this.refreshOccupation();
      });
  }
}
