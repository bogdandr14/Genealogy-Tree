import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
import { DataService } from '../../core/services/data.service';
import { PersonBaseModel } from '../models/person-base.model';
import { PersonDetailsModel } from '../models/person-details.model';
import { PersonEditModel } from '../models/person-edit.model';
import { PersonImageModel } from '../models/person-image.model';

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

  public getAllPeopleInTree(treeId: Guid): Observable<PersonBaseModel[]> {
    const path = `tree/${treeId}`;
    return super.getMany<PersonBaseModel>(path);
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
  public deletePerson(personId: number) {
    const path = `delete/${personId}`;
    return super.delete(personId, 'delete');
  }

  public changePhoto(personImage : PersonImageModel): Observable<any> {
    const path = `uploadPhoto`;
    return super.post<any>(path, personImage);
  }
}
