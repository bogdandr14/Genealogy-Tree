import { MarriedPersonModel } from "../../marriages/models/married-person.model";
import { ChildModel } from "../../relatives/models/child.model";
import { ParentModel } from "../../relatives/models/parent.model";
import { PersonEditModel } from "./person-edit.model";

export class PersonDetailsModel extends PersonEditModel{
  parents: ParentModel[];
  children: ChildModel[];
  marriages: MarriedPersonModel[];
}
