import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Observable, Subject } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AlertService {
  constructor(private toastrService: ToastrService) {
  }

  public showSuccess(message: any) {
    this.toastrService.success(message, 'Success')
  }

  public showError(message: any, status?: number) {
    this.toastrService.error(message, 'Error ' + (status ? status : ''));
  }

  public showInfo(message: any) {
    this.toastrService.info(message, 'Information');
  }

  public showWarning(message: any) {
    this.toastrService.warning(message, 'Warning');
  }

  public showConfirmation(message: string): boolean {
    return confirm(message);
  }
}
