import { DataService } from 'src/app/modules/core/services/data.service';
import { CommonService } from './../../../shared/services/common.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap, Router } from '@angular/router';
import { Subject, of, iif } from 'rxjs';
import { map, switchMap, take, takeUntil, tap } from 'rxjs/operators';
import { CommonObject } from 'src/app/modules/shared/models/common-object';
import { PersonEditModel } from '../../models/person/person-edit.model';
import { PersonService } from '../../services/person.service';
import { LocationModel } from 'src/app/modules/shared/models/location.model';

@Component({
  selector: 'app-person-edit',
  templateUrl: './person-edit.page.html',
  styleUrls: ['./person-edit.page.scss'],
})
export class PersonEditPage implements OnInit {
  public personEdit: PersonEditModel = new PersonEditModel();
  public nationalityOptions: CommonObject[] = [];
  public religionOptions: CommonObject[] = [];

  public isUpdate: boolean = false;
  private destroy$: Subject<boolean> = new Subject();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private personService: PersonService,
    private commonService: CommonService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.initDropdowns();
    this.route.paramMap
      .pipe(
        switchMap((params) => {
          return iif<PersonEditModel, PersonEditModel>(
            () => this.setUpdate(params),
            this.getPersonToEdit(params),
            this.createPerson()
          );
        })
      )
      .pipe(take(1))
      .subscribe((person) => {
        this.personEdit = person;
      });
  }

  private setUpdate(params: ParamMap) {
    this.isUpdate = !!params.get('id');
    return this.isUpdate;
  }

  private getPersonToEdit(params: ParamMap) {
    return this.personService.getPerson(+params.get('id')).pipe(
      map((person) => {
        if (!person.birthPlace) {
          person.birthPlace = new LocationModel();
        }
        if (!person.livingPlace) {
          person.livingPlace = new LocationModel();
        }
        if (person.imageFile) {
          person.imageId = person.imageFile.id;
        }
        return person;
      })
    );
  }

  private createPerson() {
    return this.dataService.getCurrentUser().pipe(
      switchMap((currentUser) => {
        const personEdit = new PersonEditModel();
        personEdit.treeId = currentUser.treeId;
        return of(personEdit);
      })
    );
  }

  private initDropdowns() {
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

  onSubmit() {
    iif(
      () => this.isUpdate,
      this.personService.updatePerson(this.personEdit),
      this.personService.createPerson(this.personEdit)
    )
      .pipe(
        take(1),
        tap((person) =>
          this.router.navigate(['/person/details', person.personId])
        )
      )
      .subscribe();
  }
}
