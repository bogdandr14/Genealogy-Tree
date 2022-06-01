import { GenericPersonModel } from './../../../person/models/generic-person.model';
import { UserService } from '../../../user/service/user.service';
import { ActivatedRoute } from '@angular/router';
import { PersonTreeInfoModel } from './../../models/person-tree-info.model';
import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { switchMap, take, tap } from 'rxjs/operators';
import { DataService } from '../../../core/services/data.service';
import { PersonService } from '../../../person/service/person.service';
import { TreeDataModel } from '../../models/tree-data.model';
import { TreeService } from '../../service/tree.service';
import { iif } from 'rxjs';

@Component({
  selector: 'app-genealogy-tree',
  templateUrl: './genealogy-tree.component.html',
  styleUrls: ['./genealogy-tree.component.scss'],
})
export class GenealogyTreeComponent implements OnInit {
  private userForTree: GenericPersonModel;
  get personName() {
    return `${this.userForTree?.firstName} ${this.userForTree?.lastName}`;
  }
  constructor(
    private route: ActivatedRoute,
    private treeService: TreeService,
    private personService: PersonService,
    private userService: UserService,
    public datepipe: DatePipe
  ) {}

  //href="tel://{val}
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
          this.userForTree = user;
          this.treeService.createFamilyTree(this.isUserTree);
        }),
        switchMap((user) =>
          this.personService.getPeopleTreeDataInTree(user.treeId)
        )
      )
      .subscribe((people) => {
        //this.loadGeneTreeMockup();
        this.treeService.loadFamilyTree(this.mapTreeData(people));
      });
  }

  mapTreeData(people: PersonTreeInfoModel[]) {
    return people.map<TreeDataModel>((person) => {
      return {
        id: person.personId,
        fid: person.motherId ? person.motherId : null,
        mid: person.fatherId ? person.fatherId : null,
        pids: person.partnersIds,
        gender:
          person.deathDate == null
            ? person.gender === 'm'
              ? 'male'
              : 'female'
            : '',
        photo: person.imageFile
          ? `data:${person.imageFile.mimeType};base64,${person.imageFile.fileInBytes}`
          : 'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        name: `${person.firstName} ${person.lastName}`,
        born: this.datepipe.transform(person.birthDate, 'yyyy-MM-dd'),
        userId: person.userId ? person.userId : null,
      };
    });
  }

  loadGeneTreeMockup() {
    this.treeService.loadFamilyTree([
      {
        id: 1,
        mid: -2,
        fid: -3,
        pids: [4],
        name: 'Gustav Alfonzoj',
        gender: 'male',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '1983-09-26',
      },
      {
        id: 3,
        mid: 1,
        fid: 4,
        name: 'Deiq Toe',
        gender: 'female',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '1999-07-12',
      },
      {
        id: 4,
        fid: 34,
        mid: 33,
        pids: [1],
        name: 'Valeria Umof',
        gender: 'female',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '1980-10-25',
      },
      {
        id: 33,
        pids: [34],

        name: 'qwe asd',
        gender: 'male',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '2022-02-04',
      },
      {
        id: 34,
        name: 'Tilkova Asmeradis',
        gender: 'female',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '2003-10-03',
      },

      {
        id: -2,
        pids: [-3],
        name: 'Unknown',
        gender: 'male',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '1983-09-26',
      },
      {
        id: -3,
        pids: [-2],
        name: 'Unknown',
        gender: 'female',
        photo:
          'https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y',
        born: '1983-09-26',
      },
    ]);
  }
  get isUserTree() {
    return this.userService.isUserTree(this.userForTree?.treeId);
  }
}
