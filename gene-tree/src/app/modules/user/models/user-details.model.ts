import { PersonDetailsModel } from "../../person/models/person-details.model";
import { EducationModel } from "./../education/models/education.model";
import { OccupationModel } from "../occupation/models/occupation.model";

export class UserDetailsModel extends PersonDetailsModel {
  occupations: OccupationModel[];
  educations: EducationModel[];
  email: string;
  phoneNumber: string;
  about: string;
}
