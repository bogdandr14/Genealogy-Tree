import { Guid } from "guid-typescript";

export class LoginResponseModel {
  personId!: number;
  treeId!: Guid;
  token!: string;
}
