import { environment } from './../../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { BaseService } from '../../core/services/base.service';
import { GenericPersonModel } from '../../person/models/person/generic-person.model';
import { SyncRequestCreateUpdateModel } from '../models/sync-request-create-update.model';
import { SyncRequestResponseModel } from '../models/sync-request-response.model';
import { UsersToSyncModel } from '../models/synced-users.model';
import { mergeMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class SyncService extends BaseService {
  constructor(HttpClient: HttpClient, private dataService: DataService) {
    super(HttpClient, 'api/sync', environment.baseApiUrl);
  }

  public getSyncedUsers() {
    return this.dataService.getCurrentUser().pipe(
      mergeMap((user) => {
        return super.getMany<GenericPersonModel>(`users/${user.userId}`);
      })
    );
  }

  public addSyncedUser(usersToSync: UsersToSyncModel) {
    return super.add(usersToSync, 'users');
  }

  public getRequestsSent() {
    return this.dataService.getCurrentUser().pipe(
      mergeMap((user) => {
        return super.getMany(`requests/sent/${user.userId}`);
      })
    );
  }

  public getRequestsReceived() {
    return this.dataService.getCurrentUser().pipe(
      mergeMap((user) => {
        return super.getMany(`requests/received/${user.userId}`);
      })
    );
  }

  public getRequestsResponded() {
    return this.dataService.getCurrentUser().pipe(
      mergeMap((user) => {
        return super.getMany(`requests/responded/${user.userId}`);
      })
    );
  }

  public sendSyncRequest(syncRequest: SyncRequestCreateUpdateModel) {
    return super.add(syncRequest, 'requests/send');
  }

  public respondToSyncRequest(syncRequest: SyncRequestResponseModel) {
    return super.updateById(syncRequest.id, syncRequest, 'requests/respond');
  }

  public removeSyncRequest(syncRequestId: number) {
    return super.remove(syncRequestId, 'requests');
  }
}
