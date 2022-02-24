import { formatDate } from '@angular/common';
import { Component, EventEmitter, Inject, Input, LOCALE_ID, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-date-select-template',
  templateUrl: './date-select-template.component.html',
  styleUrls: ['./date-select-template.component.scss'],
})
export class DateSelectTemplateComponent implements OnInit {
  @Input() name: string;
  @Input() isRequired: boolean;
  @Input() id: number = 0;
  @Input() set date(date: Date) {
    if (date) {
      this.setDate(date);
    }
  }
  @Output() dateChange = new EventEmitter<Date>();

  private _date: Date;
  get date() {
    return this._date;
  }
  public selectedDate: string | Date;
  constructor(@Inject(LOCALE_ID) private locale) {}

  ngOnInit() {}

  setDate(date: string | Date) {
    this._date = new Date(date);
    this.selectedDate = formatDate(date, 'dd/MM/yyyy', this.locale);
    this.dateChange.emit(this._date);
  }
}
