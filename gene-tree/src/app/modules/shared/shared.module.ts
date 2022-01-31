import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HoverClassDirective } from './directives/hover-class.directive';
import { PaginatorComponent } from './components/paginator/paginator.component';
import { IonicModule } from '@ionic/angular';
import { DeleteConfirmationComponent } from './components/delete-confirmation/delete-confirmation.component';
import { TranslateModule } from '@ngx-translate/core';
import { LanguageSelectComponent } from './components/language-select/language-select.component';
import { ThemeSelectComponent } from './components/theme-select/theme-select.component';
import { InputTemplateComponent } from './components/input-template/input-template.component';
import { ValidationErrorsComponent } from './components/validation-errors/validation-errors.component';

@NgModule({
  declarations: [
    HoverClassDirective,
    PaginatorComponent,
    ThemeSelectComponent,
    LanguageSelectComponent,
    DeleteConfirmationComponent,
    InputTemplateComponent,
    ValidationErrorsComponent
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
    LanguageSelectComponent,
    DeleteConfirmationComponent,
    InputTemplateComponent,
    ValidationErrorsComponent
  ],
})
export class SharedModule {}
