import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { OccupationModel } from '../../models/occupation.model';

@Component({
  selector: 'app-occupation-list',
  templateUrl: './occupation-list.component.html',
  styleUrls: ['./occupation-list.component.scss'],
})
export class OccupationListComponent implements OnInit {
  @Input() occupations: OccupationModel[];
  @Output() refreshRequested = new EventEmitter();
  constructor() {}

  ngOnInit() {}
  refreshOccupation() {
    this.refreshRequested.emit();
  }
}
