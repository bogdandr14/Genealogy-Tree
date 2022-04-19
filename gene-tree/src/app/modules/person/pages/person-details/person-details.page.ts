import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { iif, Observable } from 'rxjs';
import { switchMap, take } from 'rxjs/operators';
import { UserService } from 'src/app/modules/user/service/user.service';
import { PersonDetailsModel } from '../../models/person-details.model';
import { PersonService } from '../../service/person.service';
import { DataService } from 'src/app/modules/core/services/data.service';

@Component({
  selector: 'app-person-details',
  templateUrl: './person-details.page.html',
  styleUrls: ['./person-details.page.scss'],
})
export class PersonDetailsPage implements OnInit {
  public personDetails: PersonDetailsModel = new PersonDetailsModel();

  private person$: Observable<PersonDetailsModel>;

  constructor(
    private route: ActivatedRoute,
    public router: Router,
    private userService: UserService,
    private dataService: DataService,
    private personService: PersonService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .pipe(
        switchMap((params) => {
          return iif<PersonDetailsModel, PersonDetailsModel>(
            () => !!params.get('id'),
            this.personService.getPerson(+params.get('id')),
            this.dataService
              .getCurrentUser()
              .pipe(
                switchMap((currentUser) =>
                  this.personService.getPerson(currentUser.personId)
                )
              )
          );
        })
      )
      .pipe(take(1))
      .subscribe((personDetails) => {
        this.personDetails = personDetails;
      });
  }

  public get isUserTree() {
    return this.userService.isUserTree(this.personDetails.treeId);
  }

  refreshPerson() {
    this.person$.subscribe((person) => {
      this.personDetails = person;
    });
  }
}
