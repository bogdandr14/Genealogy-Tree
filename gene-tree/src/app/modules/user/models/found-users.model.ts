import { GenericPersonModel } from "../../person/models/person/generic-person.model";

export class FoundUsersModel {
  constructor() {
    this.users = [];
    this.skippedUsers = 0;
    this.takenUsers = 0;
    this.totalUsers = 0;
    this.areLast = true;
  }
  users: GenericPersonModel[];
  skippedUsers: number;
  takenUsers: number;
  totalUsers: number;
  areLast: boolean;
}
