import { PersonDetailsModel } from "../../person/models/person-details.model";

export class MarriedPersonModel {
  id: number;
  marriageStarted: Date;
  marriageEnded: Date;
  secondPerson: PersonDetailsModel;
}
