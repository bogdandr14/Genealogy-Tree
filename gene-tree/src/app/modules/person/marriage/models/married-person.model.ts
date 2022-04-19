import { GenericPersonModel } from "../../models/generic-person.model";

export class MarriedPersonModel {
  id: number;
  marriageStarted: Date;
  marriageEnded: Date;
  personMarriedTo: GenericPersonModel;
}
