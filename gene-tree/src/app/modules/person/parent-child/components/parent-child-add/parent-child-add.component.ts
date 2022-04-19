import { GenericPersonModel } from '../../../models/generic-person.model';
import { ParentChildService } from '../../service/parent-child.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ParentChildEditModel } from '../../models/parent-child-edit.model';
import { ModalController } from '@ionic/angular';
import { map, take } from 'rxjs/operators';
import { iif } from 'rxjs';

@Component({
  selector: 'app-parent-child-add',
  templateUrl: './parent-child-add.component.html',
  styleUrls: ['./parent-child-add.component.scss'],
})
export class ParentChildAddComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() parentType: string;
  @Input() addParent: boolean = true;
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public unrelatedPeopleList: GenericPersonModel[];

  public selectedPerson: GenericPersonModel;
  public isBloodRelative = true;

  constructor(
    private modalCtrl: ModalController,
    private relativesService: ParentChildService,
  ) { }

  ngOnInit() {
    iif(() => this.addParent,
      this.relativesService.getParentSpouceOptions(this.person.personId).pipe(
        map((unrelatedPeople) => {
          return unrelatedPeople.filter((person) => person.gender == this.parentType)
        })),
      this.relativesService.getChildrenOptions(this.person.personId)
    ).pipe(take(1)).subscribe((unrelatedPeople) => {
      this.unrelatedPeopleList = unrelatedPeople;
    })
  }

  selectPerson(person?: GenericPersonModel) {
    this.selectedPerson = person;
  }

  addRelative() {
    const relativeLink = new ParentChildEditModel();
    relativeLink.bloodRelatives = this.isBloodRelative;
    if (this.addParent) {
      relativeLink.parentId = this.selectedPerson.personId;
      relativeLink.childId = this.person.personId;
    } else {
      relativeLink.parentId = this.person.personId;
      relativeLink.childId = this.selectedPerson.personId;
    }
    this.relativesService
      .addParentChild(relativeLink)
      .pipe(take(1))
      .subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
