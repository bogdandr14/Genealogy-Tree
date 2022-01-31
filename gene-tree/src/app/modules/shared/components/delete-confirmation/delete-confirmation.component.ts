import { Component, Input, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-delete-confirmation',
  templateUrl: './delete-confirmation.component.html',
  styleUrls: ['./delete-confirmation.component.scss'],
})
export class DeleteConfirmationComponent implements OnInit {
  @Input() title: string;
  @Input() description: string;
  @Input() id: number;
  constructor(public modalController: ModalController) {}
  ngOnInit() {}
}
