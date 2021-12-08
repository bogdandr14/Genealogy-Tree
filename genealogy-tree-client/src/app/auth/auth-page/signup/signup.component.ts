import { Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, NgForm, Validators } from '@angular/forms';
import { UserSignupModel } from '../../models/user-signup.model';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss'],
})
export class SignupComponent implements OnInit {
  @Output() trySignup = new EventEmitter<UserSignupModel>();

  public signupGroup: FormGroup;
  public usernameCtrl: FormControl;
  public firstNameCtrl: FormControl;
  public lastNameCtrl: FormControl;
  public genderCtrl: FormControl;
  public birthdayCtrl: FormControl;
  public nationalityCtrl: FormControl;
  public emailCtrl: FormControl;
  public passwordCtrl: FormControl;
  public confirmPasswordCtrl: FormControl;

  constructor(private formBuilder: FormBuilder) {
    this.loadForm();
  }

  ngOnInit() { }

  onSubmit() {
    if (this.signupGroup.invalid) {
      return;
    }
    const signupModel: UserSignupModel = {
      firstName: this.firstNameCtrl.value,
      lastName: this.lastNameCtrl.value,
      gender: this.genderCtrl.value,
      nationality: this.nationalityCtrl.value,
      birthdate: this.birthdayCtrl.value,
      email: this.emailCtrl.value,
      username: this.usernameCtrl.value,
      password: this.passwordCtrl.value,
    };
    this.trySignup.emit(signupModel);
  }

  private loadForm() {
    this.signupGroup = this.formBuilder.group({
      username: (this.usernameCtrl = new FormControl(null, [Validators.required])),
      firstName: (this.firstNameCtrl = new FormControl(null, [Validators.required])),
      lastName: (this.lastNameCtrl = new FormControl(null, [Validators.required])),
      gender: (this.genderCtrl = new FormControl(null, [Validators.required])),
      nationality: (this.nationalityCtrl = new FormControl(null, [Validators.required])),
      birthday: (this.birthdayCtrl = new FormControl(null, [Validators.required])),
      email: (this.emailCtrl = new FormControl(null, [Validators.email])),
      password: (this.passwordCtrl = new FormControl(null, [Validators.minLength(8)])),
      confirmPassword: (this.confirmPasswordCtrl = new FormControl(null, [Validators.pattern(this.passwordCtrl.value)]))
    });
  }
}
