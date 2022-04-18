import { UserService } from 'src/app/modules/user/services/user.service';
import { Component, Input, OnInit } from '@angular/core';
import { Guid } from 'guid-typescript';

@Component({
  selector: 'app-link-user-buttons',
  templateUrl: './link-user-buttons.component.html',
  styleUrls: ['./link-user-buttons.component.scss'],
})
export class LinkUserButtonsComponent implements OnInit {
  @Input() userId: Guid;
  constructor(private userService: UserService) { }

  ngOnInit() { }

  public get isCurrentUser() {
    return this.userService.isCurrentUser(this.userId);
  }
}
