import { GenericPersonModel } from "../../person/models/generic-person.model";

export class RequestResponseModel {
  id: number;
  receiverUser: GenericPersonModel
  senderReferenceInReceiverTreeId: number;
  response: boolean;
}
