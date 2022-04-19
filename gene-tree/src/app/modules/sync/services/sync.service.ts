import { environment } from './../../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { BaseService } from '../../core/services/base.service';
import { GenericPersonModel } from '../../person/models/generic-person.model';
import { SyncRequestCreateUpdateModel } from '../models/sync-request-create-update.model';
import { SyncRequestResponseModel } from '../models/sync-request-response.model';
import { UsersToSyncModel } from '../models/synced-users.model';
import { switchMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class SyncService extends BaseService {
  constructor(HttpClient: HttpClient, private dataService: DataService) {
    super(HttpClient, 'api/sync', environment.baseApiUrl);
  }

  public getSyncedUsers() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => {
        return super.getMany<GenericPersonModel>(`user/${user.userId}`);
      })
    );
  }

  public addSyncedUser(usersToSync: UsersToSyncModel) {
    return super.add(usersToSync, 'user');
  }

  public getRequestsSent() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => {
        return super.getMany(`request/sent/${user.userId}`);
      })
    );
  }

  public getRequestsReceived() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => {
        return super.getMany(`request/received/${user.userId}`);
      })
    );
  }

  public getRequestsResponded() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((user) => {
        return super.getMany(`request/responded/${user.userId}`);
      })
    );
  }

  public sendSyncRequest(syncRequest: SyncRequestCreateUpdateModel) {
    return super.add(syncRequest, 'request');
  }

  public respondToSyncRequest(syncRequest: SyncRequestResponseModel) {
    return super.updateById(syncRequest.id, syncRequest, 'request');
  }

  public removeSyncRequest(syncRequestId: number) {
    return super.remove(syncRequestId, 'request');
  }
}
