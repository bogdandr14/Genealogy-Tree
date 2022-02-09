import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  TemplateRef,
} from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-delete-confirmation',
  templateUrl: './delete-confirmation.component.html',
  styleUrls: ['./delete-confirmation.component.scss'],
})
export class DeleteConfirmationComponent implements OnInit {
  @Input() template: TemplateRef<any>;
  @Input() typeName: string;
  @Output() deleteConfirmed = new EventEmitter<number>();
  id: number;
  present: boolean = false;

  constructor(public modalCtrl: ModalController) {}
  ngOnInit() {}

  public async presentModal(id: number) {
    this.id = id;
    this.present = true;
  }
  confirm() {
    this.deleteConfirmed.emit(this.id);
    this.dismiss();
  }
  dismiss() {
    this.present = false;
  }
}
