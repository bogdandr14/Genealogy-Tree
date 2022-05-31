import { GenericPersonModel } from './../../../person/models/generic-person.model';
import { DataService } from './../../../core/services/data.service';
import { Component, OnInit } from '@angular/core';
import { RelativeService } from '../../services/relative.service';
import { take } from 'rxjs/operators';

@Component({
  selector: 'app-relative-list',
  templateUrl: './relative-list.component.html',
  styleUrls: ['./relative-list.component.scss'],
})
export class RelativeListComponent implements OnInit {

  public relativesList: GenericPersonModel[];
  constructor(private relativeService: RelativeService, private dataService: DataService) { }

  ngOnInit() {
    this.relativeService.getRelatives().pipe(take(1)).subscribe((relatives) => {
      this.relativesList = relatives;
    })
  }
}
