import { Component, Input, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';
import { GenericPersonModel } from '../../../models/person/generic-person.model';
import { RelativeModel } from '../../../models/relative/relative.model';
import { RelativesService } from '../../../services/relatives.service';

@Component({
  selector: 'app-linked-relatives-list',
  templateUrl: './linked-relatives-list.component.html',
  styleUrls: ['./linked-relatives-list.component.scss'],
})
export class LinkedRelativesListComponent implements OnInit {
  @Input() relatives: RelativeModel[];
  @Input() canModify: boolean = false;
  @Input() personLinkedTo: GenericPersonModel;
  @Input() isParentList: boolean = false;
  constructor(private relativesService: RelativesService) {}

  get noFather() {
    const fatherArray = this.relatives.filter(
      (relative) => relative.gender === 'm'
    );
    return fatherArray.length === 0;
  }

  get noMother() {
    const motherArray = this.relatives.filter(
      (relative) => relative.gender === 'f'
    );
    return motherArray.length === 0;
  }

  ngOnInit() {}

  refreshRelatives() {
    if (this.isParentList) {
      this.relativesService
        .getParents(this.personLinkedTo.personId)
        .pipe(first())
        .subscribe((parents) => {
          this.relatives = parents;
        });
    } else {
      this.relativesService
        .getChildren(this.personLinkedTo.personId)
        .pipe(first())
        .subscribe((children) => {
          this.relatives = children;
        });
    }
  }
}
