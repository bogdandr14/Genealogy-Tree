import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from './../../../../environments/environment.prod';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { CommonObject } from '../models/common-object';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';

@Injectable({
  providedIn: 'root',
})
export class CommonService extends DataService {
  static NoLoadingParams: HttpInterceptorConfig = { hideLoading: true };

  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/common', environment.baseApiUrl);
  }

  public getReligions(): Observable<CommonObject[]> {
    const path = 'religion';
    return this.getMany<CommonObject>(path, CommonService.NoLoadingParams);
  }

  public getGenders(): Observable<CommonObject[]> {
    const path = 'gender';
    return this.getMany<CommonObject>(path, CommonService.NoLoadingParams);
  }

  public getNationalities(): Observable<CommonObject[]> {
    const path = 'nationality';
    return this.getMany<CommonObject>(path, CommonService.NoLoadingParams);
  }
}
