import { RelativesService } from './../../services/relatives.service';
import { Component, Input, OnInit } from '@angular/core';
import { RelativeModel } from '../../models/relative/relative.model';
import { GenericPersonModel } from '../../models/person/generic-person.model';

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
  constructor(private relativesService: RelativesService) { }

  ngOnInit() { }

  refreshRelatives() {
    if (this.isParentList) {
      this.relativesService.getParents(this.personLinkedTo.personId)
        .subscribe((parents) => {
          this.relatives = parents;
        });
    } else {
      this.relativesService.getChildren(this.personLinkedTo.personId)
        .subscribe((children) => {
          this.relatives = children;
        });
    }
  }
}
