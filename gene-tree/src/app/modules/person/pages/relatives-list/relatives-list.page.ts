import { StorageService } from 'src/app/modules/core/services/storage.service';
import { CurrentUserModel } from './../../../core/models/current-user.model';
import { PersonService } from './../../services/person.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { GenericPersonModel } from '../../models/person/generic-person.model';

@Component({
  selector: 'app-relatives-list',
  templateUrl: './relatives-list.page.html',
  styleUrls: ['./relatives-list.page.scss'],
})
export class RelativesListPage implements OnInit {
  public relativesList: GenericPersonModel[] = [];
  private currentUser: CurrentUserModel;
  constructor(
    private storageService: StorageService,
    private personService: PersonService
  ) {}

  async ngOnInit() {
    this.currentUser = await this.storageService.getCurrentUser();
    this.personService
      .getAllPeopleInTree(this.currentUser.treeId)
      .subscribe((relatives) => {
        this.relativesList = relatives;
      });
  }

  // TODO check who is the root of the tree
  isTreeRoot() {}
}
