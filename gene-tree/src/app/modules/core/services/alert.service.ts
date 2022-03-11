import { Injectable, Injector } from '@angular/core';
import { AlertController, ToastController } from '@ionic/angular';
import { TranslateService } from '@ngx-translate/core';
import { AppError } from '../models/errors/app-error';
@Injectable({ providedIn: 'root' })
export class AlertService {
  constructor(
    private injector: Injector,
    private toastController: ToastController,
    private alertController: AlertController,
  ) {}

  //https://artlist.io/sfx/?term=whoosh,success,message,pop,in
  async presentAlert(
    header: string,
    message: string,
    cancelButtonName: string,
    confirmButtonName: string,
    context: object,
    confirmAction: () => {}
  ) {
    const alert = await this.alertController.create({
      header,
      message,
      buttons: [
        {
          text: cancelButtonName,
          role: 'cancel'
        }, {
          text: confirmButtonName,
          handler: confirmAction.bind(context)
        }
      ]
    });
    await alert.present();
  }

  public async showSuccess(success: any) {
    const toast = await this.createToast(
      '_message.success',
      success,
      'success',
      'checkmark-circle'
    );
    toast.present();
  }

  public async showError(error: any) {
    let toast: HTMLIonToastElement;
    if (error instanceof AppError) {
      toast = await this.createToast(
        '_message.error',
        error.message,
        'danger',
        'close-circle',
        error.status
      );
    } else {
      toast = await this.createToast('_message.error', error, 'danger', 'close-circle');
    }
    toast.present();
  }

  public async showInfo(info: any) {
    const toast = await this.createToast(
      '_message.information',
      info,
      'primary',
      'information-circle'
    );
    toast.present();
  }

  public async showWarning(warning: any) {
    const toast = await this.createToast(
      '_message.warning',
      warning,
      'warning',
      'alert-circle'
    );
    toast.present();
  }

  public showConfirmation(message: string): boolean {
    return confirm(message);
  }

  public async createToast(
    title: string,
    message: string,
    color: string,
    icon: string,
    status?: number
  ) {
    const toast = await this.toastController.create({
      header: this.translateService.instant(title) + (status ? status : ''),
      message: this.translateService.instant(message),
      color: color,
      icon: icon,
      position: 'bottom',
      buttons: [
        {
          text: 'Ok',
          role: 'cancel',
          handler: () => {
            return true;
          },
        },
      ],
      duration: 4000,
    });
    return toast;
  }

  get translateService(): TranslateService {
    return this.injector.get(TranslateService);
  }
}
