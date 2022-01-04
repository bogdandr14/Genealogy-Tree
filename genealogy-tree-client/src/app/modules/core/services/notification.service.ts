import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  constructor(private toastrService: ToastrService) {
  }

  showSuccess(message: any) {
    this.toastrService.success(message, 'Success')
  }

  showError(message: any) {
    this.toastrService.error(message, 'Error')

  }

  showInfo(message: any) {
    this.toastrService.info(message, 'Information');
  }

  showWarning(message: any) {
    this.toastrService.warning(message, 'Warning');
  }
}
