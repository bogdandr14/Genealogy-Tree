import { PersonDetailsModel } from './../../person/models/person/person-details.model';
export class SyncRequestResponseModel {
  id: number;
  senderReferenceInReceiverTree: PersonDetailsModel;
  response: boolean;
  syncBack: boolean;
}
