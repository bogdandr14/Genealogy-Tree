/* eslint-disable no-debugger */
import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/modules/core/services/user.service';
import { PersonBaseModel } from '../../models/person-base.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.scss'],
})
export class PeopleListComponent implements OnInit {
  public peopleList: PersonBaseModel[] = [];
  constructor(
    private personService: PersonService,
    private userService: UserService
  ) {}

  ngOnInit() {
    const treeId = JSON.parse(sessionStorage.getItem('user')).treeId;
    if (treeId) {
      this.personService.getAllPeopleInTree(treeId).subscribe((people) => {
        this.peopleList = people;
      });
    }
    // this.userService.user$.subscribe((user) => {
    //   debugger;
    //   this.personService.getAllPeopleInTree(user.treeId).subscribe((people) => {
    //     debugger;
    //     this.peopleList = people;
    //   });
    // });
  }

  //TODO add possibility to view linked user
  public isUser() {
    // return userId && userId != '00000000-0000-0000-0000-000000000000';
    return false;
  }
}
