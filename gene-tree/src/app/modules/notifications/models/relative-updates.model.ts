import { UpdateInfoModel } from './update-info.model';
import { GenericPersonModel } from './../../person/models/generic-person.model';

export class RelativeUpdatesModel {
  relative: GenericPersonModel;
  updates: UpdateInfoModel[];
}
