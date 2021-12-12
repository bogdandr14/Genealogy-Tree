import { Component, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { AuthService } from '../../../core/services/auth.service';
import { LoginModel } from '../../models/login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnDestroy {
  private destroy$: Subject<boolean> = new Subject();
  public loginModel = new LoginModel();

  constructor(private authService: AuthService, private router: Router) {}

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }

  public onLogin(): void {
    this.authService
      .login(this.loginModel)
      .pipe(takeUntil(this.destroy$))
      .subscribe();
  }

  public onNavigateToRegister(): void {
    this.router.navigate(['auth', 'register']);
  }
}
