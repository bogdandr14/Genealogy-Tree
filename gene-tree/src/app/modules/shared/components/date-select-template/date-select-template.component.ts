import { LocaleService } from './../../../core/services/locale.service';
import { formatDate } from '@angular/common';
import { ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

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
  constructor(public localeService: LocaleService, private cdr: ChangeDetectorRef) { }

  ngOnInit() { }

  setDate(date: string | Date) {
    this._date = new Date(date);
    this.selectedDate = formatDate(date, 'dd/MM/yyyy', this.localeService.currentLocale);
    this.dateChange.emit(this._date);
    this.cdr.detectChanges();
  }
}
