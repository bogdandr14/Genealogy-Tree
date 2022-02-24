import { CommonService } from './../../../shared/services/common.service';
import { Component, Inject, LOCALE_ID, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, Subject, of, Subscription } from 'rxjs';
import { switchMap, takeUntil } from 'rxjs/operators';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { UserService } from 'src/app/modules/user/services/user.service';
import { PersonEditModel } from '../../models/person/person-edit.model';
import { PersonService } from '../../services/person.service';
import { LocationModel } from 'src/app/modules/shared/models/location.model';
import { formatDate } from '@angular/common';

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
  public selectedBirthDate: string | Date;
  public selectedDeathDate: string | Date;

  private person$: Observable<PersonEditModel>;
  public isUpdate: boolean = false;
  private destroy$: Subject<boolean> = new Subject();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private personService: PersonService,
    private commonService: CommonService,
    private userService: UserService,
    @Inject(LOCALE_ID) private locale
  ) { }

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
          return of(personEdit);
        }
      })
    );
    this.person$.subscribe((person) => {
      this.personEdit = person;
      if (!this.personEdit.birthPlace) {
        this.personEdit.birthPlace = new LocationModel();
      }
      if (!this.personEdit.livingPlace) {
        this.personEdit.livingPlace = new LocationModel();
      }
      this.setBirthday(this.personEdit.birthDate);
      if (this.personEdit.deathDate) {
        this.setDeathday(this.personEdit.deathDate);
      }
    });
  }

  private initDropdowns() {
    this.commonService
      .getGenders()
      .pipe(takeUntil(this.destroy$))
      .subscribe((genders) => {
        this.genderOptions = genders;
      });
    this.commonService
      .getNationalities()
      .pipe(takeUntil(this.destroy$))
      .subscribe((nationalities) => {
        this.nationalityOptions = nationalities;
      });
    this.commonService
      .getReligions()
      .pipe(takeUntil(this.destroy$))
      .subscribe((religions) => {
        this.religionOptions = religions;
      });
  }

  setBirthday(date: string | Date) {
    this.personEdit.birthDate = new Date(date);
    this.selectedBirthDate = formatDate(date, 'dd/MM/yyyy', this.locale);
  }

  setDeathday(date: string | Date) {
    this.personEdit.deathDate = new Date(date);
    this.selectedDeathDate = formatDate(date, 'dd/MM/yyyy', this.locale);
  }

  onSubmit() {
    let personUpdated: Subscription;
    if (this.personEdit.imageFile) {
      this.personEdit.imageId = this.personEdit.imageFile.id;
    }

    if (this.isUpdate) {
      personUpdated = this.personService
        .updatePerson(this.personEdit)
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
