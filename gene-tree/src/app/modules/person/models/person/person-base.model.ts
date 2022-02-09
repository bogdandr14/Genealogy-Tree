import { GenericPersonModel } from './generic-person.model';
import { ImageFile } from '../../../shared/models/image-file';
import { Guid } from "guid-typescript";

export class PersonBaseModel extends GenericPersonModel {
  userId?: Guid;
}
