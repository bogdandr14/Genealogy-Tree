import { Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, NgForm, Validators } from '@angular/forms';
import { UserLoginModel } from '../../models/user-login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  @Output() tryLogin = new EventEmitter<UserLoginModel>();

  public loginGroup: FormGroup;
  public usernameCtrl: FormControl;
  public passwordCtrl: FormControl;

  constructor(private formBuilder: FormBuilder) {
    this.loadForm();
  }

  ngOnInit() { }

  onSubmit() {
    if (this.loginGroup.invalid) {
      return;
    }

    const loginModel: UserLoginModel = {
      username: this.usernameCtrl.value,
      password: this.passwordCtrl.value,
    };
    this.loginGroup.reset();
    this.tryLogin.emit(loginModel);
  }

  private loadForm() {
    this.loginGroup = this.formBuilder.group({
      username: (this.usernameCtrl = new FormControl(null, [Validators.required])),
      password: (this.passwordCtrl = new FormControl(null, [Validators.minLength(8)]))
    });
  }
}
