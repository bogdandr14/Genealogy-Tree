import { GenericPersonModel } from './../../models/person/generic-person.model';
import { RelativesService } from './../../services/relatives.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { RelativeEditModel } from '../../models/relative/relative-edit.model';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-linked-relative-add',
  templateUrl: './linked-relative-add.component.html',
  styleUrls: ['./linked-relative-add.component.scss'],
})
export class LinkedRelativeAddComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() isParent: boolean = true;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public unrelatedPeopleList: GenericPersonModel[];

  public selectedPerson: GenericPersonModel;
  public isBloodRelative
  constructor(private modalCtrl: ModalController,
    private relativesService: RelativesService) { }

  ngOnInit() {
    this.relativesService.getUnrelatedPeople(this.person.personId).subscribe((unrelatedPeople) => this.unrelatedPeopleList = unrelatedPeople);
  }

  selectPerson(person?: GenericPersonModel) {
    this.selectedPerson = person;
  }

  onSubmit() {
    const relativeLink = new RelativeEditModel();
    relativeLink.bloodRelatives = this.isBloodRelative;
    if (this.isParent) {
      relativeLink.parentId = this.person.personId;
      relativeLink.childId = this.selectedPerson.personId;
    } else {
      relativeLink.parentId = this.selectedPerson.personId;
      relativeLink.childId = this.person.personId;
    }
    this.relativesService.addRelative(relativeLink).subscribe(() => {
      this.saveConfirmed.emit(true);
      this.dismiss();

    })
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
