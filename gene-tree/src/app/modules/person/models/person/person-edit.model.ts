import { GenericPersonModel } from './generic-person.model';
import { CommonObject } from '../../../shared/models/common-object';
import { LocationModel } from '../../../shared/models/location.model';
import { Guid } from 'guid-typescript';

export class PersonEditModel extends GenericPersonModel {
  constructor(){
    super();
    this.birthPlace = new LocationModel();
    this.livingPlace = new LocationModel();
  }
  userId?: Guid;
  gender: CommonObject;
  nationality: CommonObject;
  religion: CommonObject;
  birthPlace: LocationModel;
  livingPlace: LocationModel;
}
