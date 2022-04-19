import { AfterViewInit, Component, OnDestroy, OnInit } from '@angular/core';
import { MapService } from '../../services/map.service';

@Component({
  selector: 'app-relative-map',
  templateUrl: './relative-map.component.html',
  styleUrls: ['./relative-map.component.scss'],
})
export class RelativeMapComponent implements OnInit, OnDestroy, AfterViewInit {
  private map;
  constructor(private mapService: MapService) { }

  ngAfterViewInit(): void {
    this.map = this.mapService.initMap();
    setTimeout(() => {
      this.map = this.mapService.getMap();
    }, 1000);
  }

  ngOnInit() { }
  ngOnDestroy(): void {
    this.mapService.destroyMap();
  }
}
