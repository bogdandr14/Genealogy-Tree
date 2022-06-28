import { LocaleService } from './../../../core/services/locale.service';
import { CalendarEventModel } from './../../models/calendar-event.model';
import { PersonService } from '../../../person/service/person.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { CalendarComponent } from 'ionic2-calendar';
import { DataService } from '../../../core/services/data.service';
import { switchMap, take, tap } from 'rxjs/operators';
import { EventInTreeModel } from '../../models/event-in-tree.model';
import { ImageFile } from '../../../shared/models/image-file';
import { CalendarMode } from 'ionic2-calendar/calendar';
import { UtilsService } from 'src/app/modules/shared/services/utils.service';

@Component({
  selector: 'app-genealogy-events',
  templateUrl: './genealogy-events.component.html',
  styleUrls: ['./genealogy-events.component.scss'],
})
export class GenealogyEventsComponent implements OnInit {
  @ViewChild(CalendarComponent) myCalendar: CalendarComponent;
  public calendarEvents: CalendarEventModel[] = [];
  public originalEvents: CalendarEventModel[] = [];
  public viewTitle: string;
  public isToday = false;
  public calendar = { mode: <CalendarMode>'month', currentDate: new Date() };

  constructor(
    private dataService: DataService,
    private personService: PersonService,
    public localeService: LocaleService,
    public utilsService: UtilsService
  ) { }

  ngOnInit() {
    this.dataService
      .getCurrentUser()
      .pipe(
        switchMap((currentUser) => {
          return this.personService.getEventsInTree(currentUser.treeId);
        }),
        take(1)
      )
      .subscribe((events) => {
        this.setOriginalEvents(events);
        this.setCalendarEvents(new Date().getFullYear());
      });
  }

  public onCurrentDateChanged(event: Date) {
    var today = new Date();
    today.setHours(0, 0, 0, 0);
    event.setHours(0, 0, 0, 0);
    this.isToday = today.getTime() === event.getTime();
    if (!this.calendarEvents.length || event.getFullYear() != this.calendarEvents[0].startTime.getFullYear()) {
      this.setCalendarEvents(event.getFullYear());
    }
  }

  onEventSelected(event) {
    console.log(
      'Event selected:' +
      event.startTime +
      '-' +
      event.endTime +
      ',' +
      event.title
    );
  }

  today() {
    this.calendar.currentDate = new Date();
  }

  public onViewTitleChanged(title) {
    this.viewTitle = title;
  }

  public next() {
    this.myCalendar.slideNext();
  }

  public back() {
    this.myCalendar.slidePrev();
  }

  private setOriginalEvents(events: EventInTreeModel[]) {
    this.originalEvents = events.map((event) => {
      return new CalendarEventModel(event);
    });
  }

  private setCalendarEvents(year: number) {
    this.calendarEvents = this.originalEvents
      .map((event) => {
        event.startTime = this.getEventDate(event.startTime, year);
        event.endTime = this.getEventDate(event.endTime, year);
        return event;
      })
      .filter((event) => event.date <= event.startTime);
  }

  private getEventDate(date: any, year: number) {
    const eventDate = new Date(date);
    eventDate.setFullYear(year);
    return eventDate;
  }
}
