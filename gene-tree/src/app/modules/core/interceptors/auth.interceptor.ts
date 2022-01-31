import { environment } from 'src/environments/environment';
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
} from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { StorageService } from '../services/storage.service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  private tokenState = new BehaviorSubject<string>(null);

  constructor(private storageService: StorageService) {
    this.storageService.token$.subscribe((token) => {
      this.tokenState.next(token);
    });
  }

  public intercept(
    request: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    if (this.tokenState.value) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${this.tokenState.value}`,
        },
      });
    }

    return next.handle(request);
  }
}
