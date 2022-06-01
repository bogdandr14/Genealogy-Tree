import { RequestResponseModel } from './../../../relative/models/request-response.model';
import { DataService } from '../../../core/services/data.service';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { take, first, switchMap } from 'rxjs/operators';
import { GenericPersonModel } from '../../../person/models/generic-person.model';
import { PersonService } from '../../../person/service/person.service';
import { RequestCreateUpdateModel } from '../../../relative/models/request-create-update.model';
import { RelativeService } from '../../../relative/services/relative.service';
import { RequestDetailsModel } from '../../../relative/models/request-details.model';
import { iif } from 'rxjs';

@Component({
  selector: 'app-relative-request',
  templateUrl: './relative-request.component.html',
  styleUrls: ['./relative-request.component.scss'],
})
export class RelativeRequestComponent implements OnInit {
  @Input() set receiverUser(receiverUser: GenericPersonModel) {
    this.sendRequest.receiverUser = receiverUser;
    this.forSend = true;
  }
  @Input() set requestToRespond(requestId: number) {
    this.respondRequest.id = requestId;
    this.forSend = false;
  }
  @Output() saveConfirmed = new EventEmitter<boolean>();


  get personInTreeReferenceId() {
    if (this.forSend) {
      return this.sendRequest.receiverReferenceInSenderTreeId;
    } else {
      return this.respondRequest.senderReferenceInReceiverTreeId;
    }
  }

  public peopleWithoutUserList: GenericPersonModel[];
  private forSend: boolean;
  private sendRequest = new RequestCreateUpdateModel();
  private respondRequest = new RequestResponseModel();
  constructor(
    private modalCtrl: ModalController,
    private relativeService: RelativeService,
    private personService: PersonService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.dataService
      .getCurrentUser()
      .pipe(
        take(1),
        switchMap((currentUser) => {
          return this.personService
            .getPeopleWithoutRelative(currentUser.treeId)
            .pipe(take(1));
        })
      )
      .subscribe((people) => {
        this.peopleWithoutUserList = people;
      });
  }

  selectPerson(person?: GenericPersonModel) {
    if (this.forSend) {
      this.sendRequest.receiverReferenceInSenderTreeId = person.personId;
    } else {
      this.respondRequest.senderReferenceInReceiverTreeId = person.personId;
    }
  }

  saveRequest() {
    this.respondRequest.response = true;
    iif(()=> this.forSend,
    this.relativeService
    .sendRequest(this.sendRequest),
    this.relativeService.respondToRequest(this.respondRequest)
    ).pipe(take(1))
      .subscribe(() => {
        this.saveConfirmed.emit(true);
        this.dismiss();
      });
  }

  dismiss() {
    this.modalCtrl.dismiss();
  }
}
