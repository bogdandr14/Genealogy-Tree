import { DataService } from './../../../core/services/data.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { take, first, switchMap } from 'rxjs/operators';
import { GenericPersonModel } from '../../../person/models/generic-person.model';
import { PersonService } from '../../../person/service/person.service';
import { RequestCreateUpdateModel } from '../../models/request-create-update.model';
import { RelativeService } from '../../services/relative.service';

@Component({
  selector: 'app-relative-request',
  templateUrl: './relative-request.component.html',
  styleUrls: ['./relative-request.component.scss'],
})
export class RelativeRequestComponent implements OnInit {
  @Input() set receiverUser(receiverUser: GenericPersonModel) {
    this.request.receiverUser = receiverUser;
  }
  @Output() saveConfirmed = new EventEmitter<boolean>();

  public peopleWithoutUserList: GenericPersonModel[];

  public request = new RequestCreateUpdateModel();
  constructor(
    private modalCtrl: ModalController,
    private relativeService: RelativeService,
    private personService: PersonService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.dataService.getCurrentUser().pipe(take(1),
      switchMap((currentUser) => {
        return  this.personService
        .getPeopleWithoutRelative(currentUser.treeId).pipe(take(1))
      })).subscribe((people) => {
        this.peopleWithoutUserList = people;
      });
  }

  selectPerson(person?: GenericPersonModel) {
    this.request.receiverReferenceInSenderTree = person;
  }

  addMarriage() {
    this.relativeService
      .sendRequest(this.request)
      .pipe(first())
      .subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}

