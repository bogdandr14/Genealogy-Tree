/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
import { HttpInterceptorParams } from '../../core/models/http-interceptor-params.model';
import { DataService } from '../../core/services/data.service';
import { ImageFile } from '../../shared/models/image-file';
import { LocationModel } from '../../shared/models/location.model';
import { PersonBaseModel } from '../models/person/person-base.model';
import { PersonDetailsModel } from '../models/person/person-details.model';
import { PersonEditModel } from '../models/person/person-edit.model';
import { PersonImageUpdateModel } from '../models/person/person-image-update.model';

@Injectable({
  providedIn: 'root',
})
export class PersonService extends DataService {
  constructor(private httpClient: HttpClient, private router: Router) {
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
    debugger;
    const path = 'add';
    return super.post<PersonDetailsModel>(path, personCreate);
  }
  public deletePerson(personId: number) {
    const path = `delete/${personId}`;
    return super.delete(personId, 'delete');
  }

  public uploadPhoto(personId: number, image: File): Observable<ImageFile> {
    let path =`${environment.baseApiUrl}/api/person/photo/upload?personId=${personId}`;
    const formData = new FormData();
    formData.append('image', image, image.name);
    return this.httpClient.post<ImageFile>(path, formData);
  }

  public updatePhoto(personImage: PersonImageUpdateModel): Observable<ImageFile> {
    let path = `photo/update`;
    return this.httpClient.put<ImageFile>(path, personImage);
  }

  public updateLocation(locationUpdate: LocationModel): Observable<LocationModel>{
    const path = 'location/update';
    return super.put<LocationModel>(path, locationUpdate);
  }
}
