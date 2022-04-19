import { Guid } from 'guid-typescript';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { EducationLevelEnum } from "./education-level.enum";

export class EducationModel {
  constructor(){
    this.educationLevel = new CommonObject();
  }
  id: number;
  userId: Guid;
  educationInstituteName: string;
  educationLevel: CommonObject;
  startDate?: Date;
  endDate?: Date;
}
