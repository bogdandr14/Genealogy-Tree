import { GenericPersonModel } from '../../person/models/person/generic-person.model';

export class PersonTreeInfoModel extends GenericPersonModel {
  motherId: number;
  fatherId: number;
  partnersIds: number[];
}
