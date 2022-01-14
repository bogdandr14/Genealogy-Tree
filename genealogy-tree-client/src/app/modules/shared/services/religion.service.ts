import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { DataService } from '../../core/services/data.service';

@Injectable({
  providedIn: 'root'
})
export class ReligionService extends DataService{

  constructor(httpClient: HttpClient) {
    super(httpClient,'religion', environment.baseApiUrl);
  }
}
