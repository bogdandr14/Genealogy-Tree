import { GenericPersonModel } from '../../person/models/generic-person.model';
export class RequestDetailsModel{
  id?: number;
  senderUser: GenericPersonModel;
  receiverUser: GenericPersonModel;
  receiverReferenceInSenderTreeId: number;
}
