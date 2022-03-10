import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';
import { DataService } from 'src/app/modules/core/services/data.service';
import { environment } from 'src/environments/environment';
import { LanguageModel } from '../../../core/models/language.model';

@Component({
  selector: 'app-language-select',
  templateUrl: './language-select.component.html',
  styleUrls: ['./language-select.component.scss'],
})
export class LanguageSelectComponent implements OnInit {

  public selectedLaguage: FormControl;
  public languageOptions: LanguageModel[];

  constructor(
    private dataService: DataService
  ) {
    this.selectedLaguage = new FormControl();
    this.languageOptions = environment.appSettings.languages;
  }

  ngOnInit(): void {
    this.dataService.getLanguage().subscribe((language) => {
      if (language && this.selectedLaguage.value != language) {
        this.selectedLaguage.setValue(language);
      }
      this.setLanguageSubscriber();
    });
  }

  setLanguageSubscriber() {
    this.dataService.language$.subscribe((language) => {
      if (language != null && this.selectedLaguage.value != language) {
        this.selectedLaguage.setValue(language);
      }
    });
  }

  onLanguageChange(language: string) {
    this.dataService.setLanguage(language);
  }
}
