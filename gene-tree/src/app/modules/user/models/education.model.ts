import { EducationLevelEnum } from "./education-level.enum";

export class EducationModel {
  id: number;
  instituteName: string;
  level: EducationLevelEnum;
  startDate?: Date;
  endDate?: Date;
}
