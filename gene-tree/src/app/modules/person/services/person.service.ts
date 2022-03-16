/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { BaseService } from '../../core/services/base.service';
import { ImageFile } from '../../shared/models/image-file';
import { LocationModel } from '../../shared/models/location.model';
import { GenericPersonModel } from '../models/person/generic-person.model';
import { PersonDetailsModel } from '../models/person/person-details.model';
import { PersonEditModel } from '../models/person/person-edit.model';
import { PersonImageUpdateModel } from '../models/person/person-image-update.model';

@Injectable({
  providedIn: 'root',
})
export class PersonService extends BaseService {
  constructor(private httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/person', environment.baseApiUrl);
  }

  public getPerson(personId: number): Observable<any> {
    return super.getOneById<PersonEditModel>(personId, null);
  }

  public getAllPeopleInTree(treeId: Guid): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(`tree/${treeId}`);
  }

  public searchPeople(personName: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(`search/${personName}`);
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
    return super.update<LocationModel>(locationUpdate, 'location');
  }

  public uploadPhoto(personId: number, image: File): Observable<ImageFile> {
    let path = `${this.url}/photo/${personId}`;
    const formData = new FormData();
    debugger;
    formData.append('image', image, image.name);
    return this.httpClient.post<ImageFile>(path, formData);
  }

  public updatePhoto(
    personImage: PersonImageUpdateModel
  ): Observable<ImageFile> {
    return this.httpClient.put<ImageFile>('photo', personImage);
  }
}
