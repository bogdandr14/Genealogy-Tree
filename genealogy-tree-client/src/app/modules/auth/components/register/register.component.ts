/* eslint-disable no-debugger */
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { Subject } from 'rxjs';
import { debounceTime, distinctUntilChanged, map, takeUntil } from 'rxjs/operators';
import { UserService } from 'src/app/modules/core/services/user.service';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { GenderService } from 'src/app/modules/shared/services/gender.service';
import { NationalityService } from 'src/app/modules/shared/services/nationality.service';
import { AuthService } from '../../../core/services/auth.service';
import { RegisterModel } from '../../models/register.model';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent implements OnDestroy, OnInit {
  private destroy$: Subject<boolean> = new Subject();
  public registerModel = new RegisterModel();
  public genderOptions: CommonObject[] = [
    { id: 1, name: 'male' },
    { id: 2, name: 'female' },
    { id: 3, name: 'other' },
  ];
  public nationalityOptions: CommonObject[] = [
    { id: 1, name: 'ro' },
    { id: 2, name: 'bg' },
    { id: 3, name: 'gb' },
  ];
  public isUsernameAvailable: boolean = true;
  public isEmailAvailable: boolean = true;

  constructor(
    private authService: AuthService,
    private genderService: GenderService,
    private nationalityService: NationalityService,
    private userService: UserService,
    private router: Router
  ) {}

  ngOnInit(): void {
    // this.genderService
    //   .getMany<CommonObject>(null)
    //   .pipe(takeUntil(this.destroy$))
    //   .subscribe((genders) => {
    //     this.genderOptions = genders;
    //   });
    // this.nationalityService
    //   .getMany<CommonObject>(null)
    //   .pipe(takeUntil(this.destroy$))
    //   .subscribe((nationalities) => {
    //     this.nationalityOptions = nationalities;
    //   });
  }

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }

  public onRegister(): void {
    this.authService
      .register(this.registerModel)
      .pipe(takeUntil(this.destroy$))
      .subscribe(() => {
        this.onNavigateToLogin();
      });
  }

  public onNavigateToLogin(): void {
    this.router.navigate(['auth', 'login']);
  }
}
