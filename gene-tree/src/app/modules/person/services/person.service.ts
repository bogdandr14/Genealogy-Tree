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
    return super.getOneById<PersonEditModel>(
      personId,
      null,
      DataService.noLoadingConfig
    );
  }

  public getAllPeopleInTree(treeId: Guid): Observable<PersonBaseModel[]> {
    return super.getMany<PersonBaseModel>(`tree/${treeId}`);
  }

  public searchPeople(personName: number): Observable<PersonBaseModel[]> {
    return super.getMany<PersonBaseModel>(`search/${personName}`);
  }

  public updatePerson(
    personUpdate: PersonEditModel
  ): Observable<PersonDetailsModel> {
    return super.update<PersonDetailsModel>(personUpdate);
  }

  public createPerson(
    personCreate: PersonEditModel
  ): Observable<PersonDetailsModel> {
    return super.add<PersonDetailsModel>(personCreate);
  }

  public deletePerson(personId: number) {
    return super.remove(personId);
  }

  public getLocation(locationId: number): Observable<LocationModel> {
    return super.getOneById<LocationModel>(locationId, 'location');
  }

  public updateLocation(
    locationUpdate: LocationModel
  ): Observable<LocationModel> {
    return super.update<LocationModel>(
      locationUpdate,
      'location'
    );
  }

  public uploadPhoto(personId: number, image: File): Observable<ImageFile> {
    let path = `${this.url}/photo/${personId}`;
    const formData = new FormData();
    formData.append('image', image, image.name);
    return this.httpClient.post<ImageFile>(path, formData);
  }

  public updatePhoto(
    personImage: PersonImageUpdateModel
  ): Observable<ImageFile> {
    return this.httpClient.put<ImageFile>('photo', personImage);
  }
}
