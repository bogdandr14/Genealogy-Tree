import { GenericPersonModel } from '../../models/generic-person.model';
export class ParentChildBaseModel extends GenericPersonModel{
  parentChildId: number;
  bloodRelatives: boolean;
}
