import { UserService } from './../user/services/user.service';
import { ToastController } from '@ionic/angular';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { SupportModel } from './models/support.model';
import { AuthService } from '../core/services/auth.service';
import { SupportTypeEnum } from './models/support-type.enum';

@Component({
  selector: 'app-support',
  templateUrl: './support.page.html',
  styleUrls: ['./support.page.scss'],
})
export class SupportPage implements OnInit {
  supportForm = new SupportModel();
  supportTypes = Object.values(SupportTypeEnum);
  constructor(
    private toastCtrl: ToastController,
    public authService: AuthService,
    private userService: UserService
  ) {}

  ngOnInit() {}

  async submit(form: NgForm) {

    if(this.authService.isLoggedIn.value){
      this.supportForm.emailContact = this.userService.getLoggedInUser().email;
    }
    if (form.valid) {
      const toast = await this.toastCtrl.create({
        message: 'Your support request has been sent.',
        duration: 3000,
      });
      await toast.present();
    }
  }
}
