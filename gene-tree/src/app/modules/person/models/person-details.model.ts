import { ParentChildBaseModel } from '../parent-child/models/parent-child-base.model';
import { MarriedPersonModel } from "../marriage/models/married-person.model";
import { PersonEditModel } from "./person-edit.model";


export class PersonDetailsModel extends PersonEditModel{
  parents: ParentChildBaseModel[];
  children: ParentChildBaseModel[];
  marriages: MarriedPersonModel[];
}
