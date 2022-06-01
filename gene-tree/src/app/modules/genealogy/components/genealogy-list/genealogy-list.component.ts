import { Component, OnInit } from '@angular/core';
import { switchMap, take, tap } from 'rxjs/operators';
import { GenericPersonModel } from '../../../person/models/generic-person.model';
import { PersonService } from '../../../person/service/person.service';
import { UserService } from '../../../user/service/user.service';
import { ActivatedRoute } from '@angular/router';
import { iif } from 'rxjs';
import { TreeService } from '../../service/tree.service';

@Component({
  selector: 'app-genealogy-list',
  templateUrl: './genealogy-list.component.html',
  styleUrls: ['./genealogy-list.component.scss'],
})
export class GenealogyListComponent implements OnInit {
  public peopleList: GenericPersonModel[] = [];
  public searchPerson: string;
  private userForList: GenericPersonModel;
  get personName(){
    return `${this.userForList?.firstName} ${this.userForList?.lastName}`;
  }
  constructor(
    private route: ActivatedRoute,
    private personService: PersonService,
    private userService: UserService,
    private treeService: TreeService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .pipe(
        switchMap((params) =>
          iif<GenericPersonModel, GenericPersonModel>(
            () => !!params.get('id'),
            this.userService.getTreeRoot(params.get('id')),
            this.userService.getPersonalInfo()
          )
        ),
        take(1),
        tap((user) => {
          this.treeService.treeId = user.treeId;
          this.userForList = user}
          ),
        switchMap((user) => this.personService.getPeopleListInTree(user.treeId))
      )
      .subscribe((people) => (this.peopleList = people));
  }

  get isUserTree() {
    return this.userService.isUserTree(this.userForList?.treeId);
  }
}
