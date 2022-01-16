import { PersonBaseModel } from "../../person/models/person-base.model";
import { RelativeBaseModel } from "./relative-base.model";

export class ChildModel extends RelativeBaseModel{
  child: PersonBaseModel;
}
