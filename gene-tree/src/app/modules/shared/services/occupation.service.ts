import { OccupationModel } from './../../user/models/occupation.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../../../environments/environment';
import { DataService } from '../../core/services/data.service';
import { UserService } from '../../user/services/user.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class OccupationService extends DataService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/occupation', environment.baseApiUrl);
  }

  updateOccupation(occupation: OccupationModel): Observable<OccupationModel> {
    const path = 'update';
    return super.put<OccupationModel>(path, occupation);
  }

  addOccupation(occupation: OccupationModel): Observable<OccupationModel> {
    const path = 'add';
    occupation.userId = this.userService.getCurrentUser().userId;
    return super.post<OccupationModel>(path, occupation);
  }
}
