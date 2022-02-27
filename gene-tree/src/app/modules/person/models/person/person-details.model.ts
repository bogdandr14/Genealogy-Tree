import { RelativeModel } from './../relative/relative.model';
import { Guid } from "guid-typescript";
import { MarriedPersonModel } from "../marriage/married-person.model";
import { PersonEditModel } from "./person-edit.model";


export class PersonDetailsModel extends PersonEditModel{
  parents: RelativeModel[];
  children: RelativeModel[];
  marriages: MarriedPersonModel[];
}
