import { Guid } from 'guid-typescript';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { EducationLevelEnum } from "./education-level.enum";

export class EducationModel {
  id: number;
  userId: Guid;
  educationInstituteName: string;
  level: CommonObject;
  startDate?: Date;
  endDate?: Date;
}
