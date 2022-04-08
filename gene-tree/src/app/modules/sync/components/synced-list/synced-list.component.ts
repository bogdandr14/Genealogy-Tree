import { Component, OnInit } from '@angular/core';
import { SyncService } from '../../services/sync.service';

@Component({
  selector: 'app-synced-list',
  templateUrl: './synced-list.component.html',
  styleUrls: ['./synced-list.component.scss'],
})
export class SyncedListComponent implements OnInit {

  constructor(private syncService: SyncService) { }

  ngOnInit() {}

}
