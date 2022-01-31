import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
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
  constructor(public modalCtrl: ModalController) {}

  ngOnInit() {}

  confirmChangePassword() {
    console.log(this.changePassword);
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
