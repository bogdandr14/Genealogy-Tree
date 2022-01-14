/* eslint-disable no-debugger */
import { Directive } from "@angular/core";
import { AbstractControl, AsyncValidator, NG_VALIDATORS, ValidationErrors, Validator } from "@angular/forms";
import { Observable, of } from "rxjs";
import { catchError, debounceTime, distinctUntilChanged, map } from "rxjs/operators";
import { UserService } from "../../core/services/user.service";

@Directive({
  selector: '[usernameCheck]',
  providers: [{ provide: NG_VALIDATORS, useExisting: UsernameCheckDirective, multi: true }]
})
export class UsernameCheckDirective implements AsyncValidator {

  constructor(private userService: UserService
  ) { }

  validate(control: AbstractControl): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> {
    if (!control.value || control.value.length <= 5) {
      return new Promise(null);
    }
    debugger;
    const obs = this.userService.checkUsernameTaken(control.value).pipe(
      debounceTime(500),
      distinctUntilChanged(),
      map(isAvailable => (isAvailable ? null : { usernameTaken: true })),
      catchError(() => of(null))
    );
    return obs;
  }
}
