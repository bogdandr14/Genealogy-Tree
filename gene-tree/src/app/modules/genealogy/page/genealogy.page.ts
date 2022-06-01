import { TreeService } from './../service/tree.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Guid } from 'guid-typescript';
import { tap } from 'rxjs/operators';

@Component({
  selector: 'app-genealogy',
  templateUrl: './genealogy.page.html',
  styleUrls: ['./genealogy.page.scss'],
})
export class GenealogyPage implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private treeService: TreeService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .pipe(
        tap((params) => {
          if (params.get('id')) {
            this.treeService.treeId = params.get('id');
          }
        })
      )
      .subscribe();
  }
  get treeId() {
    return this.treeService.treeId;
  }
}
