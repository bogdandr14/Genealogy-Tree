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
    private router: Router,
    private translateService: TranslateService,
    @Optional()
    @SkipSelf()
    otherInstance: LocaleService,
  ) {
    if (otherInstance) throw 'LocaleService should have only one instance.';
    this.initLocale();
  }

  private setRouteReuse(reuse: ShouldReuseRoute) {
    this.router.routeReuseStrategy.shouldReuseRoute = reuse;
  }

  private subscribeToLangChange() {
    this.translateService.onLangChange.subscribe(async (event) => {
      const { shouldReuseRoute } = this.router.routeReuseStrategy;

      this.setRouteReuse(() => false);
      this.router.navigated = false;
      await this.router.navigateByUrl(this.router.url).catch(noop);
      this.setRouteReuse(shouldReuseRoute);
    });
  }

  initLocale() {
    if (this.initialized) return;
    this.subscribeToLangChange();
    this.initialized = true;
  }
}
