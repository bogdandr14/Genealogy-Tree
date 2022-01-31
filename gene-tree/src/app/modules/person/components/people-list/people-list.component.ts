import { Component, OnInit } from '@angular/core';
import { AccountProfileModel } from 'src/app/modules/account/models/profile.model';
import { UserService } from 'src/app/modules/user/services/user.service';

import { PersonBaseModel } from '../../models/person-base.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.scss'],
})
export class PeopleListComponent implements OnInit {
  public peopleList: PersonBaseModel[] = [];
  public currentUser: AccountProfileModel;
  constructor(
    private personService: PersonService,
    private userService: UserService
  ) {}

  ngOnInit() {
    const user = JSON.parse(sessionStorage.getItem('user'));
    if (user.treeId) {
      this.personService.getAllPeopleInTree(user.treeId).subscribe((people) => {
        this.peopleList = people;
      });
      this.userService.getPersonalInfo<AccountProfileModel>().subscribe((user)=>{
        this.currentUser = user;
      })
    }
    // this.userService.user$.subscribe((user) => {
    //   debugger;
    //   this.personService.getAllPeopleInTree(user.treeId).subscribe((people) => {
    //     debugger;
    //     this.peopleList = people;
    //   });
    // });
  }

  deletePerson(personId: number) {
    this.personService
      .delete(personId)
      .subscribe(() => window.location.reload());
  }

  //TODO add possibility to view linked user
  public isUser() {
    // return userId && userId != '00000000-0000-0000-0000-000000000000';
    return false;
  }
}
