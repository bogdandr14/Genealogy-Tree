import { MarriageService } from './../../services/marriage.service';
import { MarriedPersonModel } from './../../models/marriage/married-person.model';
import { Component, Input, OnInit } from '@angular/core';
import { GenericPersonModel } from '../../models/person/generic-person.model';

@Component({
  selector: 'app-marriage-list',
  templateUrl: './marriage-list.component.html',
  styleUrls: ['./marriage-list.component.scss'],
})
export class MarriageListComponent implements OnInit {
  @Input() marriages: MarriedPersonModel[];
  @Input() canModify: boolean = false;
  @Input() personLinkedTo: GenericPersonModel;
  constructor(private marriageService: MarriageService) {}

  ngOnInit() {}

  refreshMarriages() {
    this.marriageService
      .getMarriagesForPerson(this.personLinkedTo.personId)
      .subscribe((marriages) => {
        this.marriages = marriages;
      });
  }

  confirmDeleteMarriage() {}
}
