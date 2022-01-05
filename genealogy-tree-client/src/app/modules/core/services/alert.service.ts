import { Injectable, Injector } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Observable, Subject } from 'rxjs';
import { AppError } from '../models/errors/app-error';

@Injectable({ providedIn: 'root' })
export class AlertService {
  constructor(private injector: Injector, private toastrService: ToastrService) {
  }

  public showSuccess(success: any) {
    this.toastrService.success(this.translateService.instant(success), this.translateService.instant('success'));
  }

  public showError(error: any) {
    if (error instanceof AppError) {
      this.toastrService.error(error.message, `${this.translateService.instant('error')} ${error.status}`);
    }
    else {
      this.toastrService.error(this.translateService.instant(error), this.translateService.instant('error'));
    }
  }

  public showInfo(info: any) {
    this.toastrService.info(this.translateService.instant(info), this.translateService.instant('information'));
  }

  public showWarning(warning: any) {
    this.toastrService.warning(this.translateService.instant(warning), this.translateService.instant('warning'));
  }

  public showConfirmation(message: string): boolean {
    return confirm(message);
  }

  get translateService(): TranslateService {
    return this.injector.get(TranslateService);
  }
}
