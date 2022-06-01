import { GenericPersonModel } from './../../person/models/generic-person.model';

export class RelativeModel {
  id: number;
  relativeUser: GenericPersonModel;
  relativePersonInTreeId: number;
}
