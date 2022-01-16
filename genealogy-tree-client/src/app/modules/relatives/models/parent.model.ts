import { PersonBaseModel } from "../../person/models/person-base.model";
import { PersonDetailsModel } from "../../person/models/person-details.model";
import { RelativeBaseModel } from "./relative-base.model";

export class ParentModel extends RelativeBaseModel{
  parent: PersonBaseModel;
}
