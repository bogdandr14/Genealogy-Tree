import { PersonBaseModel } from "../../person/models/person-base.model";

export class EventInTreeModel {
  date: Date;
  eventType: string;
  affectedPeople: PersonBaseModel[];
}
