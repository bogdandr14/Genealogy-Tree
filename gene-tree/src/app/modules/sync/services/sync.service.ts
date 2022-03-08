import { UserService } from 'src/app/modules/user/services/user.service';
import { environment } from '../../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BaseService } from '../../core/services/base.service';
import { Observable } from 'rxjs';
import { Guid } from 'guid-typescript';

@Injectable({
  providedIn: 'root',
})
export class SyncService extends BaseService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/sync', environment.baseApiUrl);
  }

  getAllSyncedUsers(): Observable<any[]> {
    return super.getMany<any>(
      `users/${this.userService.getCurrentUser().userId}`,
      BaseService.noLoadingConfig
    );
  }

  addSyncedUser(synchronizationCreateModel: any): Observable<any> {
    return super.add<any>(synchronizationCreateModel, 'users');
  }

  deleteSyncedUser(syncId: number): Observable<any> {
    return super.remove(syncId,'users');
  }

  getRequestsSent(): Observable<any[]> {
    return super.getMany<any>(
      `requests/sent/${this.userService.getCurrentUser().userId}`
    );
  }

  getRequestsReceived(): Observable<any[]> {
    return super.getMany<any>(
      `requests/received/${this.userService.getCurrentUser().userId}`
    );
  }

  getRequestsResponded(): Observable<any[]> {
    return super.getMany<any>(
      `requests/responded/${this.userService.getCurrentUser().userId}`
    );
  }

  addRequest(synchronizationRequestModel: any): Observable<any> {
    return super.add<any>(synchronizationRequestModel, 'requests/send');
  }

  updateRequest(requestId: number, request: any): Observable<any> {
    return super.updateById<any>(requestId, request, 'requests/respond');
  }

  deleteRequest(requestId: number) {
    return super.remove(requestId, 'requests');
  }
}
