import { GenealogyEventsComponent } from './components/genealogy-events/genealogy-events.component';
import { GenealogyListComponent } from './components/genealogy-list/genealogy-list.component';
import { GenealogyTreeComponent } from './components/genealogy-tree/genealogy-tree.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GenealogyPage } from './page/genealogy.page';

const routes: Routes = [
  {
    path: '',
    component: GenealogyPage,
    children: [
      {
        path: 'tree',
        children: [
          {
            path: '',
            component: GenealogyTreeComponent
          },
          {
            path: ':id',
            component: GenealogyTreeComponent
          }
        ],
        data: { title: '_pages.genealogyTree' }
      },
      {
        path: 'list',
        children: [
          {
            path: '',
            component: GenealogyListComponent
          },
          {
            path: ':id',
            component: GenealogyListComponent
          }
        ],
        data: { title: '_pages.genealogyList' }
      },
      {
        path: 'events',
        children: [
          {
            path: '',
            component: GenealogyEventsComponent
          },
          {
            path: ':id',
            component: GenealogyEventsComponent
          }
        ],
        data: { title: '_pages.genealogyEvents' }
      },
      {
        path: '',
        redirectTo: '/genealogy/tree',
        pathMatch: 'full'
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class GenealogyPageRoutingModule { }
