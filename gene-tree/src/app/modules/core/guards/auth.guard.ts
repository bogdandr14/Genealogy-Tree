import { Injectable } from '@angular/core';
import { CanLoad } from '@angular/router';
import { Observable } from 'rxjs';
import { filter, map, take } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';
@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanLoad {
  constructor(private authService: AuthService) {}
  canLoad(): Observable<boolean> {
    return this.authService.isLoggedIn.pipe(
      filter((val) => val !== null),
      take(1),
      map((isLoggedIn) => {
        if (isLoggedIn) {
          return true;
        } else {
          this.authService.logout();
          return false;
        }
      })
    );
  }
}
