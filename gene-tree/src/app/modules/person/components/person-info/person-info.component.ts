import { UserService } from 'src/app/modules/user/services/user.service';
import { Component, Input, OnInit } from '@angular/core';
import { ImageFile } from 'src/app/modules/shared/models/image-file';
import { PersonEditModel } from '../../models/person/person-edit.model';

@Component({
  selector: 'app-person-info',
  templateUrl: './person-info.component.html',
  styleUrls: ['./person-info.component.scss'],
})
export class PersonInfoComponent implements OnInit {
  @Input() personInfo: PersonEditModel;
  constructor(private userService: UserService) { }

  ngOnInit() {}

  get imageUrl() {
    if (this.personInfo && this.personInfo.imageFile) {
      return `data:${this.personInfo.imageFile.mimeType};base64,${this.personInfo.imageFile.fileInBytes}`;
    } else {
      return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
    }
  }

  setImageFile(image: ImageFile) {
    this.personInfo.imageFile = image;
  }

  public get canDelete() {
    return !this.userService.isCurrentUser(this.personInfo.userId);
  }
}
