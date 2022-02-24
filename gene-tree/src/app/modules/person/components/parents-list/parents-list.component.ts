import { Component, Input, OnInit } from '@angular/core';
import { ParentModel } from '../../models/parent.model';

@Component({
  selector: 'app-parents-list',
  templateUrl: './parents-list.component.html',
  styleUrls: ['./parents-list.component.scss'],
})
export class ParentsListComponent implements OnInit {
  @Input() parents: ParentModel[];
  @Input() canModify: boolean = false;
  constructor() {}

  ngOnInit() {}
}
