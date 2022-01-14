/* eslint-disable no-debugger */
import { Directive } from "@angular/core";
import { AbstractControl, AsyncValidator, NG_VALIDATORS, ValidationErrors } from "@angular/forms";
import { Observable, of } from "rxjs";
import { catchError, debounceTime, distinctUntilChanged, map } from "rxjs/operators";
import { UserService } from "../../core/services/user.service";

@Directive({
  selector: '[emailCheck]',
  providers: [{ provide: NG_VALIDATORS, useExisting: EmailCheckDirective, multi: true }]
})
export class EmailCheckDirective implements AsyncValidator {
  private valid: boolean;

  private readonly pattern: string = '^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$';

  constructor(private userService: UserService
  ) { }

  validate(control: AbstractControl): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> {
    if (!control.value) {
      return null;
    }
    const regex = new RegExp(this.pattern);
    const valid = regex.test(control.value);
    if (!valid) {
      debugger;
      return new Promise<ValidationErrors>(() => {
        return { invalidEmail: true };
      });
    }
    const obs = this.userService.checkEmailTaken(control.value).pipe(
      debounceTime(500),
      distinctUntilChanged(),
      map(isAvailable => (isAvailable ? null : { emailTaken: true })),
      catchError(() => of(null))
    ); debugger;
    return obs;
  }
}
