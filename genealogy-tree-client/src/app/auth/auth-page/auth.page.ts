import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import { LoadingController, AlertController } from '@ionic/angular';

import { AuthService } from '../auth.service';
import { SignupComponent } from './signup/signup.component';
import { LoginComponent } from './login/login.component';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.page.html',
  styleUrls: ['./auth.page.scss'],
})
export class AuthPage implements OnInit {
  @ViewChild('signup') signup: SignupComponent;
  @ViewChild('login') login: LoginComponent;

  isLoading = false;
  isLogin = true;

  constructor(
    private authService: AuthService,
    private router: Router,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController
  ) {}

  ngOnInit() {}

  authenticate(email: string, password: string) {
    this.isLoading = true;
    this.authService.login();
    this.loadingCtrl
      .create({ keyboardClose: true, message: 'Logging in...' })
      .then((loadingEl) => {
        loadingEl.present();
        // this.authService.signup(email, password).subscribe(
        //   resData => {
        //     console.log(resData);
        //     this.isLoading = false;
        //     loadingEl.dismiss();
        //     this.router.navigateByUrl('/places/tabs/discover');
        //   },
        //   errRes => {
        //     loadingEl.dismiss();
        //     const code = errRes.error.error.message;
        //     let message = 'Could not sign you up, please try again.';
        //     if (code === 'EMAIL_EXISTS') {
        //       message = 'This email address exists already!';
        //     }
        //     this.showAlert(message);
        //   }
        // );
      });
  }

  onSwitchAuthMode() {
    this.isLogin = !this.isLogin;
  }

  public checkFormValidity() {
    if (this.isLogin) {
      return this.login?.loginForm.valid;
    } else {
      return this.signup?.signupForm.valid;
    }
  }

  onSubmit(form: NgForm) {
    // if(this.isLogin){
    //   this.login.loginForm.submitted = true;
    // }
    // else{
    //   this.signup.signupForm.onSubmit();
    // }
    // if(!form.valid){
    //   return;
    // }
    // const email = form.value.email;
    // const password = form.value.password;
    // this.authenticate(email, password);
  }

  private showAlert(message: string) {
    this.alertCtrl
      .create({
        header: 'Authentication failed',
        message,
        buttons: ['Okay'],
      })
      .then((alertEl) => alertEl.present());
  }
}
