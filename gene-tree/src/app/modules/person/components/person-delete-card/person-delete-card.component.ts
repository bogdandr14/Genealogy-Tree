import { PersonBaseModel } from './../../models/person/person-base.model';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-person-delete-card',
  templateUrl: './person-delete-card.component.html',
  styleUrls: ['./person-delete-card.component.scss'],
})
export class PersonDeleteCardComponent implements OnInit {
  @Input() person: PersonBaseModel;
  constructor() {}

  ngOnInit() {}

  get imageUrl(): string {
    if (this.person && this.person.imageFile) {
      return `data:${this.person.imageFile.mimeType};base64,${this.person.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

}
