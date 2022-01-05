import { LocationModel } from "./location.model";

export class PersonModel {
  id: number;
  firstName: string;
  lastName: string;
  genderName: string;
  nationality: string;
  religion: string;
  livingPlace?: LocationModel;
  birthPlace?: LocationModel;
  birthDate: Date;
  deathDate?: Date;
  lastUpdate: Date;
  fistParent?: PersonModel;
  secondParent?: PersonModel;
}
