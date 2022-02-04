/* eslint-disable no-debugger */
import { Directive, Input } from '@angular/core';
import {
  AbstractControl,
  NG_VALIDATORS,
  ValidationErrors,
  Validator,
} from '@angular/forms';

@Directive({
  selector: '[fileMaxSize]',
  providers: [
    { provide: NG_VALIDATORS, useExisting: FileMaxSizeDirective, multi: true },
  ],
})
export class FileMaxSizeDirective implements Validator {
  @Input() fileMaxSize: number;

  constructor() {}
  validate(control: AbstractControl): ValidationErrors | null {
    if (!control.value) {
      return null;
    }
    console.log(
      '🚀 ~ file: file-max-size.directive.ts ~ line 17 ~ FileMaxSizeDirective ~ validate ~ control.value',
      control.value
    );
    debugger;
    const file: File = control.value.target.files[0];
    if (file.type.indexOf('image') === -1) {
      return { invalidImage: true };
    }
    if (file.size > this.fileMaxSize * 1024 * 1024) {
      return { maxSizeExceeded: true };
    }
    return null;
  }
}
