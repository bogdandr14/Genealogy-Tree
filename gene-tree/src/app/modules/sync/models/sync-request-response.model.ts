import { PersonDetailsModel } from './../../person/models/person-details.model';
export class SyncRequestResponseModel {
  id: number;
  senderReferenceInReceiverTree: PersonDetailsModel;
  response: boolean;
  syncBack: boolean;
}
