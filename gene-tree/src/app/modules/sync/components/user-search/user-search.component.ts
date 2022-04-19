import { FoundUsersModel } from './../../../user/models/found-users.model';
import { InfiniteScrollFilter } from './../../../shared/models/infinite-scroll.filter';
import { Component, OnInit, ViewChild } from '@angular/core';
import { UserService } from 'src/app/modules/user/service/user.service';
import { first, take, tap } from 'rxjs/operators';
import { GenericPersonModel } from 'src/app/modules/person/models/generic-person.model';
import { IonInfiniteScroll } from '@ionic/angular';

@Component({
  selector: 'app-user-search',
  templateUrl: './user-search.component.html',
  styleUrls: ['./user-search.component.scss'],
})
export class UserSearchComponent implements OnInit {
  @ViewChild('infiniteScroll') infiniteScroll: IonInfiniteScroll;

  public usersFound = new FoundUsersModel();
  public users: GenericPersonModel[];
  private filter: InfiniteScrollFilter;
  constructor(private userService: UserService) { }

  ngOnInit() {
  }

  findUsers($event) {
    this.filter = { skip: 0, take: 15, name: $event.detail.value };
    this.userService.findUsers(this.filter).pipe(first()).subscribe((foundUsers) => {
      this.usersFound = foundUsers;
      this.users = foundUsers.users;
    })
  }

  setUserSubscription(searchTerm: string) {
    this.filter = { skip: 0, take: 15, name: searchTerm };
    this.userService.findUsers(this.filter).pipe(take(1), tap((foundUsers) => this.usersFound = foundUsers));
  }

  loadMoreUsers() {
    this.filter.skip = this.usersFound.skippedUsers;
    this.userService.findUsers(this.filter).pipe(first()).subscribe((foundUsers) => {
      this.usersFound = foundUsers;
      this.users = this.users.concat(foundUsers.users);
      this.infiniteScroll.complete();
      this.infiniteScroll.disabled = foundUsers.areLast;
    })
  }
}
