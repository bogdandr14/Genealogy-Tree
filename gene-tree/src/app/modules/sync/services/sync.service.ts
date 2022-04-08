import { environment } from './../../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { BaseService } from '../../core/services/base.service';

@Injectable({
  providedIn: 'root'
})
export class SyncService extends BaseService {

  constructor(HttpClient: HttpClient, private dataService: DataService) {
    super(HttpClient, 'api/sync', environment.baseApiUrl);

  }
}
