import { MarriageDetailsModel } from './../models/marriage/marriage-details.model';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserService } from '../../user/services/user.service';
import { BaseService } from '../../core/services/base.service';
import { MarriedPersonModel } from '../models/marriage/married-person.model';
import { Observable } from 'rxjs';
import { MarriageEditModel } from '../models/marriage/marriage-edit.model';

@Injectable({
  providedIn: 'root',
})
export class MarriageService extends BaseService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/marriage', environment.baseApiUrl);
  }

  getMarriagesForPerson(personId: number): Observable<MarriedPersonModel[]> {
    return super.getMany<MarriedPersonModel>(
      `forPerson/${personId}`,
      BaseService.noLoadingConfig
    );
  }
  getCurrentMarriageForPerson(personId: number): Observable<MarriedPersonModel[]> {
    return super.getMany<MarriedPersonModel>(
      `forPerson/${personId}/current`,
      BaseService.noLoadingConfig
    );
  }

  getMarriage(marriageId: number): Observable<MarriageDetailsModel> {
    return this.getOneById(marriageId, null, BaseService.noLoadingConfig);
  }

  updateMarriage(
    marriage: MarriageEditModel
  ): Observable<MarriageDetailsModel> {
    return super.update<MarriageDetailsModel>(marriage);
  }

  addMarriage(marriage: MarriageEditModel): Observable<MarriageDetailsModel> {
    return super.add<MarriageDetailsModel>(marriage);
  }

  deleteMarriage(marriageId: number): Observable<MarriageDetailsModel> {
    return super.remove(marriageId);
  }
}
