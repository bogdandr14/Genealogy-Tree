import { LocationModel } from "../../shared/models/location.model";

export class UserProfileModel {
  firstName: string;
  lastName: string;
  genderName: string;
  nationality: string;
  religion: string;
  email: string;
  phoneNumber: string;
  about: string;
  livingPlace: LocationModel;
  birthPlace: LocationModel;
  birthDate: Date;
  lastTreeUpdate: Date;
}
