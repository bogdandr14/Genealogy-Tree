import { RelativeModel } from './../../models/relative/relative.model';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-parents-list',
  templateUrl: './parents-list.component.html',
  styleUrls: ['./parents-list.component.scss'],
})
export class ParentsListComponent implements OnInit {
  @Input() parents: RelativeModel[];
  @Input() canModify: boolean = false;
  constructor() {}

  ngOnInit() {}
}
