import { LocationModel } from './../../../shared/models/location.model';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-location-edit',
  templateUrl: './location-edit.component.html',
  styleUrls: ['./location-edit.component.scss'],
})
export class LocationEditComponent implements OnInit {
  @Input() livesIn = new LocationModel();
  @Input() bornIn = new LocationModel();
  @Output() saveConfirmed = new EventEmitter();
  public present: boolean = false;
  constructor(
    public modalCtrl: ModalController,
    private personsService: PersonService
  ) {}

  ngOnInit() {}
  onSubmit() {
    this.personsService
      .updateLocation(this.livesIn)
      .subscribe(() =>
        this.personsService
          .updateLocation(this.bornIn)
          .subscribe(() => this.saveConfirmed.emit())
      );
    this.dismiss();
  }

  public async presentModal() {
    this.present = true;
  }

  dismiss() {
    this.present = false;
  }
}
