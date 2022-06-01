import { EventNotificationComponent } from './components/event-notification/event-notification.component';
import { RequestResponseNotificationComponent } from './components/request-response-notification/request-response-notification.component';
import { RequestNotificationComponent } from './components/request-notification/request-notification.component';
import { NgModule } from '@angular/core';
import { NotificationsPageRoutingModule } from './notifications-routing.module';

import { NotificationsPage } from './notifications.page';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  imports: [SharedModule, NotificationsPageRoutingModule],
  declarations: [
    NotificationsPage,
    RequestNotificationComponent,
    RequestResponseNotificationComponent,
    EventNotificationComponent,
  ],
})
export class NotificationsPageModule {}
