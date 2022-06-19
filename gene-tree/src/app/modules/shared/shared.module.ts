import { PersonCardComponent } from './components/person-card/person-card.component';
import { PersonRefSelectionComponent } from './components/person-ref-selection/person-ref-selection.component';
import { RelativeRequestComponent } from './components/relative-request/relative-request.component';
import { SocialMediaChipsComponent } from './components/social-media-chips/social-media-chips.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule, DatePipe, registerLocaleData } from '@angular/common';
import { HoverClassDirective } from './directives/hover-class.directive';
import { PaginatorComponent } from './components/paginator/paginator.component';
import { IonicModule } from '@ionic/angular';
import { TranslateModule } from '@ngx-translate/core';
import { LanguageSelectComponent } from './components/language-select/language-select.component';
import { InputTemplateComponent } from './components/input-template/input-template.component';
import { ValidationErrorsComponent } from './components/validation-errors/validation-errors.component';
import { SelectTemplateComponent } from './components/select-template/select-template.component';
import { LinkUserButtonsComponent } from './components/link-user-buttons/link-user-buttons.component';
import { RouterModule } from '@angular/router';
import { DateSelectTemplateComponent } from './components/date-select-template/date-select-template.component';
import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';
@NgModule({
  declarations: [
    HoverClassDirective,
    PaginatorComponent,
    LanguageSelectComponent,
    InputTemplateComponent,
    SelectTemplateComponent,
    ValidationErrorsComponent,
    LinkUserButtonsComponent,
    DateSelectTemplateComponent,
    SocialMediaChipsComponent,
    RelativeRequestComponent,
    PersonRefSelectionComponent,
    PersonCardComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    TranslateModule,
    IonicModule,
    RouterModule,
  ],
  exports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    TranslateModule,
    IonicModule,
    HoverClassDirective,
    PaginatorComponent,
    LanguageSelectComponent,
    InputTemplateComponent,
    SelectTemplateComponent,
    ValidationErrorsComponent,
    LinkUserButtonsComponent,
    DateSelectTemplateComponent,
    SocialMediaChipsComponent,
    RelativeRequestComponent,
    PersonRefSelectionComponent,
    PersonCardComponent
  ],
  providers: [InAppBrowser, DatePipe],
})
export class SharedModule { }
