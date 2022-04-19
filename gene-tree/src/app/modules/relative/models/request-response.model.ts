import { PersonDetailsModel } from '../../person/models/person-details.model';
export class RequestResponseModel {
  id: number;
  senderReferenceInReceiverTree: PersonDetailsModel;
  response: boolean;
  syncBack: boolean;
}
