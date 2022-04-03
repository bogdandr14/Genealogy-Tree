import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from './../../../../environments/environment.prod';
import { Injectable } from '@angular/core';
import { BaseService } from '../../core/services/base.service';
import { CommonObject } from '../models/common-object';

@Injectable({
  providedIn: 'root',
})
export class CommonService extends BaseService {
  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/common', environment.baseApiUrl);
  }

  public getReligions(): Observable<CommonObject[]> {
    return this.getMany<CommonObject>('religion', BaseService.noLoadingConfig);
  }

  public getNationalities(): Observable<CommonObject[]> {
    return this.getMany<CommonObject>(
      'nationality',
      BaseService.noLoadingConfig
    );
  }

  public addReligion(religionName: string): Observable<CommonObject> {
    return this.add<CommonObject>('religion', religionName);
  }

  public addNationality(nationalityName: string): Observable<CommonObject> {
    return this.add<CommonObject>('nationality', nationalityName);
  }
}
