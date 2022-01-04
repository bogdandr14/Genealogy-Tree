/* eslint-disable no-debugger */
import { ErrorHandler, Injectable, Injector } from '@angular/core';

@Injectable()
export class AppErrorHandler implements ErrorHandler {

  public handleError(error: any): void {
    console.log(error);

    const chunkFailedMessage = /Loading chunk [\d]+ failed/;
    if (chunkFailedMessage.test(error.message)) {
      window.location.reload();
    }
  }
}
