import { GenericPersonModel } from './../models/person/generic-person.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { DataService } from '../../core/services/data.service';
import { RelativeDetailsModel } from '../models/relative/relative-details.model';
import { ParentModel } from '../models/parent.model';
import { ChildModel } from '../models/child.model';
import { RelativeEditModel } from '../models/relative/relative-edit.model';

@Injectable({
  providedIn: 'root',
})
export class RelativesService extends DataService {
  constructor(httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/relative', environment.baseApiUrl);
  }

  public getParents(personId: number): Observable<any> {
    return super.getMany<ParentModel[]>(`parents/${personId}`);
  }
  public getChildren(personId: number): Observable<any> {
    return super.getMany<ChildModel[]>(`children/${personId}`);
  }
  public getAncestors(personId: number): Observable<any> {
    return super.getMany<ParentModel[]>(`ancestors/${personId}`);
  }
  public getDescendants(personId: number): Observable<any> {
    return super.getMany<ChildModel[]>(`descendants/${personId}`);
  }
  public getUnrelatedPeople(personId: number): Observable<GenericPersonModel[]> {
    return super.getMany<GenericPersonModel>(
      `unrelated/${personId}`,
      DataService.noLoadingConfig
    );
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
