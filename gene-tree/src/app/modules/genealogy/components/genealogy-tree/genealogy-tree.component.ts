import { PersonTreeInfoModel } from './../../models/person-tree-info.model';
import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { switchMap, take, tap } from 'rxjs/operators';
import { DataService } from 'src/app/modules/core/services/data.service';
import { PersonService } from 'src/app/modules/person/service/person.service';
import { TreeDataModel } from '../../models/tree-data.model';
import { TreeService } from '../../service/tree.service';

@Component({
  selector: 'app-genealogy-tree',
  templateUrl: './genealogy-tree.component.html',
  styleUrls: ['./genealogy-tree.component.scss'],
})
export class GenealogyTreeComponent implements OnInit {
  constructor(
    private treeService: TreeService,
    private personService: PersonService,
    private dataService: DataService,
    public datepipe: DatePipe
  ) {}

  //href="tel://{val}
  ngOnInit() {
    this.dataService
      .getCurrentUser()
      .pipe(
        tap((currentUser) =>
          this.treeService.createFamilyTree(currentUser.personId)
        ),
        switchMap((currentUser) => {
          return this.personService.getPeopleTreeDataInTree(currentUser.treeId);
        }),
        take(1)
      )
      .subscribe((people) => {
        //this.loadFamilyTreeMockup();
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
        gender: person.gender === 'm' ? 'male' : 'female',
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
  loadFamilyTreeMockup() {
    this.treeService.loadFamilyTree([
      {
        id: 1,
        pids: [3],
        gender: 'male',
        photo: 'https://cdn.balkan.app/shared/m60/2.jpg',
        name: 'Zeph Daniels',
        born: '1954-09-29',
        userId: null,
      },
      {
        id: 2,
        pids: [3],
        gender: 'other',
        photo: 'https://cdn.balkan.app/shared/m60/1.jpg',
        name: 'Rowan Annable',
        born: '1952-10-10',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 3,
        pids: [1, 2],
        gender: 'female',
        photo: 'https://cdn.balkan.app/shared/w60/1.jpg',
        name: 'Laura Shepherd',
        born: '1943-01-13',
        email: 'laura.shepherd@gmail.com',
        phone: '+44 845 5752 547',
        city: 'Moscow',
        country: 'ru',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 4,
        pids: [5],
        gender: 'other',
        photo: 'https://cdn.balkan.app/shared/m60/3.jpg',
        name: 'Rowan Annable',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 5,
        pids: [4],
        gender: 'female',
        photo: 'https://cdn.balkan.app/shared/w60/3.jpg',
        name: 'Lois Sowle',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 6,
        mid: 2,
        fid: 3,
        pids: [7],
        gender: 'female',
        photo: 'https://cdn.balkan.app/shared/w30/1.jpg',
        name: 'Tyler Heath',
        born: '1975-11-12',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 7,
        pids: [6],
        mid: 5,
        fid: 4,
        gender: 'male',
        photo: 'https://cdn.balkan.app/shared/m30/3.jpg',
        name: 'Samson Stokes',
        born: '1986-10-01',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
      {
        id: 8,
        mid: 7,
        fid: 6,
        gender: 'female',
        photo: 'https://cdn.balkan.app/shared/w10/3.jpg',
        name: 'Celeste Castillo',
        born: '2021-02-01',
        userId: 'E6CC4808-683F-489B-9C1C-97E156F2CB27',
      },
    ]);
  }
}
