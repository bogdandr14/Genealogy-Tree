import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/modules/core/services/user.service';
import { UserProfileModel } from 'src/app/modules/user/models/user-profile.model';
import { PersonBaseModel } from '../../models/person-base.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.scss'],
})
export class PeopleListComponent implements OnInit {
  public peopleList: PersonBaseModel[] = [];
  public currentUser: UserProfileModel;
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
      this.userService.getPersonalInfo<UserProfileModel>(user.username).subscribe((user)=>{
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
