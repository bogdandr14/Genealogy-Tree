import { PersonBaseModel } from "./person/person-base.model";
import { RelativeBaseModel } from "./relative/relative-base.model";

export class ParentModel extends RelativeBaseModel{
  parent: PersonBaseModel;
}
