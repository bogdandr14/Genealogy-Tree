import { Component, Input, OnInit } from '@angular/core';
import { GenericPersonModel } from '../../../person/models/generic-person.model';

@Component({
  selector: 'app-user-card',
  templateUrl: './user-card.component.html',
  styleUrls: ['./user-card.component.scss'],
})
export class UserCardComponent implements OnInit {
  @Input() user: GenericPersonModel;
  constructor() {}

  ngOnInit() {}
  get imageUrl(): string {
    if (this.user && this.user.imageFile) {
      return `data:${this.user.imageFile.mimeType};base64,${this.user.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }
}
