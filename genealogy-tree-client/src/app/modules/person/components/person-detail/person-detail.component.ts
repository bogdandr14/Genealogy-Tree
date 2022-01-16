import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, of } from 'rxjs';
import { switchMap } from 'rxjs/operators';
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
}
