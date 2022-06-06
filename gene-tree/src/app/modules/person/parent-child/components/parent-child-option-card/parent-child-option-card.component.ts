import {
  Component,
  Input,
  OnInit,
  EventEmitter,
  Output,
} from '@angular/core';
import { GenericPersonModel } from '../../../models/generic-person.model';

@Component({
  selector: 'app-parent-child-option-card',
  templateUrl: './parent-child-option-card.component.html',
  styleUrls: ['./parent-child-option-card.component.scss'],
})
export class ParentChildOptionCardComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Input() selected: boolean = false;
  @Output() selectionChange = new EventEmitter<GenericPersonModel>();
  constructor() { }

  ngOnInit() { }
  get imageUrl(): string {
    if (this.person && this.person.imageFile) {
      return `data:${this.person.imageFile.mimeType};base64,${this.person.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  get cardColor() {
    if (this.person.deathDate != null) {
      return 'dead';
    } else if (this.person.gender === 'm') {
      return 'male';
    } else {
      return 'female';
    }
  }

  changeSelection(){
    if(this.selected){
      this.selectionChange.emit(null);
    }
    else{
      this.selectionChange.emit(this.person);
    }
  }
}
