import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, NgForm } from '@angular/forms';
import { UserLoginModel } from '../../models/user-login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  @ViewChild('loginForm') loginForm: NgForm;

  constructor() {}

  ngOnInit() {}
  onSubmit(form: NgForm) {
    if (!form.valid) {
      return;
    }

    const loginModel: UserLoginModel = {
      username: form.value.username,
      password: form.value.password,
    };
    //return loginModel;
    //this.authenticate(email, password);
  }
}
