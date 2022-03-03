import {
  Component,
  Input,
  OnInit,
  EventEmitter,
  Output,
} from '@angular/core';
import { GenericPersonModel } from '../../../models/person/generic-person.model';

@Component({
  selector: 'app-relative-option-card',
  templateUrl: './relative-option-card.component.html',
  styleUrls: ['./relative-option-card.component.scss'],
})
export class RelativeOptionCardComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() selected: boolean = false;
  @Output() selectionChange = new EventEmitter<GenericPersonModel>();
  constructor() {}

  ngOnInit() {}
  get imageUrl(): string {
    if (this.person && this.person.imageFile) {
      return `data:${this.person.imageFile.mimeType};base64,${this.person.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }
}
