import { Guid } from 'guid-typescript';
import * as Leaflet from 'leaflet';

export class PersonMarker {
  constructor(icon: Leaflet.icon, personId: number, lastVerified: Date) {
    this.icon = icon;
    this.personId = personId;
    this.lastVerified = lastVerified;
  }
  icon: Leaflet.icon;
  personId: number;
  lastVerified: Date;
}
