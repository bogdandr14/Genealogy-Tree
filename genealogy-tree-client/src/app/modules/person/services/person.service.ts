import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
import { DataService } from '../../core/services/data.service';
import { PersonDetailsModel } from '../models/person-details.model';
import { PersonEditModel } from '../models/person-edit.model';

@Injectable({
  providedIn: 'root',
})
export class PersonService extends DataService {
  constructor(httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/person', environment.baseApiUrl);
  }

  public getPerson(personId: number): Observable<any> {
    const params: HttpInterceptorConfig = { hideLoading: true };
    return super.getOneById<PersonEditModel>(personId, params);
  }

  public updatePerson(
    personId: number,
    personUpdate: PersonEditModel
  ): Observable<PersonDetailsModel> {
    const path = 'update';
    return super.update<PersonDetailsModel>(personId, personUpdate, path);
  }

  public createPerson(
    personCreate: PersonEditModel
  ): Observable<PersonDetailsModel> {
    const path = 'add';
    return super.post<PersonDetailsModel>(path, personCreate);
  }
}
