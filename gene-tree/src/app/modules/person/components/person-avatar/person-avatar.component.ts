import { ImageFile } from './../../../shared/models/image-file';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-person-avatar',
  templateUrl: './person-avatar.component.html',
  styleUrls: ['./person-avatar.component.scss'],
})
export class PersonAvatarComponent implements OnInit {
  @Input() imageFile: ImageFile;
  @Input() personId: number;
  constructor() {}

  ngOnInit() {}
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
