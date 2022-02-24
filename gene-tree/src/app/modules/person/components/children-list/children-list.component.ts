import { Component, Input, OnInit } from '@angular/core';
import { ChildModel } from '../../models/child.model';

@Component({
  selector: 'app-children-list',
  templateUrl: './children-list.component.html',
  styleUrls: ['./children-list.component.scss'],
})
export class ChildrenListComponent implements OnInit {
  @Input() children: ChildModel[];
  constructor() { }

  ngOnInit() {}

}
