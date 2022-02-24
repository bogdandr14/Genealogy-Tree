import { MarriedPersonModel } from './../../models/marriage/married-person.model';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-marriage-list',
  templateUrl: './marriage-list.component.html',
  styleUrls: ['./marriage-list.component.scss'],
})
export class MarriageListComponent implements OnInit {
  @Input() marriages : MarriedPersonModel[];
  constructor() { }

  ngOnInit() {}

}
