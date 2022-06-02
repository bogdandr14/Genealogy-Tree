import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { NgxImageCompressService } from 'ngx-image-compress';
import { DOC_ORIENTATION } from 'ngx-image-compress';
import { take } from 'rxjs/operators';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { PersonService } from '../../service/person.service';

export const MAX_IMG_DIM = 400;
export const COMPRESS_QUALITY = 90;
@Component({
  selector: 'app-photo-upload',
  templateUrl: './photo-upload.component.html',
  styleUrls: ['./photo-upload.component.scss'],
})
export class PhotoUploadComponent implements OnInit {
  @Output() imageSave = new EventEmitter<ImageFile>();
  @Input() maxSizeMb = 2;
  @Input() personId: number;

  public originalImgFile: File;
  public originalImgUrl: string;

  public compressedImgFile: File;
  public compressedImgUrl: string;

  constructor(
    public modalCtrl: ModalController,
    private personService: PersonService,
    private imgCompressService: NgxImageCompressService
  ) { }

  ngOnInit() { }

  onFileChange(event) {
    this.originalImgFile = event.target.files[0];
    if (this.originalImgFile) {
      this.convertBlobToDataURI();
    }
  }

  convertBlobToDataURI() {
    const reader = new FileReader();
    reader.onload = (e: any) => {
      const img = new Image();
      img.onload = (rs) => {
        const imgHeight = rs.currentTarget['height'];
        const imgWidth = rs.currentTarget['width'];
        const minDim = imgHeight < imgWidth ? imgHeight : imgWidth;
        this.compressFile(minDim);
      };
      img.src = reader.result as string;
      this.originalImgUrl = reader.result as string;
    };
    reader.readAsDataURL(this.originalImgFile);
  }

  compressFile(originalImgMinDim: number) {
    const RATIO = (MAX_IMG_DIM * 100) / originalImgMinDim;
    this.imgCompressService
      .compressFile(
        this.originalImgUrl,
        DOC_ORIENTATION.Up,
        RATIO,
        COMPRESS_QUALITY
      )
      .then((result) => {
        this.compressedImgUrl = result;
        // call method that creates a blob from dataUri
        const compressedImgBlob = this.dataURItoBlob(result.split(',')[1]);
        //imageFile created below is the new compressed file which can be send to API in form data
        this.compressedImgFile = new File(
          [compressedImgBlob],
          this.originalImgFile.name,
          {
            type: this.originalImgFile.type,
          }
        );
        // window.open(window.URL.createObjectURL(this.originalImgFile));
        // window.open(window.URL.createObjectURL(this.compressedImgFile));
      });
  }

  dataURItoBlob(dataURI: string) {
    const byteString = window.atob(dataURI);
    const arrayBuffer = new ArrayBuffer(byteString.length);
    const int8Array = new Uint8Array(arrayBuffer);
    for (let i = 0; i < byteString.length; i++) {
      int8Array[i] = byteString.charCodeAt(i);
    }
    const blob = new Blob([int8Array], { type: this.originalImgFile.type });
    return blob;
  }

  submitPhoto() {
    this.personService
      .uploadPhoto(
        this.personId,
        this.compressedImgFile.size < this.originalImgFile.size
          ? this.compressedImgFile
          : this.originalImgFile
      ).pipe(take(1))
      .subscribe((imageFile) => {
        this.imageSave.emit(imageFile);
        this.dismiss();
      });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
