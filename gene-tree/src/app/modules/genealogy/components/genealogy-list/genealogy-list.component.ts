import { Component, OnInit } from '@angular/core';
import { switchMap, take } from 'rxjs/operators';
import { CurrentUserModel } from 'src/app/modules/core/models/current-user.model';
import { DataService } from 'src/app/modules/core/services/data.service';
import { GenericPersonModel } from 'src/app/modules/person/models/person/generic-person.model';
import { PersonService } from 'src/app/modules/person/services/person.service';
import { UserService } from 'src/app/modules/user/services/user.service';

@Component({
  selector: 'app-genealogy-list',
  templateUrl: './genealogy-list.component.html',
  styleUrls: ['./genealogy-list.component.scss'],
})
export class GenealogyListComponent implements OnInit {
  public peopleList: GenericPersonModel[] = [];
  public searchPerson: string;
  private currentUser: CurrentUserModel;
  constructor(
    private personService: PersonService,
    private userService: UserService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.dataService.getCurrentUser().pipe(take(1),
      switchMap((currentUser) => {
        this.currentUser = currentUser;
        return this.personService
          .getPeopleListInTree(this.currentUser.treeId).pipe(take(1))
      })).subscribe((people) => {
        this.peopleList = people;
      });
  }

  // TODO check who is the root of the tree
  get isUserTree() {
    return this.userService.isUserTree(this.currentUser?.treeId);;
  }
}
