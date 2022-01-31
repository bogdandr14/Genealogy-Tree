/* eslint-disable no-debugger */
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { first, takeUntil } from 'rxjs/operators';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { AuthService } from '../../../core/services/auth.service';
import { LoginModel } from '../../models/login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnDestroy {
  private destroy$: Subject<boolean> = new Subject();
  public loginModel = new LoginModel();

  constructor(
    private authService: AuthService,
    private router: Router,
    private alertService: AlertService
  ) {}

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }

  public onLogin(): void {
    this.authService.login(this.loginModel).pipe(first()).subscribe(
      (data) => this.alertService.showSuccess('_successMessage.login'),
      (error) => this.alertService.showError(error)
    );
  }

  public onNavigateToRegister(): void {
    this.router.navigate(['account', 'register']);
  }
}
