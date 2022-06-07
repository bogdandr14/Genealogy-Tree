import { PhotoUploadComponent } from './../photo-upload/photo-upload.component';
import { ModalController } from '@ionic/angular';
import { ImageFile } from './../../../shared/models/image-file';
import { Component, Input, OnInit } from '@angular/core';
import { UtilsService } from '../../../shared/services/utils.service';

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
  constructor(private modalCtrl: ModalController, public utilsService: UtilsService) { }

  ngOnInit() {
    this.modalCtrl.create({ component: PhotoUploadComponent });
  }

  setImageFile(image: ImageFile) {
    this.imageFile = image;
  }
}
