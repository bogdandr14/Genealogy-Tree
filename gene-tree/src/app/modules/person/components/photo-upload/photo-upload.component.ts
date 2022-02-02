import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { PersonImageModel } from '../../models/person-image.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-photo-upload',
  templateUrl: './photo-upload.component.html',
  styleUrls: ['./photo-upload.component.scss'],
})
export class PhotoUploadComponent implements OnInit {
  @ViewChild("fileUpload", { static: true }) uploader: ElementRef<HTMLInputElement>;
  @Input() maxSizeMb = 4;
  public file: File;
  isFileValid = true;
  imageBlobUrl: any;
  @Input() personId: number;
  constructor(
    public modalCtrl: ModalController,
    private personService: PersonService
  ) { }

  ngOnInit() { }

  popFileChooser(): void {
    this.uploader.nativeElement.click();
  }

  createImageToBlob(image: Blob) {
    const reader = new FileReader();
    reader.addEventListener(
      'load', () => {
        this.imageBlobUrl = reader.result;
      },
      false
    );
    if (image) {
      reader.readAsDataURL(image);
      this.isFileValid = this.file.size < this.maxSizeMb * 1024 * 1024;
    }
  }

  onFileChange(fileChangeEvent) {
    console.log("🚀 ~ file: photo-upload.component.ts ~ line 21 ~ PhotoUploadComponent ~ onFileChange ~ fileChangeEvent", fileChangeEvent)
    this.file = fileChangeEvent.target.files[0];
    console.log("🚀 ~ file: photo-upload.component.ts ~ line 22 ~ PhotoUploadComponent ~ onFileChange ~ this.file", this.file)
    if(this.file){
      this.checkIfFileOk(fileChangeEvent.target.files[0]);
    }
  }

  checkIfFileOk(file: File) {
    if (file.type.indexOf('image') === -1) {
      return false;
    }
    this.file = file;
    this.createImageToBlob(this.file);
    return true;
  }

  submitPhoto() {
    let personImage = new PersonImageModel(this.personId, this.file, null);
    this.personService.changePhoto(personImage).subscribe(() => {
      console.log(personImage);
      this.dismiss();
    });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
