import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { HttpInterceptorConfig } from '../../core/models/http-interceptor-config.model';
import { DataService } from '../../core/services/data.service';

@Injectable({
  providedIn: 'root',
})
export class GenderService extends DataService {
  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/gender', environment.baseApiUrl);
  }
}
