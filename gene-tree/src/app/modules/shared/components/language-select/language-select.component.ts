/* eslint-disable no-debugger */
import {
  Component,
  EventEmitter,
  OnDestroy,
  OnInit,
  Output,
} from '@angular/core';
import { FormControl } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';
import { Subscription } from 'rxjs';
import { StorageService } from 'src/app/modules/core/services/storage.service';
import { UserService } from 'src/app/modules/user/services/user.service';
import { environment } from 'src/environments/environment';
import { LanguageModel } from '../../../core/models/language.model';

@Component({
  selector: 'app-language-select',
  templateUrl: './language-select.component.html',
  styleUrls: ['./language-select.component.scss'],
})
export class LanguageSelectComponent implements OnInit {
  @Output() languageChanged = new EventEmitter<string>();

  public selectedLaguage: FormControl;
  public languageOptions: LanguageModel[];

  constructor(
    private translateService: TranslateService,
    private storageService: StorageService
  ) {
    this.selectedLaguage = new FormControl();
    this.languageOptions = environment.appSettings.languages;
  }

  ngOnInit(): void {
    this.selectedLaguage.setValue(this.translateService.currentLang);
    this.storageService.language$.subscribe((language) => {
      if (this.selectedLaguage.value != language) {
        this.selectedLaguage.setValue(language);
      }
    });
  }
  onLanguageChange(language: string) {
    this.storageService.setLanguage(language);
    this.languageChanged.emit(language);
  }
}
