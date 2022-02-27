import { RelativeModel } from './../../models/relative/relative.model';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-children-list',
  templateUrl: './children-list.component.html',
  styleUrls: ['./children-list.component.scss'],
})
export class ChildrenListComponent implements OnInit {
  @Input() children: RelativeModel[];
  @Input() canModify: boolean = false;
  constructor() {}

  ngOnInit() {}
}
