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
    private parentChildService: ParentChildService,
  ) { }

  ngOnInit() {
    iif(() => this.addParent,
      this.parentChildService.getParentSpouceOptions(this.person.personId).pipe(
        map((unrelatedPeople) => {
          return unrelatedPeople.filter((person) => person.gender == this.parentType)
        })),
      this.parentChildService.getChildrenOptions(this.person.personId)
    ).pipe(take(1)).subscribe((unrelatedPeople) => {
      this.unrelatedPeopleList = unrelatedPeople;
    })
  }

  selectPerson(person?: GenericPersonModel) {
    this.selectedPerson = person;
  }

  addParentChild() {
    iif(() => this.addParent,
      this.parentChildService.addParentChild(this.createParentChild(this.selectedPerson.personId, this.person.personId)),
      this.parentChildService.addParentChild(this.createParentChild(this.person.personId, this.selectedPerson.personId)),
    ).pipe(take(1))
      .subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
  }

  private createParentChild(parentId: number, childId: number) {
    const parentChild = new ParentChildEditModel();
    parentChild.bloodRelatives = this.isBloodRelative;
    parentChild.parentId = parentId;
    parentChild.childId = childId;
    return parentChild;
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
