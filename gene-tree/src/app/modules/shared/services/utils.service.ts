import { Injectable } from '@angular/core';
import { GenericPersonModel } from '../../person/models/generic-person.model';
import { ImageFile } from '../models/image-file';

@Injectable({
  providedIn: 'root'
})
export class UtilsService {

  constructor() { }

  public imageUrl(imageFile: ImageFile): string {
    if (imageFile) {
      return `data:${imageFile.mimeType};base64,${imageFile.fileInBytes}`;
    }
    return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
  }

  public cardColor(person: GenericPersonModel) {
    if (person.deathDate != null) {
      return 'dead-card';
    } else if (person.gender === 'm') {
      return 'male-card';
    } else {
      return 'female-card';
    }
  }
}
