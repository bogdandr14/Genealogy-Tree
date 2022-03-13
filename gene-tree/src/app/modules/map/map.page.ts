import { Component, OnInit, OnDestroy, AfterViewInit } from '@angular/core';
import * as L from 'leaflet';
import { MapService } from './services/map.service';

@Component({
  selector: 'app-map',
  templateUrl: './map.page.html',
  styleUrls: ['./map.page.scss'],
})
export class MapPage implements OnInit, OnDestroy, AfterViewInit {
  private map;
  constructor(private mapService: MapService) {}

  ngAfterViewInit(): void {
    this.initMap();
  }

  ngOnInit() {}

  private initMap() {
    this.map = L.map('map').setView([46.0, 25.0], 7);
    const tiles = L.tileLayer(
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      {
        measureControl: true,
        maxZoom: 19,
        minZoom: 1,
        attribution:
          '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      }
    );
    tiles.addTo(this.map);
    setTimeout(() => {
      this.map.invalidateSize();
      this.mapService.watchPosition(this.map);
    }, 500);
  }
  ngOnDestroy(): void {
    this.mapService.removeWatch();
  }
}
