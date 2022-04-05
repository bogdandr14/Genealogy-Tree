import { MarriageService } from '../../../services/marriage.service';
import { MarriageEditModel } from '../../../models/marriage/marriage-edit.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { GenericPersonModel } from '../../../models/person/generic-person.model';
import { RelativesService } from '../../../services/relatives.service';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-marriage-add',
  templateUrl: './marriage-add.component.html',
  styleUrls: ['./marriage-add.component.scss'],
})
export class MarriageAddComponent implements OnInit {
  @Input() set person(person: GenericPersonModel) {
    this.marriage.firstPersonId = person.personId;
    this.personGender = person.gender;
  }
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public personGender: string;
  public unrelatedPeopleList: GenericPersonModel[];

  public marriage = new MarriageEditModel();
  constructor(
    private modalCtrl: ModalController,
    private relativesService: RelativesService,
    private marriageService: MarriageService
  ) { }

  ngOnInit() {
    this.relativesService
      .getUnrelatedPeople(this.marriage.firstPersonId)
      .subscribe(
        (unrelatedPeople) => (
          this.unrelatedPeopleList = unrelatedPeople.filter((unrelatedPerson) =>
            unrelatedPerson.gender != this.personGender
          )
        )
      );
  }

  selectPerson(person?: GenericPersonModel) {
    this.marriage.secondPersonId = person.personId;
  }

  addMarriage() {
    this.marriageService.addMarriage(this.marriage)
    .pipe(first()).subscribe(() => {
      this.saveConfirmed.emit(true);
      this.dismiss();
    });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
