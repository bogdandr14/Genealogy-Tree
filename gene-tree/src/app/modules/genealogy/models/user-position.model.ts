import { ImageFile } from './../../shared/models/image-file';
import { PositionModel } from './position.model';

export class UserPositionModel extends PositionModel {
  firstName: string;
  lastName: string;
  lastVerified: Date;
  imageFile: ImageFile;
}
