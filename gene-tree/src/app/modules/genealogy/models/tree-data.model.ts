import { Guid } from "guid-typescript";

export class TreeDataModel {
  id: number;
  mid: number;
  fid: number;
  pids: number[];
  gender: string;
  photo?: string;
  name: string;
  born: string;
  userId?: Guid;
}
