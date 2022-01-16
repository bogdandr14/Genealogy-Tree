import { Guid } from "guid-typescript";
export class LoginResponseModel {
  userId!: Guid;
  personId!: number;
  token!: string;
}
