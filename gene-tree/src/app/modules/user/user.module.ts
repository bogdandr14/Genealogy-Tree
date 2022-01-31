import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../shared/shared.module';
import { UserRoutingModule } from './user-routing.module';
import { UserSearchComponent } from './components/user-search/user-search.component';

@NgModule({
  declarations: [
    UserSearchComponent,
    UserSearchComponent,
  ],
  imports: [SharedModule, UserRoutingModule],
})
export class UserModule {}
