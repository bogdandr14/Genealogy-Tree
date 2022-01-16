import { Component } from '@angular/core';
import { RouteDescriptor } from '../../models/route-descriptor';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.scss'],
})
export class NavigationComponent {
  public navLinks: Array<RouteDescriptor> = [];

  constructor() {
    this.navLinks = [
      {
        title: '_menu._links.home',
        path: '/',
        icon: 'home',
      },
      {
        title: '_menu._links.profile',
        path: '/user/profile',
        icon: 'person',
      },
      {
        title: '_menu._links.relatives',
        path: '/person/list',
        icon: 'people',
      },
      {
        title: '_menu._links.settings',
        path: '/user/settings',
        icon: 'settings',
      },
    ];
  }
}
