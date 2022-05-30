import { Component, Input, OnInit } from '@angular/core';
import { UserService } from 'src/app/modules/user/service/user.service';
import { RouteDescriptor } from '../../models/route-descriptor';

@Component({
  selector: 'app-navigation-link',
  templateUrl: './navigation-link.component.html',
  styleUrls: ['./navigation-link.component.scss'],
})
export class NavigationLinkComponent implements OnInit {
  @Input() link: RouteDescriptor;
  constructor( public userService: UserService) {}

  ngOnInit() {}
}
