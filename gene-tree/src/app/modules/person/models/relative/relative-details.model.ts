import { PersonDetailsModel } from "../person/person-details.model";

export class RelativeDetailsModel {
  id: number;
  bloodRelatives: boolean;
  child: PersonDetailsModel;
  parent: PersonDetailsModel
}
