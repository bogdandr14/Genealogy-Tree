import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { DataService } from '../../core/services/data.service';

@Injectable({
  providedIn: 'root'
})
export class NationalityService extends DataService {

  constructor(httpClient: HttpClient) {
    super(httpClient, 'api/nationality', environment.baseApiUrl);
   }
}
