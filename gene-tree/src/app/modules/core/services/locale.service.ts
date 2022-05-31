import { Injectable, Optional, SkipSelf } from '@angular/core';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { noop } from 'rxjs';
import { environment } from 'src/environments/environment';
import localeRo from '@angular/common/locales/ro';
import localeEn from '@angular/common/locales/en-GB';
import { registerLocaleData } from '@angular/common';
registerLocaleData(localeRo, 'ro');
registerLocaleData(localeEn, 'en');


type ShouldReuseRoute = (future: ActivatedRouteSnapshot, curr: ActivatedRouteSnapshot) => boolean;

@Injectable({
  providedIn: 'root',
})
export class LocaleService {
  private initialized = false;
  private readonly languages = environment.appSettings.languages;

  get currentLocale(): string {
    const locale = this.languages.find(lang => lang.languageKey == (this.translateService.currentLang ?? environment.defaultLanguage));
    return locale.languageKey;
  }

  constructor(
    private translateService: TranslateService,
    @Optional()
    @SkipSelf()
    otherInstance: LocaleService,
  ) {
    if (otherInstance) throw 'LocaleService should have only one instance.';
    this.initLocale();
  }

  initLocale() {
    if (this.initialized) return;
    this.initialized = true;
  }
}
