import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  constructor(private toastrService: ToastrService) {
  }

  showSuccess(message: any) {
    this.toastrService.success(message.toString(), 'Success')
  }

  showError(message: any) {
    this.toastrService.error(message.toString(), 'Error')

  }

  showInfo(message: any) {
    this.toastrService.info(message.toString(), 'Information');
  }

  showWarning(message: any) {
    this.toastrService.warning(message.toString(), 'Warning');
  }
}
