import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, Subject, of, Subscription } from 'rxjs';
import { switchMap, takeUntil } from 'rxjs/operators';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { GenderService } from 'src/app/modules/shared/services/gender.service';
import { NationalityService } from 'src/app/modules/shared/services/nationality.service';
import { ReligionService } from 'src/app/modules/shared/services/religion.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { PersonEditModel } from '../../models/person/person-edit.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-person-edit',
  templateUrl: './person-edit.page.html',
  styleUrls: ['./person-edit.page.scss'],
})
export class PersonEditPage implements OnInit {
  public personId: number;
  public personEdit: PersonEditModel = new PersonEditModel();
  public genderOptions: CommonObject[] = [];
  public nationalityOptions: CommonObject[] = [];
  public religionOptions: CommonObject[] = [];
  public selectedBirthDate: Date;
  public selectedDeathDate: Date;

  private person$: Observable<PersonEditModel>;
  public isUpdate: boolean = false;
  private destroy$: Subject<boolean> = new Subject();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private personService: PersonService,
    private genderService: GenderService,
    private nationalityService: NationalityService,
    private userService: UserService,
    private religionService: ReligionService
  ) {}

  async ngOnInit() {
    this.initDropdowns();
    this.person$ = this.route.paramMap.pipe(
      switchMap((params) => {
        this.personId = Number(params.get('id'));
        if (this.personId) {
          this.isUpdate = true;
          return this.personService.getPerson(this.personId);
        } else {
          const personEdit = new PersonEditModel();
          personEdit.treeId = this.userService.getCurrentUser().treeId;
          console.log("🚀 ~ file: person-edit.page.ts ~ line 53 ~ PersonEditPage ~ switchMap ~ personEdit.treeId", personEdit.treeId)
          return of(personEdit);
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
  formatDate(date: string): Date {
    return new Date(date);
  }

  onSubmit() {
    let personUpdated: Subscription;
    this.personEdit.birthDate = new Date(this.personEdit.birthDate);
    if(this.personEdit.deathDate){
      this.personEdit.deathDate = new Date(this.personEdit.deathDate);
    }

    if (this.isUpdate) {
      personUpdated = this.personService
        .updatePerson(this.personId, this.personEdit)
        .subscribe((person) => {
          this.router.navigate(['/person/details', person.personId]);
        });
    } else {
      personUpdated = this.personService
        .createPerson(this.personEdit)
        .subscribe((person) => {
          this.router.navigate(['/person/details', person.personId]);
        });
    }
  }
}
