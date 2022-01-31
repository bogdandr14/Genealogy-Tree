import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-photo-upload',
  templateUrl: './photo-upload.component.html',
  styleUrls: ['./photo-upload.component.scss'],
})
export class PhotoUploadComponent implements OnInit {
  @ViewChild("fileUpload", {static: true}) uploader: ElementRef<HTMLInputElement>;

  public file: File;
  @Input() personId: number;
  constructor(
    public modalCtrl: ModalController,
    private personService: PersonService
  ) {}

  ngOnInit() {}


popFileChooser(): void {
  this.uploader.nativeElement.click();
}

  onFileChange(fileChangeEvent) {
    console.log("🚀 ~ file: photo-upload.component.ts ~ line 21 ~ PhotoUploadComponent ~ onFileChange ~ fileChangeEvent", fileChangeEvent)
    this.file = fileChangeEvent.target.files[0];
    console.log("🚀 ~ file: photo-upload.component.ts ~ line 22 ~ PhotoUploadComponent ~ onFileChange ~ this.file", this.file)
  }

  submitPhoto() {
    let formData = new FormData();
    formData.append('photo', this.file);
    this.personService.changePhoto(this.personId, formData).subscribe(() => {
      console.log(formData);
      this.dismiss();
    });
  }
  dismiss() {
    this.modalCtrl.dismiss();
  }
}
