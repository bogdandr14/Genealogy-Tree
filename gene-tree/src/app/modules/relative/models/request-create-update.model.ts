import { PersonDetailsModel } from '../../person/models/person-details.model';
import { UserDetailsModel } from '../../user/models/user-details.model';
import { Guid } from 'guid-typescript';

export class RequestCreateUpdateModel {
  id?: number;
  sunderUserId: Guid;
  receiverUser: UserDetailsModel;
  receiverReferenceInSenderTree: PersonDetailsModel;
}
