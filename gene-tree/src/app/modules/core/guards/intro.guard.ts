import { DataService } from 'src/app/modules/core/services/data.service';
import { Injectable } from '@angular/core';
import { CanLoad, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class IntroGuard implements CanLoad {
  constructor(private router: Router, private dataService: DataService) {}
  canLoad(): Observable<boolean> {
    return this.dataService.get<boolean>('has-seen-intro').pipe(
      tap((hasSeenIntro) => {
        if (!hasSeenIntro) {
          this.router.navigate(['/intro']);
        }
        return true;
      })
    );
  }
}
