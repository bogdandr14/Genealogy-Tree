import { OccupationModel } from './../../user/models/occupation.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../../../environments/environment';
import { BaseService } from '../../core/services/base.service';
import { UserService } from '../../user/services/user.service';
import { Observable } from 'rxjs';
import { Guid } from 'guid-typescript';

@Injectable({
  providedIn: 'root',
})
export class OccupationService extends BaseService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/occupation', environment.baseApiUrl);
  }

  getOccupationsForUser(userId: Guid): Observable<OccupationModel[]> {
    return super.getMany<OccupationModel>(
      `user/${userId}`,
      BaseService.noLoadingConfig
    );
  }

  getOccupation(occupationId: number): Observable<OccupationModel> {
    return this.getOneById(occupationId, null, BaseService.noLoadingConfig);
  }

  updateOccupation(occupation: OccupationModel): Observable<OccupationModel> {
    return super.update<OccupationModel>(occupation);
  }

  addOccupation(occupation: OccupationModel): Observable<OccupationModel> {
    occupation.userId = this.userService.getUserId();
    return super.add<OccupationModel>(occupation);
  }

  deleteOccupation(occupationId: number): Observable<OccupationModel> {
    return super.remove(occupationId);
  }
}
