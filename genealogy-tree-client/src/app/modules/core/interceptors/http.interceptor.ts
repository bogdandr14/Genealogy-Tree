/* eslint-disable no-debugger */
import { AuthService } from './../services/auth.service';
import { HttpInterceptorParams } from 'src/app/modules/core/models/http-interceptor-params.model';
import {
  HttpEvent,
  HttpInterceptor,
  HttpHandler,
  HttpRequest,
  HttpErrorResponse,
  HttpStatusCode,
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, filter, tap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { BadRequestError } from '../models/errors/bad-request-error';
import { NotFoundError } from '../models/errors/not-found-error';
import { ConflictError } from '../models/errors/conflict-error';
import { ForbiddenError } from '../models/errors/forbidden-error';
import { UnauthorizedError } from '../models/errors/unauthorized-error';
import { AppError } from '../models/errors/app-error';
import { AlertService } from '../services/alert.service';

@Injectable()
export class AppHttpInterceptor implements HttpInterceptor {
  constructor(private alertService: AlertService, private authService: AuthService) { }

  intercept(
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    const config = (req.params as HttpInterceptorParams).interceptorConfig;
    const successMessage = config?.successMessage ?? '';
    const showSuccessMessage = config?.showSuccessMessage;
    const request = req.clone({
      headers: req.headers.set('Content-Type', 'application/json'),
    });

    return next.handle(request).pipe(
      filter((e) => e.type !== 0),
      tap(() => {
        if (showSuccessMessage) this.alertService.showSuccess(successMessage);
      }),
      catchError((err) => this.handleError(err))
    );
  }

  public handleError(errorResponse: HttpErrorResponse): Observable<never> {
    let error: AppError;
    switch (errorResponse?.status) {
      case HttpStatusCode.BadRequest: {
        error = new BadRequestError(errorResponse?.error);
        break;
      }
      case HttpStatusCode.NotFound: {
        error = new NotFoundError(errorResponse?.error);
        break;
      }
      case HttpStatusCode.Conflict: {
        error = new ConflictError(errorResponse?.error);
        break;
      }
      case HttpStatusCode.Forbidden: {
        error = new ForbiddenError(errorResponse?.error);
        break;
      }
      case HttpStatusCode.Unauthorized: {
        this.authService.logout();
        error = new UnauthorizedError(errorResponse?.error);
        break;
      }
      case HttpStatusCode.InternalServerError: {
        error = new AppError('Invalid Request');
        break;
      }
      default: {
        error = new AppError(errorResponse);
      }
    }
    this.alertService.showError(error.message, error.status);
    throw error;
  }
}
