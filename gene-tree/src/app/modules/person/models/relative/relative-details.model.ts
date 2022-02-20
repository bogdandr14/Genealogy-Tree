import { PersonDetailsModel } from "../person/person-details.model";
import { RelativeBaseModel } from "./relative-base.model";

export class RelativeDetailsModel extends RelativeBaseModel{
  child: PersonDetailsModel;
  parent: PersonDetailsModel
}
