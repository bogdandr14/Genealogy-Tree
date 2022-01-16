import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PersonDetailComponent } from './components/person-detail/person-detail.component';
import { PersonEditComponent } from './components/person-edit/person-edit.component';


const routes: Routes = [
  {
    path: '',
    redirectTo: 'details',
    pathMatch:'full'
  },
  {
    path: 'details',
    component: PersonDetailComponent,
  },
  {
    path: 'details/:id',
    component: PersonDetailComponent,
  },
  {
    path: 'edit/:id',
    component: PersonEditComponent,
  },
  {
    path: 'create',
    component: PersonEditComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PersonRoutingModule {}
