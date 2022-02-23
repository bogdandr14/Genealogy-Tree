import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PersonDetailsPage } from './pages/person-details/person-details.page';
import { PersonEditPage } from './pages/person-edit/person-edit.page';
import { RelativesListPage } from './pages/relatives-list/relatives-list.page';


const routes: Routes = [
  {
    path: '',
    redirectTo: 'details',
    pathMatch:'full'
  },
  {
    path: 'details',
    component: PersonDetailsPage,
  },
  {
    path: 'details/:id',
    component: PersonDetailsPage,
  },
  {
    path: 'edit/:id',
    component: PersonEditPage,
  },
  {
    path: 'create',
    component: PersonEditPage,
  },
  {
    path: 'list',
    component: RelativesListPage
  },
  {
    path: 'list/:id',
    component: RelativesListPage
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PersonRoutingModule {}
