import { PersonDetailsModel } from '../../person/models/person-details.model';
import { MarriedPersonModel } from './married-person.model';

export class MarriageDetailsModel extends MarriedPersonModel {
  firstPerson: PersonDetailsModel;
}
