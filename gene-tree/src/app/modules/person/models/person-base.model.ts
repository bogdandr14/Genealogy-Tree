import { ImageFile } from "../../shared/models/image-file";

export class PersonBaseModel {
  personId: number;
  firstName: string;
  lastName: string;
  imageFile: ImageFile;
}
