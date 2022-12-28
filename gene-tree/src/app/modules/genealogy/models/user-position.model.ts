import { ImageFile } from './../../shared/models/image-file';
import { PositionModel } from './position.model';

export class UserPositionModel extends PositionModel {
  firstName: string;
  lastName: string;
  updatedOn: Date;
  imageFile: ImageFile;
  type: string;
}
