import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { AuthService } from '../modules/core/services/auth.service';
import { DataService } from '../modules/core/services/data.service';
import { Title } from '@angular/platform-browser';
import { filter, map, tap } from 'rxjs/operators';
import { combineLatest } from 'rxjs';
import { LocaleService } from '../modules/core/services/locale.service';
export const DEFAULT_TITLE = 'GeneTree';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class AppComponent implements OnInit {
  fontSize = 'font-size-5';
  constructor(
    public authService: AuthService,
    public dataService: DataService,
    private translateService: TranslateService,
    private localeService: LocaleService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private titleService: Title
  ) {
    this.loadData();
  }

  ngOnInit(): void {
    const routeObs = this.router.events.pipe(
      filter((event) => event instanceof NavigationEnd),
      map(() => {
        let child = this.activatedRoute.firstChild;
        if (child) {
          while (child.firstChild) {
            child = child.firstChild;
          }
          if (child.snapshot.data['title']) {
            return child.snapshot.data['title'];
          }
        }
        return DEFAULT_TITLE;
      })
    );
    combineLatest([routeObs, this.translateService.onLangChange]).pipe(tap(([title, langChange]) => {
      if (langChange.lang != null) {
        this.setDocTitle(title);
      }
    })).subscribe()
  }

  setDocTitle(title: string) {
    this.titleService.setTitle(this.translateService.instant(title));
  }

  private loadData() {
    this.translateService.use(environment.defaultLanguage);
    this.localeService.initLocale();
    this.dataService.language$.subscribe((language) => {
      this.translateService.use(language);

    });
  }
}
