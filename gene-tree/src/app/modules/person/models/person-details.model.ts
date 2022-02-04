import { ImageFile } from "../../shared/models/image-file";
import { ChildModel } from "./child.model";
import { MarriedPersonModel } from "./married-person.model";
import { ParentModel } from "./parent.model";
import { PersonEditModel } from "./person-edit.model";


export class PersonDetailsModel extends PersonEditModel{
  parents: ParentModel[];
  children: ChildModel[];
  marriages: MarriedPersonModel[];
  imageFile: ImageFile;
}
