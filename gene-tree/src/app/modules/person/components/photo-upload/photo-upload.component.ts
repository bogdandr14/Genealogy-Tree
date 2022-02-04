/* eslint-disable no-debugger */
import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
} from '@angular/core';
import { ModalController } from '@ionic/angular';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-photo-upload',
  templateUrl: './photo-upload.component.html',
  styleUrls: ['./photo-upload.component.scss'],
})
export class PhotoUploadComponent implements OnInit {
  @Output() imageSave = new EventEmitter<ImageFile>();
  @Input() maxSizeMb = 4;
  public file: File;
  imageBlobUrl: any;
  @Input() personId: number;
  constructor(
    public modalCtrl: ModalController,
    private personService: PersonService
  ) {}

  ngOnInit() {}

  onFileChange(event) {
    this.file = event.target.files[0];
    if (this.file) {
      this.createImageToBlob(this.file);
    }
  }

  createImageToBlob(image: Blob) {
    const reader = new FileReader();
    reader.addEventListener(
      'load',
      () => {
        this.imageBlobUrl = reader.result;
      },
      false
    );
    if (image) {
      reader.readAsDataURL(image);
    }
  }

  submitPhoto() {
    console.log(this.file);
    this.personService
      .uploadPhoto(this.personId, this.file)
      .subscribe((imageFile) => {
        this.imageSave.emit(imageFile);
        this.dismiss();
      });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
