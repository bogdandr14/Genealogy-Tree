import { Guid } from 'guid-typescript';

export class CurrentUserModel {
  public personId!: number;
  public treeId!: Guid;
  public userId!: Guid;
  public firstName!: string;
  public lastName!: string;
  public username!: string;
  public email!: string;
}
