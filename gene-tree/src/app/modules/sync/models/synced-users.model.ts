import { Guid } from 'guid-typescript';

export class UsersToSyncModel {
  primaryUserId: Guid;
  synchedUserId: Guid;
  synchedPersonInPrimaryTreeId: number;
  primaryPersonInSynchedTreeId: number;
}
