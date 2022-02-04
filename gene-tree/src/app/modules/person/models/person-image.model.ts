export class PersonImageModel {
  constructor(personId: number, file: File, fileId: number) {
    this.personId = personId;
    this.image = file;
    this.imageId = fileId;
  }
  personId: number;
  imageId: number;
  image: File;
}
