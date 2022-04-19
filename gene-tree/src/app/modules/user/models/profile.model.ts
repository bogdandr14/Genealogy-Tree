import { EducationModel } from './../education/models/education.model';
import { OccupationModel } from '../occupation/models/occupation.model';
import { PersonDetailsModel } from '../../person/models/person-details.model';

export class AccountProfileModel extends PersonDetailsModel {
  email: string;
  phoneNumber: string;
  about: string;
  lastTreeUpdate: Date;
  occupations: OccupationModel[];
  educations: EducationModel[];
}
