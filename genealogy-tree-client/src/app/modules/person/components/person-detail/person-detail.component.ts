import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable, of } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { UserService } from 'src/app/modules/core/services/user.service';
import { PersonDetailsModel } from '../../models/person-details.model';
import { PersonEditModel } from '../../models/person-edit.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-person-detail',
  templateUrl: './person-detail.component.html',
  styleUrls: ['./person-detail.component.scss'],
})
export class PersonDetailComponent implements OnInit {
  public personId: number;
  public personDetails: PersonDetailsModel = new PersonDetailsModel();

  private person$: Observable<PersonDetailsModel>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private userService: UserService,
    private personService: PersonService
  ) {}

  ngOnInit() {
    this.person$ = this.route.paramMap.pipe(
      switchMap((params) => {
        this.personId = Number(params.get('id'));
        if (this.personId) {
          return this.personService.getPerson(this.personId);
        } else {
          return this.personService.getPerson(
            JSON.parse(sessionStorage.getItem('user')).personId
          );
        }
      })
    );
    this.person$.subscribe((person) => {
      this.personDetails = person;
    });
  }

  deletePerson() {
    this.personService
      .delete(this.personDetails.personId)
      .subscribe(() => this.router.navigate(['person', 'list']));
  }

  public get canDelete() {
    return !this.userService.isCurrentUser(this.personDetails.userId);
  }

  public get isUser() {
    return (
      this.personDetails.userId &&
      this.personDetails.userId != '00000000-0000-0000-0000-000000000000'
    );
  }
}
