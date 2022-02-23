import { PersonDetailsModel } from "../../person/models/person/person-details.model";
import { EducationModel } from "./education.model";
import { OccupationModel } from "./occupation.model";

export class UserDetailsModel extends PersonDetailsModel {
  occupations: OccupationModel[];
  educations: EducationModel[];
  email: string;
  phoneNumber: string;
  about: string;
}
