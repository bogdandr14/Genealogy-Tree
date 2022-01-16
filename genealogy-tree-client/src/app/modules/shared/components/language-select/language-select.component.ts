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
import { environment } from 'src/environments/environment';
import { LanguageModel } from '../../../core/models/language.model';

@Component({
  selector: 'app-language-select',
  templateUrl: './language-select.component.html',
  styleUrls: ['./language-select.component.scss'],
})
export class LanguageSelectComponent implements OnInit, OnDestroy {
  @Output() languageChanged = new EventEmitter<string>();

  public currentLanguage: string = '';
  public selectedLaguage: FormControl;
  public languageOptions: LanguageModel[];
  private subscriptions: Subscription[] = [];

  constructor(private translateService: TranslateService) {
    this.selectedLaguage = new FormControl();
    this.languageOptions = environment.appSettings.languages;
  }

  ngOnInit(): void {
    this.currentLanguage =
      this.translateService.currentLang || this.translateService.defaultLang;

    this.selectedLaguage.setValue(this.currentLanguage);

    this.subscriptions.push(
      this.selectedLaguage.valueChanges.subscribe({
        next: (newVal) => {
          this.languageChanged.emit(newVal);
          this.translateService.use(newVal);
        },
      })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((s) => s.unsubscribe());
  }
}
