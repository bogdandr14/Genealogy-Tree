import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RelativeListComponent } from './components/relative-list/relative-list.component';
import { RelativeMapComponent } from './components/relative-map/relative-map.component';
import { RelativeSearchComponent } from './components/relative-search/relative-search.component';

import { RelativePage } from './page/relative.page';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: '/relative/list',
  },
  {
    path: '',
    component: RelativePage,
    children: [
      {
        path: 'list',
        component: RelativeListComponent,
        data: { title: '_pages.relatives' },
      },
      {
        path: 'search',
        component: RelativeSearchComponent,
        data: { title: '_pages.findRelatives' },
      },
      {
        path: 'location',
        component: RelativeMapComponent,
        data: { title: '_pages.location' }
      }
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class RelativePageRoutingModule { }
