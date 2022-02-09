import { Guid } from "guid-typescript";
import { ChildModel } from "../child.model";
import { MarriedPersonModel } from "../marriage/married-person.model";
import { ParentModel } from "../parent.model";
import { PersonEditModel } from "./person-edit.model";


export class PersonDetailsModel extends PersonEditModel{
  userId?: Guid;
  parents: ParentModel[];
  children: ChildModel[];
  marriages: MarriedPersonModel[];
}
