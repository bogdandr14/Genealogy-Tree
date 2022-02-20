import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  TemplateRef,
} from '@angular/core';
import { ModalController } from '@ionic/angular';
import { Guid } from 'guid-typescript';

@Component({
  selector: 'app-delete-confirmation',
  templateUrl: './delete-confirmation.component.html',
  styleUrls: ['./delete-confirmation.component.scss'],
})
export class DeleteConfirmationComponent implements OnInit {
  @Input() template: TemplateRef<any>;
  @Input() typeName: string;
  @Input() deleteId: number | Guid;
  @Output() deleteConfirmed = new EventEmitter<number | Guid>();

  constructor(public modalCtrl: ModalController) {}
  ngOnInit() {}

  confirm() {
    this.deleteConfirmed.emit(this.deleteId);
    this.dismiss();
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
