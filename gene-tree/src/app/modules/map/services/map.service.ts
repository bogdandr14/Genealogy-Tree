import { Injectable, OnDestroy } from '@angular/core';
import * as L from 'leaflet';
@Injectable({
  providedIn: 'root',
})
export class MapService {
  private navigationId: number;
  private currentUserMarker: any;
  private currentUserCoords: number[] = [0, 0];

  constructor() {}

  watchPosition(myMap: L.map) {
    if (!navigator.geolocation) {
      console.log('location is not supported');
    } else {
      this.navigationId = navigator.geolocation.watchPosition(
        (position) => {
          if (
            this.currentUserCoords[0] != position.coords.latitude ||
            this.currentUserCoords[1] != position.coords.longitude
          ) {
            console.log(
              `lat: ${position.coords.latitude}, lon: ${position.coords.longitude}`
            );
            this.currentUserCoords[0] = position.coords.latitude;
            this.currentUserCoords[1] = position.coords.longitude;
            this.currentUserMarker = L.marker([
              position.coords.latitude,
              position.coords.longitude,
            ]).addTo(myMap);
          }
        },
        (err) => {
          console.log(err);
        },
        { enableHighAccuracy: false, timeout: 5000, maximumAge: 0 }
      );
    }
  }

  removeWatch() {
    console.log('ngOnDestroy: cleaning up...');
    navigator.geolocation.clearWatch(this.navigationId);
  }
}
