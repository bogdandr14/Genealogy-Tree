import { DataService } from 'src/app/modules/core/services/data.service';
import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
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
  constructor(
    public modalCtrl: ModalController,
    private authService: AuthService,
    private dataService: DataService,
    private alertService: AlertService
  ) {}

  ngOnInit() {}

  async confirmChangePassword() {
    this.changePassword.username = (
      await this.dataService.getCurrentUser().toPromise()
    ).username;
    this.authService.changePassword(this.changePassword).subscribe(() => {
      this.alertService.showSuccess('_message._success.changePassword');
      this.dismiss();
    });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
