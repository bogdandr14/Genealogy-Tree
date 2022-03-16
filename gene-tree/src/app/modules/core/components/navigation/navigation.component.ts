import { Component } from '@angular/core';
import { RouteDescriptor } from '../../models/route-descriptor';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.scss'],
})
export class NavigationComponent {
  public connectedUserLinks: Array<RouteDescriptor> = [];
  public freeUserLinks: Array<RouteDescriptor> = [];
  public otherLinks: Array<RouteDescriptor> = [];

  constructor(public authService: AuthService) {
    this.setupConnectedUserLinks();
    this.setupFreeUserLinks();
    this.setupOtherLinks();
  }
  setupConnectedUserLinks() {
    this.connectedUserLinks = [
      {
        title: '_pages.home',
        path: '/home',
        icon: 'home',
      },
      {
        title: '_pages.profile',
        path: '/user/profile',
        icon: 'person',
      },
      {
        title: '_pages.relatives',
        path: '/person/list',
        icon: 'people',
      },
      {
        title: '_pages.location',
        path: '/map',
        icon: 'location',
      },
      {
        title: '_pages.settings',
        path: '/user/settings',
        icon: 'settings',
      },
    ];
  }

  setupFreeUserLinks() {
    this.freeUserLinks = [
      {
        title: '_pages.home',
        path: '/home',
        icon: 'home',
      },
      {
        title: '_pages.login',
        path: '/user/login',
        icon: 'log-in',
      },
      {
        title: '_pages.register',
        path: '/user/register',
        icon: 'person-add',
      },
    ];
  }

  setupOtherLinks() {
    this.otherLinks = [
      {
        title: '_pages.support',
        path: '/support',
        icon: 'help',
      },
      {
        title: '_pages.intro',
        path: '/intro',
        icon: 'color-wand',
      },
    ];
  }
}
