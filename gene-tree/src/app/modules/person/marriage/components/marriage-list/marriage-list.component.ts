import { Component, Input, OnInit } from '@angular/core';
import { take } from 'rxjs/operators';
import { MarriedPersonModel } from '../../models/married-person.model';
import { GenericPersonModel } from '../../../models/generic-person.model';
import { MarriageService } from '../../service/marriage.service';

@Component({
  selector: 'app-marriage-list',
  templateUrl: './marriage-list.component.html',
  styleUrls: ['./marriage-list.component.scss'],
})
export class MarriageListComponent implements OnInit {
  @Input() marriages: MarriedPersonModel[];
  @Input() canModify: boolean = false;
  @Input() personLinkedTo: GenericPersonModel;
  constructor(private marriageService: MarriageService) { }

  ngOnInit() { }

  refreshMarriages() {
    this.marriageService
      .getMarriagesForPerson(this.personLinkedTo.personId)
      .pipe(take(1))
      .subscribe((marriages) => this.marriages = marriages);
  }
}
