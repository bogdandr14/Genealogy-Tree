/* eslint-disable no-debugger */
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { NgxImageCompressService } from 'ngx-image-compress';
import { DOC_ORIENTATION } from 'ngx-image-compress';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { PersonService } from '../../services/person.service';

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
  public file: File;
  public imgHeight: number;
  public imgWidth: number;

  public originalImgUrl: string;
  public originalImgSize: number;
  public originalImgFile: File;

  public compressedImgUrl: string;
  public compressedImgSize: number;
  private compressedImgFile: File;

  @Input() personId: number;
  constructor(
    public modalCtrl: ModalController,
    private personService: PersonService,
    private imgCompressService: NgxImageCompressService
  ) {}

  ngOnInit() {}

  onFileChange(event) {
    this.file = event.target.files[0];
    if (this.file) {
      this.convertBlobToDataURI();
    }
  }

  convertBlobToDataURI() {
    const reader = new FileReader();
    reader.onload = (e: any) => {
      const img = new Image();
      img.onload = (rs) => {
        this.imgHeight = rs.currentTarget['height'];
        this.imgWidth = rs.currentTarget['width'];
        this.compressFile();
      };
      img.src = reader.result as string;
      this.originalImgUrl = reader.result as string;
      this.originalImgFile = new File([this.originalImgUrl], this.file.name, {
        type: this.file.type,
      });
    };
    reader.readAsDataURL(this.file);
  }

  compressFile() {
    this.originalImgSize =
      this.imgCompressService.byteCount(this.originalImgUrl) / 1024;
    let minDim = this.imgHeight;
    if (this.imgWidth < this.imgHeight) {
      minDim = this.imgWidth;
    }
    const ratio = (MAX_IMG_DIM * 100) / minDim;
    this.imgCompressService
      .compressFile(
        this.originalImgUrl,
        DOC_ORIENTATION.Up,
        ratio,
        COMPRESS_QUALITY,
        MAX_IMG_DIM,
        MAX_IMG_DIM
      )
      .then((result) => {
        this.compressedImgUrl = result;
        this.compressedImgSize =
          this.imgCompressService.byteCount(result) / 1024;
        // call method that creates a blob from dataUri
        const imageBlob = this.dataURItoBlob(result.split(',')[1]);
        //imageFile created below is the new compressed file which can be send to API in form data
       debugger;
        this.compressedImgFile = new File([result], this.file.name, {
          type: this.file.type,
        });
      });
  }

  dataURItoBlob(dataURI) {
    const byteString = window.atob(dataURI);
    const arrayBuffer = new ArrayBuffer(byteString.length);
    const int8Array = new Uint8Array(arrayBuffer);
    for (let i = 0; i < byteString.length; i++) {
      int8Array[i] = byteString.charCodeAt(i);
    }
    const blob = new Blob([int8Array], { type: this.file.type });
    return blob;
  }

  submitPhoto() {
    console.log(this.file);
    this.personService
      .uploadPhoto(
        this.personId,
        this.compressedImgSize > this.originalImgSize
          ? this.compressedImgFile
          : this.file
      )
      .subscribe((imageFile) => {
        this.imageSave.emit(imageFile);
        this.dismiss();
      });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
