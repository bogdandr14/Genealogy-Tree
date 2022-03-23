import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import FamilyTree from '@balkangraph/familytree.js';
import { TranslateService } from '@ngx-translate/core';
import { DataService } from '../../core/services/data.service';

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
    var person = nodeData['personId'];
    this.router.navigate(['/person/details', 1]);
  };

  private personEditHandler = (nodeId) => {
    var nodeData = this.familyTree.get(nodeId);
    var person = nodeData['personId'];
    this.router.navigate(['/person/edit', 1]);
  };

  private initCustomTemplate() {
    FamilyTree.templates.gene = Object.assign({}, FamilyTree.templates.base);

    FamilyTree.templates.gene.defs = `<clipPath id="gene_img_0"><rect id="gene_img_0_stroke" stroke-width="2" stroke="#fff" x="90" y="-5" rx="25" ry="25" width="70" height="70"></rect></clipPath>
        <linearGradient id="gene_grad_female" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#FF8024;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#FF46A3;stop-opacity:1" />
        </linearGradient>
        <linearGradient id="gene_grad_male" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#00D3A5;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#00A7D4;stop-opacity:1" />
        </linearGradient>
        <linearGradient id="gene_grad" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#D0D0D0;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#009090;stop-opacity:1" />
        </linearGradient>
        <linearGradient id="gene_grad_other" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:red;stop-opacity:1" />
            <stop offset="20%" style="stop-color:orange;stop-opacity:1" />
            <stop offset="40%" style="stop-color:yellow;stop-opacity:1" />
            <stop offset="60%" style="stop-color:green;stop-opacity:1" />
            <stop offset="80%" style="stop-color:blue;stop-opacity:1" />
            <stop offset="100%" style="stop-color:indigo;stop-opacity:1" />
        </linearGradient>
        <g id="gene_up">
        <circle cx="12" cy="12" r="15" fill="transparent"></circle>
          ${FamilyTree.icon['ft'](24, 24, '#fff', 0, 0)}
        </g>
        <g id="gene_node_menu" style="cursor:pointer;">
            <rect x="0" y="0" fill="transparent" width="22" height="22"></rect>
            <circle cx="11" cy="4" r="2" fill="#ffffff"></circle><circle cx="11" cy="11" r="2" fill="#ffffff"></circle>
            <circle cx="11" cy="18" r="2" fill="#ffffff"></circle>
        </g>
        <style>
          .{randId} .bft-edit-form-header{
              background: linear-gradient(90deg, #D0D0D0 0%, #909090 100%);
          }
          .{randId}.male .bft-edit-form-header{
              background: linear-gradient(90deg, #00D3A5 0%, #00A7D4 100%);
          }
          .{randId}.female .bft-edit-form-header{
              background: linear-gradient(90deg, #FF8024 0%, #FF46A3 100%);
          }
          .{randId} .bft-img-button{
              background-color: #909090;
          }
          .{randId} .bft-img-button:hover{
              background-color: #D0D0D0;
          }
          .{randId}.male .bft-img-button{
              background-color: #00A7D4;
          }
          .{randId}.male .bft-img-button:hover{
              background-color: #00D3A5;
          }
          .{randId}.female .bft-img-button{
              background-color: #FF46A3;
          }
          .{randId}.female .bft-img-button:hover{
              background-color: #FF8024;
          }
          .user-link path:hover{
            fill: #2fdf75 !important;
          }
        </style>`;

    FamilyTree.templates.gene.img_0 = `<use xlink:href="#gene_img_0_stroke" />
        <image preserveAspectRatio="xMidYMid slice" clip-path="url(#gene_img_0)" xlink:href="{val}" x="90" y="-5" width="70" height="70"></image>`;
    FamilyTree.templates.gene['field_0'] = `<text ' + FamilyTree.attr.width + ' ="230" style="font-size: 18px;font-weight:bold;" fill=url(#gene_grad) x="125" y="85" text-anchor="middle">{val}</text>`;
    FamilyTree.templates.gene['field_1'] = `<text ' + FamilyTree.attr.width + ' ="230" style="font-size: 14px;" fill="#ffffff" x="125" y="105" text-anchor="middle">{val}</text>`;
    const userProfileLink = 'http://localhost:8100/user/profile';
    const userIcon = '<path style="fill: white;" d="M332.64 64.58C313.18 43.57 286 32 256 32c-30.16 0-57.43 11.5-76.8 32.38-19.58 21.11-29.12 49.8-26.88 80.78C156.76 206.28 203.27 256 256 256s99.16-49.71 103.67-110.82c2.27-30.7-7.33-59.33-27.03-80.6zM432 480H80a31 31 0 01-24.2-11.13c-6.5-7.77-9.12-18.38-7.18-29.11C57.06 392.94 83.4 353.61 124.8 326c36.78-24.51 83.37-38 131.2-38s94.42 13.5 131.2 38c41.4 27.6 67.74 66.93 76.18 113.75 1.94 10.73-.68 21.34-7.18 29.11A31 31 0 01432 480z"/>';

    FamilyTree.templates.gene['field_2'] = `<g transform="translate(180,8)">
                                              <a class="user-link" xlink:href="${userProfileLink}/{val}">
                                                <rect width="32" height="24" fill="#ffffff" opacity=0></rect>
                                                <g transform="matrix(0.046875 0 0 0.046875 4.000001 -0)">
                                                  ${userIcon}
                                                </g>
                                              </a>
                                            </g>`;
    const personImgTemplate = `<clipPath id="personImg">
                                  <circle cx="125" cy="20" r="40"></circle>
                                </clipPath>
                                <image preserveAspectRatio="xMidYMid slice" stroke="white" clip-path="url(#personImg)" xlink:href="{val}" x="85" y="-20" width="80" height="80"></image>`;
    FamilyTree.templates.gene['img_0'] = personImgTemplate;

    FamilyTree.templates.gene.node = `<rect x="0" y="0" height="{h}" width="{w}" stroke-width="1" fill=url(#gene_grad_other) stroke="#aeaeae" rx="7" ry="7"></rect>`;
    FamilyTree.templates.gene['up'] = `<use x="20" y="8" xlink:href="#gene_up"/>`;
    FamilyTree.templates.gene.nodeMenuButton = `<use x="225" y="10" data-ctrl-n-menu-id="{id}" xlink:href="#gene_node_menu" />`;
    FamilyTree.templates.gene.ripple = {
      radius: 0,
      color: "none",
      rect: null
    };
    FamilyTree.templates.gene_male = Object.assign({}, FamilyTree.templates.gene);
    FamilyTree.templates.gene_male.node = `<rect x="0" y="0" height="{h}" width="{w}" stroke-width="1" fill=url(#gene_grad_male) stroke="#aeaeae" rx="7" ry="7"></rect>`;

    FamilyTree.templates.gene_female = Object.assign({}, FamilyTree.templates.gene);
    FamilyTree.templates.gene_female.node = `<rect x="0" y="0" height="{h}" width="{w}" stroke-width="1" fill=url(#gene_grad_female) stroke="#aeaeae" rx="7" ry="7"></rect>`;
  }

  public createFamilyTree() {
    this.familyTree = new FamilyTree(document.getElementById('tree'), {
      nodeMouseClick: FamilyTree.action.none,
      mouseScrool: FamilyTree.action.zoom,
      mode: this.themeString,
      searchFields: ["name", "born"],
      template: 'gene',
      miniMap: false,
      toolbar: {
        layout: true,
        zoom: true,
        fit: false,
        expandAll: false,
        fullScreen: false
      },
      roots: [3],
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
