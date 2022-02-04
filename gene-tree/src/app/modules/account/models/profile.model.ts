import { CommonObject } from "../../shared/models/common-object";
import { ImageFile } from "../../shared/models/image-file";
import { LocationModel } from "../../shared/models/location.model";

export class AccountProfileModel {
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
}
