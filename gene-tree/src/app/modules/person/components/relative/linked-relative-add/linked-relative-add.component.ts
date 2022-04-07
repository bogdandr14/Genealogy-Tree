import { MarriageService } from './../../../services/marriage.service';
import { GenericPersonModel } from '../../../models/person/generic-person.model';
import { RelativesService } from '../../../services/relatives.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { RelativeEditModel } from '../../../models/relative/relative-edit.model';
import { ModalController } from '@ionic/angular';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-linked-relative-add',
  templateUrl: './linked-relative-add.component.html',
  styleUrls: ['./linked-relative-add.component.scss'],
})
export class LinkedRelativeAddComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() parentType: string;
  @Input() addParent: boolean = true;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public unrelatedPeopleList: GenericPersonModel[];

  public selectedPerson: GenericPersonModel;
  public isBloodRelative = true;
  constructor(
    private modalCtrl: ModalController,
    private relativesService: RelativesService,
    private marriageService: MarriageService
  ) { }

  ngOnInit() {
    this.marriageService.getMarriagesForPerson(this.person.personId).pipe(first()).subscribe((marriages) => {

      if (this.addParent) {
        this.relativesService
          .getNotBloodRelatedPeople(this.person.personId)
          .subscribe((unrelatedPeople) => {
            this.unrelatedPeopleList = unrelatedPeople.filter(
              (person) => person.gender == this.parentType && (marriages.findIndex((marriage) => (marriage.personMarriedTo.personId === person.personId)) === -1)
            );
          });
      } else {
        this.relativesService
          .getChildrenOptions(this.person.personId)
          .subscribe((unrelatedPeople) => {
            this.unrelatedPeopleList = unrelatedPeople.filter(
              (person) => (marriages.findIndex((marriage) => (marriage.personMarriedTo.personId === person.personId)) === -1))
          });
      }
    });
  }

  selectPerson(person?: GenericPersonModel) {
    this.selectedPerson = person;
  }

  addRelative() {
    const relativeLink = new RelativeEditModel();
    relativeLink.bloodRelatives = this.isBloodRelative;
    if (this.addParent) {
      relativeLink.parentId = this.selectedPerson.personId;
      relativeLink.childId = this.person.personId;
    } else {
      relativeLink.parentId = this.person.personId;
      relativeLink.childId = this.selectedPerson.personId;
    }
    this.relativesService
      .addRelative(relativeLink)
      .pipe(first())
      .subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
