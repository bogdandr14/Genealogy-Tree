import { Component, Input, OnInit, EventEmitter, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { GenericPersonModel } from '../../models/person/generic-person.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-person-delete',
  templateUrl: './person-delete.component.html',
  styleUrls: ['./person-delete.component.scss'],
})
export class PersonDeleteComponent implements OnInit {
  @Input() person: GenericPersonModel;
  @Output() personDeleted = new EventEmitter<void>();
  constructor(
    private modalCtrl: ModalController,
    private personService: PersonService
  ) {}

  ngOnInit() {}

  get imageUrl(): string {
    if (this.person && this.person.imageFile) {
      return `data:${this.person.imageFile.mimeType};base64,${this.person.imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  confirm() {
    this.personService.remove(this.person.personId).subscribe(() => {
      this.personDeleted.emit();
      this.dismiss();
    });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
