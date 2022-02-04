import { Component, Input, OnInit } from '@angular/core';
import { NgModel, ValidationErrors } from '@angular/forms';

@Component({
  selector: 'app-validation-errors',
  templateUrl: './validation-errors.component.html',
  styleUrls: ['./validation-errors.component.scss'],
})
export class ValidationErrorsComponent implements OnInit {
  @Input() model: NgModel;
  @Input() number: number;
  constructor() {}

  ngOnInit() {}
  public getErrorKey(error) {
    return Object.keys(error)[0];
  }

  public getTranslationParameters(error): any {
    const errorType = this.getErrorKey(error);
    if (
      errorType.includes('length') ||
      errorType.includes('Value') ||
      errorType.includes('Size')
    ) {
      return { number: this.number };
    }
    return {};
  }
}
