/* eslint-disable no-debugger */
import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
} from '@angular/core';
import { ModalController } from '@ionic/angular';
import { NgxImageCompressService } from 'ngx-image-compress';
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
    private personService: PersonService,
    private imageCompressService: NgxImageCompressService
  ) { }

  localUrl: any;
  localCompressedURl: any;
  sizeOfOriginalImage: number;
  sizeOFCompressedImage: number;

  ngOnInit() { }

  onFileChange(event) {
    this.file = event.target.files[0];
    if (this.file) {

      this.createImageToBlob(this.file);
    }
  }

  createImageToBlob(image: Blob) {
    var fileName: any;
    fileName = this.file['name'];
    const reader = new FileReader();
    reader.addEventListener(
      'load',
      () => {
        this.imageBlobUrl = reader.result;
        this.compressFile(this.imageBlobUrl, fileName);
      },
      false
    );
    if (image) {
      reader.readAsDataURL(image);
    }
  }
  imgResultBeforeCompress: string;
  imgResultAfterCompress: string;
  compressFile(image, fileName) {
    var orientation = -1;
    this.sizeOfOriginalImage = this.imageCompressService.byteCount(image) / (1024 * 1024);
    console.warn('Size in bytes is now:', this.sizeOfOriginalImage);

    this.imageCompressService.compressFile(image, orientation, 10, 90).then(
      result => {
        this.imgResultAfterCompress = result;
        this.localCompressedURl = result;
        this.sizeOFCompressedImage = this.imageCompressService.byteCount(result) / (1024 * 1024)
        console.warn('Size in bytes after compression:', this.sizeOFCompressedImage);
        // create file from byte
        const imageName = fileName;
        // call method that creates a blob from dataUri
        const imageBlob = this.dataURItoBlob(this.imgResultAfterCompress.split(',')[1]);
        //imageFile created below is the new compressed file which can be send to API in form data
        const imageFile = new File([result], imageName, { type: 'image/jpeg' });
      });
  }
  dataURItoBlob(dataURI) {
    const byteString = window.atob(dataURI);
    const arrayBuffer = new ArrayBuffer(byteString.length);
    const int8Array = new Uint8Array(arrayBuffer);
    for (let i = 0; i < byteString.length; i++) {
      int8Array[i] = byteString.charCodeAt(i);
    }
    const blob = new Blob([int8Array], { type: 'image/jpeg' });
    return blob;
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
