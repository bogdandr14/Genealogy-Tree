import { HttpInterceptorConfig } from './../../core/models/http-interceptor-config.model';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { CommonObject } from '../models/common-object';
import { Observable } from 'rxjs';
import { EducationModel } from '../../user/models/education.model';
import { UserService } from '../../user/services/user.service';
import { Guid } from 'guid-typescript';

@Injectable({
  providedIn: 'root',
})
export class EducationService extends DataService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/education', environment.baseApiUrl);
  }

  getEducationsForUser(userId: Guid): Observable<EducationModel[]> {
    return super.getMany<EducationModel>(
      `forUser/${userId}`,
      DataService.noLoadingConfig
    );
  }

  getEducation(educationId: number): Observable<EducationModel> {
    return this.getOneById(educationId, null, DataService.noLoadingConfig);
  }

  updateEducation(education: EducationModel): Observable<EducationModel> {
    return super.update<EducationModel>(education);
  }

  addEducation(education: EducationModel): Observable<EducationModel> {
    education.userId = this.userService.getCurrentUser().userId;
    return super.add<EducationModel>(education);
  }

  deleteEducation(educationId: number): Observable<EducationModel> {
    return super.remove(educationId);
  }

  getEducationLevels(): Observable<CommonObject[]> {
    return super.getMany<CommonObject>('levels', DataService.noLoadingConfig);
  }

  addEducationLevel(educationLevelName: string): Observable<EducationModel> {
    return super.add<EducationModel>(educationLevelName, 'levels');
  }
}
