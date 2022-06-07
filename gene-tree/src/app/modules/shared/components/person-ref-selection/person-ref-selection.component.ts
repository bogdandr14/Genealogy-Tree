import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { GenericPersonModel } from '../../../person/models/generic-person.model';
import { UtilsService } from '../../services/utils.service';

@Component({
  selector: 'app-person-ref-selection',
  templateUrl: './person-ref-selection.component.html',
  styleUrls: ['./person-ref-selection.component.scss'],
})
export class PersonRefSelectionComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() selected: boolean;
  @Output() selectPerson = new EventEmitter<GenericPersonModel>();

  constructor(public utilsService: UtilsService) { }

  ngOnInit() { }
}
