import { DataService } from 'src/app/modules/core/services/data.service';
import { AccountProfileModel } from './../../../user/models/profile.model';
import { Component, OnInit } from '@angular/core';
import { switchMap, take, tap } from 'rxjs/operators';
import { GenericPersonModel } from '../../../person/models/generic-person.model';
import { PersonService } from '../../../person/service/person.service';
import { UserService } from '../../../user/service/user.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Guid } from 'guid-typescript';
import { iif } from 'rxjs';
import { CurrentUserModel } from 'src/app/modules/core/models/current-user.model';

@Component({
  selector: 'app-genealogy-list',
  templateUrl: './genealogy-list.component.html',
  styleUrls: ['./genealogy-list.component.scss'],
})
export class GenealogyListComponent implements OnInit {
  public peopleList: GenericPersonModel[] = [];
  public searchPerson: string;
  private userForList: AccountProfileModel;
  private currentUser: CurrentUserModel;
  constructor(
    private route: ActivatedRoute,
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

      // this.route.paramMap
      // .pipe(
      //   switchMap((params) => {
      //     debugger;
      //     return iif<AccountProfileModel, AccountProfileModel>(
      //       () => this.isId(params),
      //       this.getUserInfo(params),
      //       this.userService.getPersonalInfo()
      //     )
      //   }),

      // ).pipe(take(1),
      //   tap(user => this.userForList = user),
      //   switchMap(user => this.personService.getPeopleListInTree(user.treeId)),
      // ).subscribe(people => this.peopleList = people);
  }

  getGuid(id) {
    return id ? Guid.parse(id) : Guid.createEmpty();
  }

  getUserInfo(params: ParamMap) {
    const userId = this.getGuid(params.get('id'));
    return this.userService.getUser(userId);
  }
  // TODO check who is the root of the tree
  get isUserTree() {
    return this.userService.isUserTree(this.userForList?.treeId);;
  }
}
