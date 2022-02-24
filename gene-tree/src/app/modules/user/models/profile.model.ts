import { EducationModel } from './../../user/models/education.model';
import { OccupationModel } from './../../user/models/occupation.model';
import { CommonObject } from '../../shared/models/common-object';
import { ImageFile } from '../../shared/models/image-file';
import { LocationModel } from '../../shared/models/location.model';
import { PersonDetailsModel } from '../../person/models/person/person-details.model';

export class AccountProfileModel extends PersonDetailsModel {
  personId: number;
  firstName: string;
  lastName: string;
  gender: CommonObject;
  nationality: CommonObject;
  religion: CommonObject;
  email: string;
  phoneNumber: string;
  about: string;
  livingPlace: LocationModel;
  birthPlace: LocationModel;
  birthDate: Date;
  lastTreeUpdate: Date;
  imageFile: ImageFile;
  occupations: OccupationModel[];
  educations: EducationModel[];
}
