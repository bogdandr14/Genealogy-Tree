import { RelativeModel } from './../models/relative/relative.model';
import { GenericPersonModel } from './../models/person/generic-person.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { BaseService } from '../../core/services/base.service';
import { RelativeDetailsModel } from '../models/relative/relative-details.model';
import { RelativeEditModel } from '../models/relative/relative-edit.model';

@Injectable({
  providedIn: 'root',
})
export class RelativesService extends BaseService {
  constructor(httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/relative', environment.baseApiUrl);
  }

  public getParents(personId: number): Observable<any> {
    return super.getMany<RelativeModel[]>(`parents/${personId}`);
  }
  public getChildren(personId: number): Observable<any> {
    return super.getMany<RelativeModel[]>(`children/${personId}`);
  }
  public getAncestors(personId: number): Observable<any> {
    return super.getMany<RelativeModel[]>(`ancestors/${personId}`);
  }
  public getDescendants(personId: number): Observable<any> {
    return super.getMany<RelativeModel[]>(`descendants/${personId}`);
  }
  public getUnrelatedPeople(personId: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(
      `unrelated/${personId}`,
      BaseService.noLoadingConfig
    );
  }
  public getNotBloodRelatedPeople(personId: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(`notBloodRelated/${personId}`, BaseService.noLoadingConfig);
  }

  public getChildrenOptions(personId: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(`childrenOptions/${personId}`, BaseService.noLoadingConfig);
  }
  public getRelative(relativeId: number): Observable<RelativeDetailsModel> {
    return super.getOneById<RelativeDetailsModel>(relativeId);
  }

  updateRelative(
    relative: RelativeEditModel
  ): Observable<RelativeDetailsModel> {
    return super.update<RelativeDetailsModel>(relative);
  }

  addRelative(relative: RelativeEditModel): Observable<RelativeDetailsModel> {
    return super.add<RelativeDetailsModel>(relative);
  }

  deleteRelative(relativeId: number): Observable<any> {
    return super.remove(relativeId);
  }
}
