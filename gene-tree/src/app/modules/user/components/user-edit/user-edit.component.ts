import { UserService } from 'src/app/modules/user/services/user.service';
import { UserEditModel } from './../../models/user-edit.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-user-edit',
  templateUrl: './user-edit.component.html',
  styleUrls: ['./user-edit.component.scss'],
})
export class UserEditComponent implements OnInit {
  @Input() userEdit: UserEditModel;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  constructor(private modalCtrl: ModalController,
    private userService: UserService
  ) { }

  ngOnInit() { }

  submitInfo() {
    this.userService.updateUserInfo(this.userEdit).subscribe(() => {
      this.saveConfirmed.emit(true);
      this.dismiss();
    });

  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
