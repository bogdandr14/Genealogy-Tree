import { UtilsService } from '../../services/utils.service';
import { Component, Input, OnInit } from '@angular/core';
import { GenericPersonModel } from '../../../person/models/generic-person.model';

@Component({
  selector: 'app-person-card',
  templateUrl: './person-card.component.html',
  styleUrls: ['./person-card.component.scss'],
})
export class PersonCardComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() showContent = true;
  constructor(public utilsService: UtilsService) { }

  ngOnInit() { }
}
