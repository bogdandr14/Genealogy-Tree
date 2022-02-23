import { PersonModule } from './../person/person.module';
import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { UserRoutingModule } from './user-routing.module';
import { UserSearchComponent } from './components/user-search/user-search.component';
import { UserInfoComponent } from './components/user-info/user-info.component';

@NgModule({
  declarations: [
    UserSearchComponent,
    UserInfoComponent,
  ],
  imports: [SharedModule, UserRoutingModule, PersonModule],
  exports: [UserInfoComponent]
})
export class UserModule { }
