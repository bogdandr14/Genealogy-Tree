import { UtilsService } from './../../../shared/services/utils.service';
import { Component, Input, OnInit } from '@angular/core';
import { GenericPersonModel } from '../../../person/models/generic-person.model';

@Component({
  selector: 'app-user-card',
  templateUrl: './user-card.component.html',
  styleUrls: ['./user-card.component.scss'],
})
export class UserCardComponent implements OnInit {
  @Input() user: GenericPersonModel;
  constructor(public utilsService: UtilsService) { }

  ngOnInit() { }
}
