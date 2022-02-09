import { LocationModel } from './../../shared/models/location.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { DataService } from '../../core/services/data.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LocationService extends DataService{

  constructor(private httpClient: HttpClient, private router: Router) {
    super(httpClient, 'api/location', environment.baseApiUrl);
  }

  public updateLocation(
    locationUpdate: LocationModel
  ): Observable<LocationModel> {
    const path = 'update';
    return super.put<LocationModel>(path, locationUpdate);
  }

}
