import { Component, OnInit, OnDestroy, AfterViewInit } from '@angular/core';
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
    this.map = this.mapService.initMap();
    setTimeout(() => {
      this.map = this.mapService.getMap();
    }, 1000);
  }

  ngOnInit() {}
  ngOnDestroy(): void {
    this.mapService.destroyMap();
  }
}
