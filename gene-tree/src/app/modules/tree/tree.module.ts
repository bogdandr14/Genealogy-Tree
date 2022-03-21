import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { TreePageRoutingModule } from './tree-routing.module';

import { TreePage } from './tree.page';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    TreePageRoutingModule,
    SharedModule
  ],
  declarations: [TreePage]
})
export class TreePageModule {}
