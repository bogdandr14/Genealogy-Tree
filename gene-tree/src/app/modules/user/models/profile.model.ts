import { EducationModel } from './../../user/models/education.model';
import { OccupationModel } from './../../user/models/occupation.model';
import { PersonDetailsModel } from '../../person/models/person/person-details.model';

export class AccountProfileModel extends PersonDetailsModel {
  email: string;
  phoneNumber: string;
  about: string;
  lastTreeUpdate: Date;
  occupations: OccupationModel[];
  educations: EducationModel[];
}
