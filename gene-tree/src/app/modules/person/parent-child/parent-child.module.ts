import { RouterModule } from '@angular/router';
import { ParentChildAddComponent } from './components/parent-child-add/parent-child-add.component';
import { NgModule } from '@angular/core';
import { SharedModule } from '../../shared/shared.module';
import { ParentChildListComponent } from './components/parent-child-list/parent-child-list.component';
import { ParentChildOptionCardComponent } from './components/parent-child-option-card/parent-child-option-card.component';
import { ParentChildCardComponent } from './components/parent-child-card/parent-child-card.component';
import { RemovableParentChildChipComponent } from './components/removable-parent-child-chip/removable-parent-child-chip.component';



@NgModule({
  declarations: [
    ParentChildAddComponent,
    ParentChildCardComponent,
    ParentChildListComponent,
    ParentChildOptionCardComponent,
    RemovableParentChildChipComponent
  ],
  imports: [
    SharedModule, RouterModule
  ],
  exports: [
    ParentChildAddComponent,
    ParentChildCardComponent,
    ParentChildListComponent,
    ParentChildOptionCardComponent,
    RemovableParentChildChipComponent
  ]
})
export class ParentChildModule { }
