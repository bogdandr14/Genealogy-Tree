import { PersonDetailsModel } from "../../models/person-details.model";

export class ParentChildDetailsModel {
  id: number;
  bloodRelatives: boolean;
  child: PersonDetailsModel;
  parent: PersonDetailsModel
}
