import { GenericPersonModel } from './../../person/models/generic-person.model';
import { RequestResponseModel } from './../../relative/models/request-response.model';
import { RequestDetailsModel } from '../../relative/models/request-details.model';
import { EventInTreeModel } from '../../genealogy/models/event-in-tree.model';
export class NotificationsBundle {
  requestsReceived: RequestDetailsModel[];
  requestsResponded: RequestResponseModel[];
  userUpdates: GenericPersonModel[];
  eventsToday: EventInTreeModel[];
}
