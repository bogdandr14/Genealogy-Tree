import { ParentChildBaseModel } from '../models/parent-child-base.model';
import { GenericPersonModel } from '../../models/generic-person.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { BaseService } from '../../../core/services/base.service';
import { ParentChildDetailsModel } from '../models/parent-child-details.model';
import { ParentChildEditModel } from '../models/parent-child-edit.model';

@Injectable({
  providedIn: 'root',
})
export class ParentChildService extends BaseService {
  constructor(httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/parentChild', environment.baseApiUrl);
  }

  public getParents(personId: number): Observable<any> {
    return super.getMany<ParentChildBaseModel[]>(`parents/${personId}`);
  }
  public getChildren(personId: number): Observable<any> {
    return super.getMany<ParentChildBaseModel[]>(`children/${personId}`);
  }
  public getAncestors(personId: number): Observable<any> {
    return super.getMany<ParentChildBaseModel[]>(`ancestors/${personId}`);
  }
  public getDescendants(personId: number): Observable<any> {
    return super.getMany<ParentChildBaseModel[]>(`descendants/${personId}`);
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

  public getParentSpouceOptions(personId: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(`parentSpouceOptions/${personId}`, BaseService.noLoadingConfig);
  }

  public getPersonChild(parentChildId: number): Observable<ParentChildDetailsModel> {
    return super.getOneById<ParentChildDetailsModel>(parentChildId);
  }

  updateParentChild(
    parentChild: ParentChildEditModel
  ): Observable<ParentChildDetailsModel> {
    return super.update<ParentChildDetailsModel>(parentChild);
  }

  addParentChild(parentChild: ParentChildEditModel): Observable<ParentChildDetailsModel> {
    return super.add<ParentChildDetailsModel>(parentChild);
  }

  deleteParentChild(parentChildId: number): Observable<any> {
    return super.remove(parentChildId);
  }
}
