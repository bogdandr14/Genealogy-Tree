import { UserPositionModel } from './../../genealogy/models/user-position.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { switchMap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { BaseService } from '../../core/services/base.service';
import { DataService } from '../../core/services/data.service';
import { GenericPersonModel } from '../../person/models/generic-person.model';
import { RequestCreateUpdateModel } from '../models/request-create-update.model';
import { RequestResponseModel } from '../models/request-response.model';
import { RelativeModel } from '../models/relative.model';

@Injectable({
  providedIn: 'root'
})
export class RelativeService extends BaseService {
  constructor(httpClient: HttpClient, private dataService: DataService) {
    super(httpClient, 'api/relative', environment.baseApiUrl);
  }

  public getRelatives() {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany<GenericPersonModel>(`${user.userId}`)
    ));
  }

  public addRelative(usersToSync: RelativeModel) {
    return super.add(usersToSync);
  }

  public getRequestsSent() {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany(`request/sent/${user.userId}`)
    ));
  }

  public getRequestsReceived() {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany(`request/received/${user.userId}`)
    ));
  }

  public getRequestsResponded() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => super.getMany(`request/responded/${user.userId}`))
    );
  }

  public sendRequest(syncRequest: RequestCreateUpdateModel) {
    return super.add(syncRequest, 'request');
  }

  public respondToRequest(syncRequest: RequestResponseModel) {
    return super.updateById(syncRequest.id, syncRequest, 'request');
  }

  public removeRequest(syncRequestId: number) {
    return super.remove(syncRequestId, 'request');
  }

  public getRelativesPosition() {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany<UserPositionModel>(`position/${user.userId}`)
    ));
  }
}
