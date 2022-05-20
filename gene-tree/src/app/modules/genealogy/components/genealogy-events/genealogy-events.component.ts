import { CalendarEventModel } from './../../models/calendar-event.model';
import { PersonService } from '../../../person/service/person.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { CalendarComponent } from 'ionic2-calendar';
import { DataService } from '../../../core/services/data.service';
import { switchMap, take, tap } from 'rxjs/operators';
import { EventInTreeModel } from '../../models/event-in-tree.model';
import { TranslateService } from '@ngx-translate/core';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { CalendarMode } from 'ionic2-calendar/calendar';

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
    private translateService: TranslateService
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
    if (event.getFullYear() != this.calendarEvents[0].startTime.getFullYear()) {
      this.setCalendarEvents(event.getFullYear());
    }
  }

  onEventSelected(event) {
    console.log('Event selected:' + event.startTime + '-' + event.endTime + ',' + event.title);
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

  public getImageUrl(imageFile:ImageFile){
    if (imageFile) {
      return `data:${imageFile.mimeType};base64,${imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  private setOriginalEvents(events: EventInTreeModel[]) {
    this.originalEvents = events.map(event => {
      let title: string;
      switch (event.eventType) {
        case 'BIRTHDAY':
          title = this.translateService.instant('birthday',
            { name: `${event.affectedPeople[0].firstName} ${event.affectedPeople[0].lastName}` })
          break;
        case 'MARRIAGE':
          title = this.translateService.instant('marriage',
            {
              firstPerson: `${event.affectedPeople[0].firstName} ${event.affectedPeople[0].lastName}`,
              secondPerson: `${event.affectedPeople[1].firstName} ${event.affectedPeople[1].lastName}`
            })
          break;
      }
      return new CalendarEventModel(event, title);
    });
  }

  private setCalendarEvents(year: number) {
    this.calendarEvents = this.originalEvents.map(event => {
      event.startTime = this.getEventDate(event.startTime, year);
      event.endTime = this.getEventDate(event.endTime, year);
      return event;
    }).filter(event => event.date <= event.startTime);
  }

  private getEventDate(date: any, year: number) {
    const eventDate = new Date(date);
    eventDate.setFullYear(year);
    return eventDate;
  }

  private createRandomEvents() {
    var events = [];
    for (var i = 0; i < 50; i += 1) {
      var date = new Date();
      var eventType = Math.floor(Math.random() * 2);
      var startDay = Math.floor(Math.random() * 90) - 45;
      var endDay = Math.floor(Math.random() * 2) + startDay;
      var startTime;
      var endTime;
      if (eventType === 0) {
        startTime = new Date(Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate() + startDay));
        if (endDay === startDay) {
          endDay += 1;
        }
        endTime = new Date(Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate() + endDay));
        events.push({
          title: 'All Day - ' + i,
          startTime: startTime,
          endTime: endTime,
          allDay: true
        });
      } else {
        var startMinute = Math.floor(Math.random() * 24 * 60);
        var endMinute = Math.floor(Math.random() * 180) + startMinute;
        startTime = new Date(date.getFullYear(), date.getMonth(), date.getDate() + startDay, 0, date.getMinutes() + startMinute);
        endTime = new Date(date.getFullYear(), date.getMonth(), date.getDate() + endDay, 0, date.getMinutes() + endMinute);
        events.push({
          title: 'Event - ' + i,
          startTime: startTime,
          endTime: endTime,
          allDay: false
        });
      }
    }
    return events;
  }
}
