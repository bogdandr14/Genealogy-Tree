import { Component, OnInit, ViewChild } from '@angular/core';
import { CalendarComponent } from 'ionic2-calendar';

@Component({
  selector: 'app-genealogy-events',
  templateUrl: './genealogy-events.component.html',
  styleUrls: ['./genealogy-events.component.scss'],
})
export class GenealogyEventsComponent implements OnInit {
  @ViewChild(CalendarComponent) myCalendar: CalendarComponent;
  public events = [];
  public viewTitle: string;
  public isToday = false;
  public calendar = { mode: 'month', currentDate: new Date() };
  constructor() { }

  ngOnInit() { }

  onCurrentDateChanged(event: Date) {
    var today = new Date();
    today.setHours(0, 0, 0, 0);
    event.setHours(0, 0, 0, 0);
    this.isToday = today.getTime() === event.getTime();
  }

  loadEvents() {
    this.events = this.createRandomEvents();
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
  onEventSelected(event) {
    console.log('Event selected:' + event.startTime + '-' + event.endTime + ',' + event.title);
  }
  today() {
    this.calendar.currentDate = new Date();
  }
}
