import { RelativeStateEnum } from './../models/relative-state.enum';
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
import { Guid } from 'guid-typescript';
import { RequestDetailsModel } from '../models/request-details.model';
import { Observable } from 'rxjs/internal/Observable';
import { RelativeModel } from '../models/relative.model';

@Injectable({
  providedIn: 'root'
})
export class RelativeService extends BaseService {
  constructor(httpClient: HttpClient, private dataService: DataService) {
    super(httpClient, 'api/relative', environment.baseApiUrl);
  }

  public CheckForRelative(relativeId: Guid){
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
    super.getOneByPath<RelativeStateEnum>(
      `check/${user.userId}?relativeId=${relativeId}`, BaseService.noLoadingConfig
      )
    ));
  }
  public getRelatives():Observable<RelativeModel[]> {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany<RelativeModel>(`${user.userId}`)
    ));
  }

  public getRequestsSent(): Observable<RequestDetailsModel[]> {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany<RequestDetailsModel>(`request/sent/${user.userId}`)
    ));
  }

  public getRequestsReceived():Observable<RequestDetailsModel[]> {
    return this.dataService.getCurrentUser().pipe(switchMap((user) =>
      super.getMany<RequestDetailsModel>(`request/received/${user.userId}`)
    ));
  }

  public getRequestsResponded():Observable<RequestResponseModel[]> {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => super.getMany<RequestResponseModel>(`request/responded/${user.userId}`))
    );
  }

  public sendRequest(syncRequest: RequestCreateUpdateModel) {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user)=> {
        syncRequest.senderUserId = user.userId;
        return super.add(syncRequest, 'request');
      })
    )
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
