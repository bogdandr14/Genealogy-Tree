import { PhotoUploadComponent } from './../photo-upload/photo-upload.component';
import { ModalController } from '@ionic/angular';
import { ImageFile } from './../../../shared/models/image-file';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-person-avatar',
  templateUrl: './person-avatar.component.html',
  styleUrls: ['./person-avatar.component.scss'],
})
export class PersonAvatarComponent implements OnInit {
  @Input() type = 'person';
  @Input() imageFile: ImageFile;
  @Input() personId: number;
  @Input() canEdit: boolean = false;
  constructor(private modalCtrl:ModalController) {}

  ngOnInit() {
    this.modalCtrl.create({ component: PhotoUploadComponent });
  }
  get imageUrl() {
    if (this.imageFile) {
      return `data:${this.imageFile.mimeType};base64,${this.imageFile.fileInBytes}`;
    } else {
      return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
    }
  }

  setImageFile(image: ImageFile) {
    this.imageFile = image;
  }
}
