import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root',
})
export class LoginGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  public canActivate(): Observable<boolean> | Promise<boolean> | boolean {
    if (this.authService.isLoggedIn()) {
      this.router.navigate(['/account/profile']);
      return false;
    }
    return true;
  }
}
