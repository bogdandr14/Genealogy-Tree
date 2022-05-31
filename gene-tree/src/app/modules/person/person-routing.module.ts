import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PersonDetailsPage } from './pages/person-details/person-details.page';
import { PersonEditPage } from './pages/person-edit/person-edit.page';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'details',
    pathMatch: 'full'
  },
  {
    path: 'details',
    component: PersonDetailsPage,
    data: { title: '_details.person' }
  },
  {
    path: 'details/:id',
    component: PersonDetailsPage,
    data: { title: '_details.person' }
  },
  {
    path: 'edit/:id',
    component: PersonEditPage,
    data: { title: '_edit.person' }

  },
  {
    path: 'create',
    component: PersonEditPage,
    data: { title: '_add.person' }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PersonRoutingModule { }
