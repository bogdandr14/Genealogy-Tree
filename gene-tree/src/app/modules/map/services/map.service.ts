import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import * as Leaflet from 'leaflet';
import * as L_EXTRA from '../../../../assets/js/leaflet.extra-markers.min.js';
@Injectable({
  providedIn: 'root',
})
export class MapService {
  private navigationId: number;
  private currentUserIcon: Leaflet.icon;
  private currentUserMarker: any = null;
  private currentUserCoords: number[] = [0, 0];

  private otherUsersIcon: Leaflet.icon;
  private otherUsersMarkers = [];

  private myMap: Leaflet.map = null;

  constructor(private translateService: TranslateService) {
    this.setUsersIcons();
    if (!navigator.geolocation) {
      console.log('location is not supported');
    } else {
      this.setWatcherForCurrentUser();
    }
  }

  public getMap(): Leaflet.Map {
    return this.myMap;
  }

  public initMap() {
    this.myMap = Leaflet.map('map').setView([46.0, 25.0], 7);
    const tiles = Leaflet.tileLayer(
      'http://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
      {
        measureControl: true,
        maxZoom: 19,
        minZoom: 1,
        attribution: 'edupala.com © ionic LeafLet',
      }
    );
    tiles.addTo(this.myMap);
    setTimeout(() => {
      this.myMap.invalidateSize();
      this.updateCurrentUserOnMap();
      this.updateOtherUsersOnMap();
    }, 500);
  }

  //for setting the icon and using ion-icons, consult the following:
  //https://ionic.io/ionicons/v4/usage
  //https://github.com/coryasilva/Leaflet.ExtraMarkers
  private setUsersIcons() {

    this.currentUserIcon = L_EXTRA.ExtraMarkers.icon({
      icon: 'ion-md-person',
      markerColor: 'green',
      shape: 'star',
      prefix: 'icon'
    });

    this.otherUsersIcon = L_EXTRA.ExtraMarkers.icon({
      icon: 'ion-md-person',
      markerColor: 'purple',
      shape: 'penta',
      prefix: 'icon'
    });
  }

  private setWatcherForCurrentUser() {
    this.navigationId = navigator.geolocation.watchPosition(
      (position) => {
        if (
          this.currentUserCoords[0] != position.coords.latitude ||
          this.currentUserCoords[1] != position.coords.longitude
        ) {
          this.onUserPositionChange([
            position.coords.latitude,
            position.coords.longitude,
          ]);
        }
      },
      (err) => {
        console.log(err);
      },
      { enableHighAccuracy: false, timeout: 5000, maximumAge: 50000 }
    );
  }

  private onUserPositionChange(position: number[]) {
    this.currentUserCoords = position;
    if (this.myMap) {
      this.updateCurrentUserOnMap();
    }
  }

  private updateCurrentUserOnMap() {
    if (this.currentUserMarker) {
      this.myMap.removeLayer(this.currentUserMarker.getPane());
    }
    this.currentUserMarker = Leaflet.marker(this.currentUserCoords, {
      icon: this.currentUserIcon,
    });
    this.currentUserMarker.bindPopup(`<b>${this.translateService.instant('_map.currentLocation')}</b>`);
    this.currentUserMarker.addTo(this.myMap);
  }


  private updateOtherUsersOnMap() {
    // fetch('./assets/data.json')
    //   .then(res => res.json())
    //   .then(data => {
    //     const propertyList = data.properties;
    //     for (const property of propertyList) {
    //       const otherUserMarker = Leaflet.marker([property.lat, property.long], {
    //         icon: this.otherUsersIcon,
    //       })
    //       otherUserMarker.bindPopup(property.city);
    //       otherUserMarker.addTo(this.myMap);
    //       this.otherUsersMarkers.push(otherUserMarker);
    //     }
    //   })
    //   .catch(err => console.error(err));
  }

  removeWatcher() {
    console.log('ngOnDestroy: cleaning up...');
    navigator.geolocation.clearWatch(this.navigationId);
  }

  destroyMap() {
    if (this.currentUserMarker) {
      this.myMap.removeLayer(this.currentUserMarker.getPane());
      this.currentUserMarker = null;
    }
    this.myMap.off();
    this.myMap.remove();
    this.myMap = null;
  }
}
