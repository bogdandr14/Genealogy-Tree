import { GenericPersonModel } from './../person/generic-person.model';
export class RelativeModel extends GenericPersonModel{
  id: number;
  bloodRelatives: boolean;
}
