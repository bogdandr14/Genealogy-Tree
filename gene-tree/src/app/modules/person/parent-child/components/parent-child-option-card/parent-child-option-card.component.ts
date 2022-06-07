import { UtilsService } from './../../../../shared/services/utils.service';
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
  constructor(public utilsService: UtilsService) { }

  ngOnInit() { }

  changeSelection(){
    if(this.selected){
      this.selectionChange.emit(null);
    }
    else{
      this.selectionChange.emit(this.person);
    }
  }
}
