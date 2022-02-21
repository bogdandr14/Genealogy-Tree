import { GenericPersonModel } from "./person/generic-person.model";
import { RelativeBaseModel } from "./relative/relative-base.model";

export class ChildModel extends RelativeBaseModel{
  child: GenericPersonModel;
}
