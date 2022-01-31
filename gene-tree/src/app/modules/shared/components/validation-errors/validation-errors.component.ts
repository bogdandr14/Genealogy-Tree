import { Component, Input, OnInit } from '@angular/core';
import { NgModel, ValidationErrors } from '@angular/forms';

@Component({
  selector: 'app-validation-errors',
  templateUrl: './validation-errors.component.html',
  styleUrls: ['./validation-errors.component.scss'],
})
export class ValidationErrorsComponent implements OnInit {
  @Input() model: NgModel;
  @Input() length: number;
  constructor() {}

  ngOnInit() {}
  public getErrorKey(error) {
    return Object.keys(error)[0];
  }
}
