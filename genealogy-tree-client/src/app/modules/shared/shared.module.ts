import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HoverClassDirective } from './directives/hover-class.directive';
import { PaginatorComponent } from './components/paginator/paginator.component';
import { IonicModule } from '@ionic/angular';
import { TranslateModule } from '@ngx-translate/core';
import { ThemeSelectComponent } from './components/theme-select/theme-select.component';
import { LanguageSelectComponent } from './components/language-select/language-select.component';

@NgModule({
  declarations: [
    HoverClassDirective,
    PaginatorComponent,
    ThemeSelectComponent,
    LanguageSelectComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    TranslateModule,
    IonicModule,
  ],
  exports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    TranslateModule,
    IonicModule,
    HoverClassDirective,
    PaginatorComponent,
    ThemeSelectComponent,
    LanguageSelectComponent
  ],
})
export class SharedModule {}
