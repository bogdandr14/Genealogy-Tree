import { Component, Input, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';
import { GenericPersonModel } from '../../../models/generic-person.model';
import { ParentChildBaseModel } from '../../models/parent-child-base.model';
import { ParentChildService } from '../../service/parent-child.service';

@Component({
  selector: 'app-parent-child-list',
  templateUrl: './parent-child-list.component.html',
  styleUrls: ['./parent-child-list.component.scss'],
})
export class ParentChildListComponent implements OnInit {
  @Input() parentsChildren: ParentChildBaseModel[];
  @Input() canModify: boolean = false;
  @Input() personLinkedTo: GenericPersonModel;
  @Input() isParentList: boolean = false;
  constructor(private parentChildService: ParentChildService) {}

  get noFather() {
    const fatherArray = this.parentsChildren.filter(
      (relative) => relative.gender === 'm'
    );
    return fatherArray.length === 0;
  }

  get noMother() {
    const motherArray = this.parentsChildren.filter(
      (relative) => relative.gender === 'f'
    );
    return motherArray.length === 0;
  }

  ngOnInit() {}

  refreshParentChild() {
    if (this.isParentList) {
      this.parentChildService
        .getParents(this.personLinkedTo.personId)
        .pipe(first())
        .subscribe((parents) => {
          this.parentsChildren = parents;
        });
    } else {
      this.parentChildService
        .getChildren(this.personLinkedTo.personId)
        .pipe(first())
        .subscribe((children) => {
          this.parentsChildren = children;
        });
    }
  }
}
