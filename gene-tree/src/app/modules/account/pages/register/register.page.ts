import { CommonService } from './../../../shared/services/common.service';
import { AlertService } from './../../../core/services/alert.service';
import { AuthService } from './../../../core/services/auth.service';
import { CommonObject } from './../../../shared/models/common-object';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { first, takeUntil } from 'rxjs/operators';
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
  public genderOptions: CommonObject[] = [];
  public nationalityOptions: CommonObject[] = [];
  public religionOptions: CommonObject[] = [];

  constructor(
    private authService: AuthService,
    private commonService: CommonService,
    private alertService: AlertService,
    private router: Router
  ) {}

  ngOnInit(): void {

    this.commonService.getGenders()
      .pipe(takeUntil(this.destroy$))
      .subscribe((genders) => {
        this.genderOptions = genders;
      });
    this.commonService.getNationalities()
      .pipe(takeUntil(this.destroy$))
      .subscribe((nationalities) => {
        this.nationalityOptions = nationalities;
      });
    this.commonService.getReligions()
      .pipe(takeUntil(this.destroy$))
      .subscribe((religions) => {
        this.religionOptions = religions;
      });
  }

  formatDate(date: string): Date {
    return new Date(date);
  }

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }

  public show(toShow) {
    console.log(Object.keys(toShow));
  }
  public getKeys(errors) {
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
          this.alertService.showSuccess('_message._success.register');
          this.onNavigateToLogin();
        },
        (error) => this.alertService.showError(error)
      );
  }

  private onNavigateToLogin(): void {
    this.router.navigate(['account', 'login']);
  }
}
