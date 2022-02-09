import { PersonBaseModel } from './../models/person/person-base.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
import { DataService } from '../../core/services/data.service';
import { PersonEditModel } from '../models/person/person-edit.model';

@Injectable({
  providedIn: 'root',
})
export class RelativesService extends DataService {
  constructor(private httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/parentChild', environment.baseApiUrl);
  }

  public getUnrelatedPeople(personId: number): Observable<any> {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path =`unrelated?personId=${personId}`
    return super.getMany<PersonBaseModel[]>(path, params);
  }
}
