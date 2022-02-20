import { ImageFile } from './../../../shared/models/image-file';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { UserService } from 'src/app/modules/user/services/user.service';
import { PersonDetailsModel } from '../../models/person/person-details.model';
import { PersonService } from '../../services/person.service';

@Component({
  selector: 'app-person-details',
  templateUrl: './person-details.page.html',
  styleUrls: ['./person-details.page.scss'],
})
export class PersonDetailsPage implements OnInit {
  public personId: number;
  public personDetails: PersonDetailsModel = new PersonDetailsModel();

  private person$: Observable<PersonDetailsModel>;

  constructor(
    private route: ActivatedRoute,
    public router: Router,
    private userService: UserService,
    private personService: PersonService
  ) {}

  ngOnInit() {
    this.person$ = this.route.paramMap.pipe(
      switchMap((params) => {
        this.personId = Number(params.get('id'));
        if (this.personId) {
          return this.personService.getPerson(this.personId);
        } else {
          return this.personService.getPerson(
            this.userService.getCurrentUser().personId
          );
        }
      })
    );
    this.person$.subscribe((person) => {
      this.personDetails = person;
    });
  }

  get imageUrl() {
    if (this.personDetails && this.personDetails.imageFile) {
      return `data:${this.personDetails.imageFile.mimeType};base64,${this.personDetails.imageFile.fileInBytes}`;
    } else {
      return 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y';
    }
  }
  public get canDelete() {
    return !this.userService.isCurrentUser(this.personDetails.userId);
  }

  setImageFile(image: ImageFile) {
    this.personDetails.imageFile = image;
  }

  refreshPerson() {
    this.person$.subscribe((person) => {
      this.personDetails = person;
    });
  }
}
