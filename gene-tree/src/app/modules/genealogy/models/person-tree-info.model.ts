import { GenericPersonModel } from '../../person/models/generic-person.model';

export class PersonTreeInfoModel extends GenericPersonModel {
  motherId: number;
  fatherId: number;
  partnersIds: number[];
}
