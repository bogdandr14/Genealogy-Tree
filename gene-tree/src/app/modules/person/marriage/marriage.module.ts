import { ParentChildModule } from './../parent-child/parent-child.module';
import { MarriageEditComponent } from './components/marriage-edit/marriage-edit.component';
import { NgModule } from '@angular/core';
import { SharedModule } from '../../shared/shared.module';
import { MarriageAddComponent } from './components/marriage-add/marriage-add.component';
import { MarriageCardComponent } from './components/marriage-card/marriage-card.component';
import { MarriageListComponent } from './components/marriage-list/marriage-list.component';
import { RouterModule } from '@angular/router';



@NgModule({
  declarations: [MarriageAddComponent,
    MarriageCardComponent,
    MarriageEditComponent,
    MarriageListComponent
  ],
  imports: [
    SharedModule, RouterModule, ParentChildModule
  ],
  exports: [MarriageAddComponent,
    MarriageCardComponent,
    MarriageEditComponent,
    MarriageListComponent
  ]
})
export class MarriageModule { }
