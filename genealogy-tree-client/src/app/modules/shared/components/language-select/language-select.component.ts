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
import { UserService } from 'src/app/modules/core/services/user.service';
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

  constructor(
    private translateService: TranslateService,
    private userService: UserService
  ) {
    this.selectedLaguage = new FormControl();
    this.languageOptions = environment.appSettings.languages;
  }

  ngOnInit(): void {
    this.currentLanguage = this.translateService.currentLang;


    this.subscriptions.push(
      this.selectedLaguage.valueChanges.subscribe({
        next: (newVal) => {
          this.languageChanged.emit(newVal);
          this.translateService.use(newVal);
        },
      })
    );
    this.selectedLaguage.setValue(this.currentLanguage);
    this.userService
      .getUserSettings(JSON.parse(sessionStorage.getItem('user')).username)
      .subscribe((settings) => {
        this.selectedLaguage.setValue(settings.languagePreference);
      });
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((s) => s.unsubscribe());
  }
}
