import { Guid } from 'guid-typescript';
import * as Leaflet from 'leaflet';

export class UserMarker {
  constructor(icon: Leaflet.icon, userId: Guid, lastVerified: Date) {
    this.icon = icon;
    this.userId = userId;
    this.lastVerified = lastVerified;
  }
  icon: Leaflet.icon;
  userId: Guid;
  lastVerified: Date;
}
