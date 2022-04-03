import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import FamilyTree from '@balkangraph/familytree.js';
import { TranslateService } from '@ngx-translate/core';
import { DataService } from '../../core/services/data.service';
import { TreeTemplateConstants } from '../models/tree-template.constants';

@Injectable({
  providedIn: 'root',
})
export class TreeService {
  private familyTree: FamilyTree;
  private themeString;
  constructor(
    private router: Router,
    private dataService: DataService,
    private translateService: TranslateService
  ) {
    this.setThemeSubscriber();
    this.setLangSubscriber();
    this.initCustomTemplate();
  }

  private personDetailHandler = (nodeId) => {
    var nodeData = this.familyTree.get(nodeId);
    var personId = nodeData['id'];
    this.router.navigate(['/person/details', personId]);
  };

  private personEditHandler = (nodeId) => {
    var nodeData = this.familyTree.get(nodeId);
    var personId = nodeData['id'];
    this.router.navigate(['/person/edit', personId]);
  };

  private initCustomTemplate() {
    FamilyTree.templates.gene = Object.assign({}, FamilyTree.templates.base);
    FamilyTree.templates.gene.defs = TreeTemplateConstants.treeDefs;
    FamilyTree.templates.gene['field_0'] = TreeTemplateConstants.personName;
    FamilyTree.templates.gene['field_1'] = TreeTemplateConstants.personBirthDate;
    FamilyTree.templates.gene['field_2'] = TreeTemplateConstants.userBtn;
    FamilyTree.templates.gene['img_0'] = TreeTemplateConstants.personImg;
    FamilyTree.templates.gene['up'] = TreeTemplateConstants.expandNodesBtn;
    FamilyTree.templates.gene.node = TreeTemplateConstants.personNode;
    FamilyTree.templates.gene.nodeMenuButton = TreeTemplateConstants.menuBtn;
    FamilyTree.templates.gene.ripple = {
      radius: 0,
      color: 'none',
      rect: null,
    };

    FamilyTree.templates.gene_male = Object.assign(
      {},
      FamilyTree.templates.gene
    );
    FamilyTree.templates.gene_male.node = TreeTemplateConstants.maleNode;

    FamilyTree.templates.gene_female = Object.assign(
      {},
      FamilyTree.templates.gene
    );
    FamilyTree.templates.gene_female.node = TreeTemplateConstants.femaleNode;
  }

  public createFamilyTree(rootId: number) {
    this.familyTree = new FamilyTree(document.getElementById('tree'), {
      nodeMouseClick: FamilyTree.action.none,
      mouseScrool: FamilyTree.action.zoom,
      mode: this.themeString,
      searchFields: ['name', 'born'],
      template: 'gene',
      miniMap: false,
      toolbar: {
        layout: true,
        zoom: true,
        fit: false,
        expandAll: false,
        fullScreen: false,
      },
      roots: [],
      nodeMenu: {
        edit: {
          text: this.translateService.instant('_common.edit'),
          icon: FamilyTree.icon.edit(18, 18, '#ffd534'),
          onClick: this.personEditHandler,
        },
        details: {
          text: this.translateService.instant('_common.details'),
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
    this.setConversions();
    return this.familyTree;
  }

  private setConversions() {
    this.familyTree.on('field', (sender, args: any) => {
      if (args.name == 'born') {
        var date = new Date(args.value);
        args.value = date.toLocaleDateString();
      }
    });
  }

  loadFamilyTree(people: any[]) {
    this.familyTree.load(people);
  }

  private setThemeSubscriber() {
    this.dataService.darkTheme$.subscribe((dark) => {
      this.themeString = dark ? 'dark' : 'light';
      if (this.familyTree && this.familyTree.config.mode != this.themeString) {
        this.familyTree.config.mode = this.themeString;
        this.familyTree.draw();
      }
    });
  }

  private setLangSubscriber() {
    this.dataService.language$.subscribe((language) => {
      if (this.familyTree) {
        this.familyTree.config.nodeMenu.edit.text =
          this.translateService.instant('_common.edit');
        this.familyTree.config.nodeMenu.details.text =
          this.translateService.instant('_common.details');
        this.familyTree.draw();
      }
    });
  }
}
