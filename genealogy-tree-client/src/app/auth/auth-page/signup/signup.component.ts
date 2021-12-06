import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, NgForm } from '@angular/forms';
import { UserSignupModel } from '../../models/user-signup.model';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss'],
})
export class SignupComponent implements OnInit {
  @ViewChild('signupForm') signupForm: NgForm;

  // public usernameCtrl: FormControl;
  // public firstNameCtrl: FormControl;
  // public lastNameCtrl: FormControl;
  // public genderCtrl: FormControl;
  // public birthdayCtrl: FormControl;
  // public emailCtrl: FormControl;
  // public passwordCtrl: FormControl;
  // public confirmPasswordCtrl: FormControl;

  constructor() {}
  ngOnInit() {}
  onSubmit(form: NgForm) {
    if (!form.valid) {
      return;
    }
    // const sigupModel: UserSignupModel = {
    //   firstName: form.value.firstName,
    //   lastName: form.value.lastName,
    //   gender: form.value.gender,
    //   nationality: form.value.nationality,
    //   birthdate: form.value.birthday,
    //   email: form.value.email,
    //   username: form.value.username,
    //   password: form.value.password,
    // };
    // return sigupModel;
    //this.authenticate(email, password);
  }
}
