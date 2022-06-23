import { UtilsService } from './../../shared/services/utils.service';
import { RelativeService } from './relative.service';
import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import * as Leaflet from 'leaflet';
import * as L_EXTRA from '../../../../assets/js/leaflet.extra-markers.min.js';
import { UserMarker } from '../models/user-marker.model';
import { UserPositionModel } from '../../genealogy/models/user-position.model';
import { DatePipe } from '@angular/common';
import { UserService } from '../../user/service/user.service';
@Injectable({
  providedIn: 'root',
})
export class MapService {
  private navigationId: number;
  private currentUserIcon: Leaflet.icon;
  private currentUserMarker: any = null;
  private currentUserCoords: number[] = [0, 0];

  private otherUsersIcon: Leaflet.icon;
  private relativesMarkers: UserMarker[] = [];

  private myMap: Leaflet.map = null;
  private datePipe: DatePipe;

  constructor(
    private translateService: TranslateService,
    private relativeService: RelativeService,
    private userService: UserService,
    private utilsService: UtilsService
  ) {
    this.setUsersIcons();
    this.datePipe = new DatePipe('ro-RO');
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

  public destroyMap() {
    if (this.currentUserMarker) {
      this.myMap.removeLayer(this.currentUserMarker.getPane());
      this.currentUserMarker = null;
    }
    this.myMap.off();
    this.myMap.remove();
    this.myMap = null;
  }

  //for setting the icon and using ion-icons, consult the following:
  //https://ionic.io/ionicons/v4/usage
  //https://github.com/coryasilva/Leaflet.ExtraMarkers
  private setUsersIcons() {
    this.currentUserIcon = L_EXTRA.ExtraMarkers.icon({
      icon: 'ion-md-person',
      markerColor: 'green',
      shape: 'star',
      prefix: 'icon',
    });

    this.otherUsersIcon = L_EXTRA.ExtraMarkers.icon({
      icon: 'ion-md-person',
      markerColor: 'purple',
      shape: 'penta',
      prefix: 'icon',
    });
  }

  private setWatcherForCurrentUser() {
    this.navigationId = navigator.geolocation.watchPosition(
      (position) => {
        if (
          this.currentUserCoords[0] != position.coords.latitude ||
          this.currentUserCoords[1] != position.coords.longitude
        ) {
          this.userService.updateUserPosition(
            position.coords.latitude,
            position.coords.longitude
          ).subscribe();
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
    this.currentUserMarker.bindPopup(
      `<h2>
        <b>
          ${this.translateService.instant('_map.currentLocation')}
        </b>
      </h2>
      <p>
      ${this.translateService.instant(
        '_map.updatedOn'
      )}: ${this.datePipe.transform(new Date(), 'dd MMM yyy, HH:mm')}
      </p>`
    );
    this.currentUserMarker.addTo(this.myMap);
  }

  private updateOtherUsersOnMap() {
    this.relativeService.getRelativesPosition().subscribe((userPositions) => {
      userPositions.forEach((userPosition) => {
        const existingMarkerIndex = this.relativesMarkers.findIndex(
          (marker) => marker.userId === userPosition.userId
        );
        if (existingMarkerIndex === -1) {
          this.addRelativeMarker(userPosition);
        } else if (
          this.relativesMarkers[existingMarkerIndex].lastVerified <
          userPosition.updatedOn
        ) {
          this.myMap.removeLayer(
            this.relativesMarkers[existingMarkerIndex].icon.getPane()
          );
          this.relativesMarkers.splice(existingMarkerIndex, 1);
          this.addRelativeMarker(userPosition);
        }
      });
    });
  }

  private addRelativeMarker(userPosition: UserPositionModel) {
    const leafletIcon = Leaflet.marker(
      [userPosition.latitude, userPosition.longitude],
      { icon: this.otherUsersIcon }
    );
    const newMarker = new UserMarker(
      leafletIcon,
      userPosition.userId,
      userPosition.updatedOn
    );
    newMarker.icon.bindPopup(
      `<h2>
        <b>
          ${userPosition.firstName} ${userPosition.lastName}
        </b>
        <ion-avatar>
          <img src="${this.utilsService.imageUrl(userPosition.imageFile)}"/>
        </ion-avatar>
      </h2>
      <p>
      ${this.translateService.instant(
        '_map.updatedOn'
      )}: ${this.datePipe.transform(
        userPosition.updatedOn,
        'dd MMM yyy, HH:mm'
      )}
      </p>`,
      { maxWidth: 560 }
    );
    newMarker.icon.addTo(this.myMap);
    this.relativesMarkers.push(newMarker);
  }
}
