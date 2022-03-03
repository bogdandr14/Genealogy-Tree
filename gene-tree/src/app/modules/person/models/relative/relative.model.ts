import { GenericPersonModel } from './../person/generic-person.model';
export class RelativeModel extends GenericPersonModel{
  relativeId: number;
  bloodRelatives: boolean;
}
