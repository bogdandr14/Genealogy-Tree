import { UpdateTypeEnum } from './update-type.enum';

export class UpdateInfoModel {
  updateType: UpdateTypeEnum;
  affectedPeopleNames: string[];
  referenceId: number;
}
