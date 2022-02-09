export class PersonImageUpdateModel {
  constructor(personId: number, fileId: number) {
    this.personId = personId;
    this.imageId = fileId;
  }
  personId: number;
  imageId: number;
}
