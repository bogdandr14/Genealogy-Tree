import { EventInTreeModel } from './event-in-tree.model';
export class CalendarEventModel extends EventInTreeModel {
  constructor(eventInTree: EventInTreeModel, allDay: boolean = true) {
    super();
    this.eventType = eventInTree.eventType;
    this.affectedPeople = eventInTree.affectedPeople;
    this.date = this.startTime = this.endTime = new Date(eventInTree.date);
    this.allDay = allDay;
  }
  title: string;
  startTime: Date;
  endTime: Date;
  allDay: boolean;
}
