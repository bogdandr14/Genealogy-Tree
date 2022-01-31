import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { catchError } from 'rxjs/operators';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { AuthService } from 'src/app/modules/core/services/auth.service';
import { ImputTypeEnum } from 'src/app/modules/shared/utils/imput-type-enum';
import { ChangePasswordModel } from '../../models/change-password.model';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.scss'],
})
export class ChangePasswordComponent implements OnInit {
  public changePassword = new ChangePasswordModel();
  public InputType = ImputTypeEnum;
  constructor(public modalCtrl: ModalController, private authService: AuthService, private alertService: AlertService) { }

  ngOnInit() { }

  async confirmChangePassword() {
    console.log(this.changePassword);
    (await this.authService.changePassword(this.changePassword))
      .subscribe(() => {
        this.alertService.showSuccess("_successMessage.changePassword");this.dismiss()});
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
