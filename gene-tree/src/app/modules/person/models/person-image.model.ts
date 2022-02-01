export class PersonImageModel {
  constructor(personId: number, file: File, fileId: number) {
    this.personId = personId;
    this.file = file;
    this.fileId = fileId;
  }
  personId: number;
  fileId: number;
  file: File;
}
