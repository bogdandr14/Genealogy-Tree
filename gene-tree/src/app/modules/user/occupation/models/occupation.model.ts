import { Guid } from "guid-typescript";

export class OccupationModel {
  id: number;
  userId: Guid;
  occupationName: string;
  workingPlaceName: string;
  startDate?: Date;
  endDate?: Date;
}
