import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { first, takeUntil } from 'rxjs/operators';
import { HttpInterceptorConfig } from 'src/app/modules/core/models/http-interceptor-config.model';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { AuthService } from 'src/app/modules/core/services/auth.service';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { GenderService } from 'src/app/modules/shared/services/gender.service';
import { NationalityService } from 'src/app/modules/shared/services/nationality.service';
import { RegisterModel } from '../../models/register.model';

@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit, OnDestroy {
  private destroy$: Subject<boolean> = new Subject();
  public registerModel = new RegisterModel();
  public selectedDate: Date;
  public isUsernameAvailable: boolean = true;
  public isEmailAvailable: boolean = true;
  public genderOptions: CommonObject[] = [];
  public nationalityOptions: CommonObject[] = [];

  constructor(
    private authService: AuthService,
    private genderService: GenderService,
    private nationalityService: NationalityService,
    private alertService: AlertService,
    private router: Router
  ) {}

  ngOnInit(): void {
    const params: HttpInterceptorConfig = { hideLoading: true };

    this.genderService
      .getMany<CommonObject>(null, params)
      .pipe(takeUntil(this.destroy$))
      .subscribe((genders) => {
        this.genderOptions = genders;
      });
    this.nationalityService
      .getMany<CommonObject>(null, params)
      .pipe(takeUntil(this.destroy$))
      .subscribe((nationalities) => {
        this.nationalityOptions = nationalities;
      });
  }

  formatDate(date: string): Date {
    return new Date(date);
  }

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }
  onBirthdayChange(){
    console.log(this.registerModel);
  }
  public show(toShow){
    console.log(Object.keys(toShow));
  }
  public getKeys(errors){
    console.log(Object.keys(errors));
    return Object.keys(errors)[0];
  }

  public onRegister(): void {
    this.registerModel.birthDate = new Date(this.registerModel.birthDate);
    this.authService
      .register(this.registerModel)
      .pipe(first())
      .subscribe(
        (data) => {
          this.alertService.showSuccess('_successMessage.register');
          this.onNavigateToLogin();
        },
        (error) => this.alertService.showError(error)
      );
  }

  private onNavigateToLogin(): void {
    this.router.navigate(['account', 'login']);
  }
}
