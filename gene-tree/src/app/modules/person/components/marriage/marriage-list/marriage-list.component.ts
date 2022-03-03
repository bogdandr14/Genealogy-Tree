import { Component, Input, OnInit } from '@angular/core';
import { MarriedPersonModel } from '../../../models/marriage/married-person.model';
import { GenericPersonModel } from '../../../models/person/generic-person.model';
import { MarriageService } from '../../../services/marriage.service';

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
}
