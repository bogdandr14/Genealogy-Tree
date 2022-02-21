import { Guid } from "guid-typescript";
import { ImageFile } from "../../../shared/models/image-file";

export class GenericPersonModel{
  treeId: Guid;
  userId?: Guid;
  personId: number;
  firstName: string;
  lastName: string;
  birthDate: Date;
  deathDate: Date;
  imageFile?: ImageFile;
}
