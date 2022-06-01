import { PersonDetailsModel } from '../../person/models/person-details.model';
import { Guid } from 'guid-typescript';
import { GenericPersonModel } from '../../person/models/generic-person.model';

export class RequestCreateUpdateModel {
  id?: number;
  senderUserId: Guid;
  receiverUser: GenericPersonModel;
  receiverReferenceInSenderTreeId: number;
}
