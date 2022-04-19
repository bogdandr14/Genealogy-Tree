import { Guid } from 'guid-typescript';

export class RelativeModel {
  primaryUserId: Guid;
  synchedUserId: Guid;
  synchedPersonInPrimaryTreeId: number;
  primaryPersonInSynchedTreeId: number;
}
