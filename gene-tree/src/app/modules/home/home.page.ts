import { Component } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { AlertService } from 'src/app/modules/core/services/alert.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  constructor(
    private notifyService: AlertService,
    private toastController: ToastController
  ) {}
  showToasterSuccess() {
    this.notifyService.showSuccess('Data shown successfully !!');
  }

  showToasterError() {
    this.notifyService.showError('Something is wrong');
  }

  showToasterInfo() {
    this.notifyService.showInfo('This is info');
  }

  showToasterWarning() {
    this.notifyService.showWarning('This is warning');
  }

  async presentToastWithOptions() {
    const toast = await this.toastController.create({
      header: 'Error',
      message: 'Click to Close',
      color: 'success',
      icon: 'close-circle',
      position: 'bottom',
      buttons: [
        {
          text: 'Ok',
          role: 'cancel',
          handler: () => {
            console.log('Cancel clicked');
          },
        },
      ],
      duration: 4000,
    });
    await toast.present();

    const { role } = await toast.onDidDismiss();
    console.log('onDidDismiss resolved with role', role);
  }
}
