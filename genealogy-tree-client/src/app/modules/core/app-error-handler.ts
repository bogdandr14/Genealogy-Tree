/* eslint-disable no-debugger */
import { ErrorHandler, Injectable, Injector } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AlertService } from './services/alert.service';
import { NotificationService } from './services/notification.service';

@Injectable()
export class AppErrorHandler implements ErrorHandler {
  constructor(private injector: Injector, private alertService: AlertService) { }

  public handleError(error: any): void {
    console.log(error);

    const chunkFailedMessage = /Loading chunk [\d]+ failed/;
    if (chunkFailedMessage.test(error.message)) {
      window.location.reload();
    }
    debugger;
    this.notificationService.showError(error.message);
    debugger;
    // this.alertService.showError(error.message);
  }
  private get notificationService(): NotificationService {
    return this.injector.get(NotificationService);
  }
}
