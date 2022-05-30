import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { GenericPersonModel } from '../../models/generic-person.model';

@Component({
  selector: 'app-person-ref-selection',
  templateUrl: './person-ref-selection.component.html',
  styleUrls: ['./person-ref-selection.component.scss'],
})
export class PersonRefSelectionComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() selected: boolean;
  @Output() selectPerson = new EventEmitter<GenericPersonModel>();

  constructor() { }

  ngOnInit() { }

  get cardColor() {
    if (this.person.deathDate != null) {
      return 'dead';
    } else if (this.person.gender === 'm') {
      return 'male';
    } else {
      return 'female';
    }
  }

  get imageUrl(): string {
    if (this.person && this.person.imageFile) {
      return `data:${this.person.imageFile.mimeType};base64,${this.person.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }
}
