import { PersonService } from './../person/services/person.service';
import { Component, OnInit } from '@angular/core';
import FamilyTree from '@balkangraph/familytree.js';
import { DataService } from '../core/services/data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-tree',
  templateUrl: './tree.page.html',
  styleUrls: ['./tree.page.scss'],
})
export class TreePage implements OnInit {
  public familyTree: FamilyTree;
  private personDetailHandler = (nodeId) => {
    var nodeData = this.familyTree.get(nodeId);
    var person = nodeData['personId'];
    this.router.navigate(['/person/details', 1]);
  };

  private personEditHandler = (nodeId) => {
    var nodeData = this.familyTree.get(nodeId);
    var person = nodeData['personId'];
    this.router.navigate(['/person/edit', 1]);
  };

  constructor(
    private router: Router,
    private dataService: DataService,
    private personService: PersonService
  ) {}

  //href="tel://{val}
  ngOnInit() {
    this.initFamilyTreeTemplates();
    this.initFamilyTree();
    this.setConversions();
    this.loadFamilyTree();
    this.setThemeSubscriber();
  }

  initFamilyTreeTemplates() {
    const userProfileLink = 'http://localhost:8100/user/profile/';
    const userIcon =
      '<path style="fill: white;" d="M332.64 64.58C313.18 43.57 286 32 256 32c-30.16 0-57.43 11.5-76.8 32.38-19.58 21.11-29.12 49.8-26.88 80.78C156.76 206.28 203.27 256 256 256s99.16-49.71 103.67-110.82c2.27-30.7-7.33-59.33-27.03-80.6zM432 480H80a31 31 0 01-24.2-11.13c-6.5-7.77-9.12-18.38-7.18-29.11C57.06 392.94 83.4 353.61 124.8 326c36.78-24.51 83.37-38 131.2-38s94.42 13.5 131.2 38c41.4 27.6 67.74 66.93 76.18 113.75 1.94 10.73-.68 21.34-7.18 29.11A31 31 0 01432 480z"/>';
    const userButtonTemplate =
      '<g transform="translate(10,10)"><a xlink:href="' +
      userProfileLink +
      '{val}"><rect width="32" height="24" fill="#ffffff" opacity=0></rect><g transform="matrix(0.046875 0 0 0.046875 4.000001 -0)">' +
      userIcon +
      '</g></a></g>';
    FamilyTree.templates.hugo_male['field_2'] = userButtonTemplate;
    FamilyTree.templates.hugo_female['field_2'] = userButtonTemplate;

    const personImgTemplate =
      '<clipPath id="ulaImg">' +
      '<circle cx="125" cy="20" r="40"></circle>' +
      '</clipPath>' +
      '<image preserveAspectRatio="xMidYMid slice" stroke="white" clip-path="url(#ulaImg)" xlink:href="{val}" x="85" y="-20" width="80" height="80">' +
      '</image>';
    FamilyTree.templates.hugo_male['img_0'] = personImgTemplate;
    FamilyTree.templates.hugo_female['img_0'] = personImgTemplate;
  }

  initFamilyTree() {
    this.familyTree = new FamilyTree(document.getElementById('tree'), {
      nodeMouseClick: FamilyTree.action.none,
      mouseScrool: FamilyTree.action.zoom,
      mode: 'dark',
      template: 'hugo',
      miniMap: false,
      roots: [3],
      nodeMenu: {
        edit: {
          text: 'Edit',
          icon: FamilyTree.icon.edit(18, 18, '#ffd534'),
          onClick: this.personEditHandler,
        },
        details: {
          text: 'Details',
          icon: FamilyTree.icon.details(18, 18, '#50c8ff'),
          onClick: this.personDetailHandler,
        },
      },
      nodeBinding: {
        field_0: 'name',
        field_1: 'born',
        field_2: 'userId',
        img_0: 'photo',
      },
    });
  }

  setConversions() {
    this.familyTree.on('field', (sender, args: any) => {
      if (args.name == 'born') {
        var date = new Date(args.value);
        args.value = date.toLocaleDateString();
      }
    });
  }

  loadFamilyTree() {
    this.familyTree.load([
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
        gender: 'male',
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

  private setThemeSubscriber() {
    this.dataService.darkTheme$.subscribe((dark) => {
      const themeString = dark ? 'dark' : 'light';
      if (this.familyTree.config.mode != themeString) {
        this.familyTree.config.mode = themeString;
        this.familyTree.draw();
      }
    });
  }
}
