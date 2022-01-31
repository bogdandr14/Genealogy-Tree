import { CommonObject } from "../../shared/models/common-object";
import { LocationModel } from "../../shared/models/location.model";
import { PersonBaseModel } from "./person-base.model";
import { Guid } from "guid-typescript";

export class PersonEditModel extends PersonBaseModel {
  constructor(){
    super();
    this.gender = new CommonObject();
    this.nationality = new CommonObject();
    this.religion = new CommonObject();
    this.birthPlace = new LocationModel();
    this.livingPlace = new LocationModel();
  }
  userId: string;
  treeId: string;
  gender: CommonObject;
  nationality: CommonObject;
  religion: CommonObject;
  birthPlace: LocationModel;
  livingPlace: LocationModel;
}
