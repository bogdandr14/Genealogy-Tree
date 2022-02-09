import { HttpInterceptorConfig } from './../../core/models/http-interceptor-config.model';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DataService } from '../../core/services/data.service';
import { CommonObject } from '../models/common-object';
import { Observable } from 'rxjs';
import { EducationModel } from '../../user/models/education.model';
import { UserService } from '../../user/services/user.service';

@Injectable({
  providedIn: 'root',
})
export class EducationService extends DataService {
  constructor(httpClient: HttpClient, private userService: UserService) {
    super(httpClient, 'api/education', environment.baseApiUrl);
  }

  getEducationLevels(): Observable<CommonObject[]> {
    const params: HttpInterceptorConfig = { hideLoading: true };
    const path = 'levels';
    return super.getMany<CommonObject>(path, params);
  }

  updateEducation(education: EducationModel): Observable<EducationModel> {
    const path = 'update';
    return super.put<EducationModel>(path, education);
  }

  addEducation(education: EducationModel): Observable<EducationModel> {
    const path = 'add';
    education.userId = this.userService.getCurrentUser().userId;
    return super.post<EducationModel>(path, education);
  }
}
