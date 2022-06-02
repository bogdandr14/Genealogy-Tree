import { NotificationsBundle } from './models/nofitications-bundle.model';
import { UserService } from './../user/service/user.service';
import { Component, OnInit } from '@angular/core';
import { RelativeService } from '../relative/services/relative.service';
import { map, take } from 'rxjs/operators';

@Component({
  selector: 'app-notifications',
  templateUrl: './notifications.page.html',
  styleUrls: ['./notifications.page.scss'],
})
export class NotificationsPage implements OnInit {
  private notificationsBundle = new NotificationsBundle();

  constructor(
    private userService: UserService
  ) { }

  get requestsReceived() {
    return this.notificationsBundle.requestsReceived;
  }

  get requestsResponded() {
    return this.notificationsBundle.requestsResponded;
  }

  get eventsToday() {
    return this.notificationsBundle.eventsToday;
  }

  get userUpdates() {
    return this.notificationsBundle.userUpdates;
  }

  ngOnInit() {
    this.refreshNotifications();
  }

  public refreshNotifications() {
    this.userService
      .getNotifications()
      .pipe(
        take(1),
        map((notifications) => {
          notifications.eventsToday.forEach(
            (event) => (event.date = new Date(event.date))
          );
          return notifications;
        })
      )
      .subscribe((notifications) => (this.notificationsBundle = notifications));
  }
}
