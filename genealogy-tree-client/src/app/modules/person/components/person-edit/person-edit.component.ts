/* eslint-disable no-debugger */
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, of, Subject, Subscription } from 'rxjs';
import { switchMap, take, takeUntil, tap } from 'rxjs/operators';
import { HttpInterceptorConfig } from 'src/app/modules/core/models/http-interceptor-config.model';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { GenderService } from 'src/app/modules/shared/services/gender.service';
import { NationalityService } from 'src/app/modules/shared/services/nationality.service';
import { ReligionService } from 'src/app/modules/shared/services/religion.service';
import { PersonDetailsModel } from '../../models/person-details.model';
import { PersonEditModel } from '../../models/person-edit.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-person-edit',
  templateUrl: './person-edit.component.html',
  styleUrls: ['./person-edit.component.scss'],
})
export class PersonEditComponent implements OnInit {
  public personId: number;
  public personEdit: PersonEditModel = new PersonEditModel();
  public genderOptions: CommonObject[] = [];
  public nationalityOptions: CommonObject[] = [];
  public religionOptions: CommonObject[] = [];

  private person$: Observable<PersonEditModel>;
  private isUpdate: boolean = false;
  private destroy$: Subject<boolean> = new Subject();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private personService: PersonService,
    private genderService: GenderService,
    private nationalityService: NationalityService,
    private religionService: ReligionService
  ) {}

  ngOnInit() {
    this.initDropdowns();
    this.person$ = this.route.paramMap.pipe(
      switchMap((params) => {
        this.personId = Number(params.get('id'));
        if (this.personId) {
          this.isUpdate = true;
          return this.personService.getPerson(this.personId);
        } else {
          return of(new PersonEditModel());
        }
      })
    );
    this.person$.subscribe((person) => {
      this.personEdit = person;
    });
  }

  private initDropdowns() {
    this.genderService
      .getMany<CommonObject>(null)
      .pipe(takeUntil(this.destroy$))
      .subscribe((genders) => {
        this.genderOptions = genders;
      });
    this.nationalityService
      .getMany<CommonObject>(null)
      .pipe(takeUntil(this.destroy$))
      .subscribe((nationalities) => {
        this.nationalityOptions = nationalities;
      });
    this.religionService
      .getMany<CommonObject>(null)
      .pipe(takeUntil(this.destroy$))
      .subscribe((religions) => {
        this.religionOptions = religions;
      });
  }

  onSubmit() {
    let personUpdated: Subscription;
    personUpdated;
    if (this.isUpdate) {
      personUpdated = this.personService
        .updatePerson(this.personId, this.personEdit)
        .subscribe((person) => {
          this.router.navigate(['person', 'details', person.id]);
        });
    } else {
      personUpdated = this.personService
        .createPerson(this.personEdit)
        .subscribe((person) => {
          this.router.navigate(['person', 'details', person.id]);
        });
    }
  }
}
