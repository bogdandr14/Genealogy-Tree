import { PersonDetailsModel } from './../../person/models/person/person-details.model';
import { UserDetailsModel } from './../../user/models/user-details.model';
import { Guid } from 'guid-typescript';

export class SyncRequestCreateUpdateModel {
  id?: number;
  sunderUserId: Guid;
  receiverUser: UserDetailsModel;
  receiverReferenceInSenderTree: PersonDetailsModel;
}
