import { UserService } from 'src/app/modules/user/services/user.service';
import { CurrentUserModel } from './../../../core/models/current-user.model';
import { PersonService } from './../../services/person.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { GenericPersonModel } from '../../models/person/generic-person.model';
import { DataService } from 'src/app/modules/core/services/data.service';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-relatives-list',
  templateUrl: './relatives-list.page.html',
  styleUrls: ['./relatives-list.page.scss'],
})
export class RelativesListPage implements OnInit {
  public relativesList: GenericPersonModel[] = [];
  private currentUser: CurrentUserModel;
  constructor(
    private personService: PersonService,
    private userService: UserService,
    private dataService: DataService
  ) {}

  async ngOnInit() {
    this.dataService.getCurrentUser().pipe(first()).subscribe((currentUser) => {
      this.currentUser = currentUser;
      this.personService
        .getAllPeopleInTree(this.currentUser.treeId).pipe(first())
        .subscribe((relatives) => {
          this.relativesList = relatives;
        });
    });
  }

  // TODO check who is the root of the tree
  get isUserTree() {
    return (
      this.userService.getLoggedInUser().treeId === this.currentUser?.treeId
    );
  }
}
