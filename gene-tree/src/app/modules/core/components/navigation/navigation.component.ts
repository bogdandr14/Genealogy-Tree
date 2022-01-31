import { Component } from '@angular/core';
import { RouteDescriptor } from '../../models/route-descriptor';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.scss'],
})
export class NavigationComponent {
  public navLinks: Array<RouteDescriptor> = [];

  constructor(public authService: AuthService) {
    this.navLinks = [
      {
        title: '_pages.home',
        path: '/home',
        icon: 'home',
      },
      {
        title: '_pages.profile',
        path: '/account/profile',
        icon: 'person',
      },
      {
        title: '_pages.relatives',
        path: '/person/list',
        icon: 'people',
      },
      {
        title: '_pages.settings',
        path: '/account/settings',
        icon: 'settings',
      },
    ];
  }
}
