import { GenericPersonModel } from "./person/generic-person.model";
import { RelativeBaseModel } from "./relative/relative-base.model";

export class ParentModel extends RelativeBaseModel{
  parent: GenericPersonModel;
}
