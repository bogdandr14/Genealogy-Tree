import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from './../../../../environments/environment.prod';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { CommonObject } from '../models/common-object';

@Injectable({
  providedIn: 'root',
})
export class CommonService extends DataService {
  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/common', environment.baseApiUrl);
  }

  public getReligions(): Observable<CommonObject[]> {
    return this.getMany<CommonObject>('religion', DataService.noLoadingConfig);
  }

  public getGenders(): Observable<CommonObject[]> {
    return this.getMany<CommonObject>('gender', DataService.noLoadingConfig);
  }

  public getNationalities(): Observable<CommonObject[]> {
    return this.getMany<CommonObject>(
      'nationality',
      DataService.noLoadingConfig
    );
  }

  public addReligion(religionName: string): Observable<CommonObject> {
    return this.add<CommonObject>('religion', religionName);
  }

  public addGender(genderName: string): Observable<CommonObject> {
    return this.add<CommonObject>('gender', genderName);
  }

  public addNationality(nationalityName: string): Observable<CommonObject> {
    return this.add<CommonObject>('nationality', nationalityName);
  }
}
