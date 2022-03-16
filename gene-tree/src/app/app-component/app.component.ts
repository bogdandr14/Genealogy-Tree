import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { AuthService } from '../modules/core/services/auth.service';
import { DataService } from '../modules/core/services/data.service';
import { UserService } from '../modules/user/services/user.service';
import { Title } from '@angular/platform-browser';
import { filter, map } from 'rxjs/operators';
export const DEFAULT_TITLE = 'GeneTree';
@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class AppComponent implements OnInit {
  dark = false;
  invert = false;
  gray = false;
  highlight = false;
  fontSize = 'font-size-5';
  constructor(
    public authService: AuthService,
    private dataService: DataService,
    private translateService: TranslateService,
    private userService: UserService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private titleService: Title
  ) {
    this.loadData();
  }

  ngOnInit(): void {
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd),
      map(() => {
        let child = this.activatedRoute.firstChild;
        while (child.firstChild) {
          child = child.firstChild;
        }
        if (child.snapshot.data['title']) {
          return child.snapshot.data['title'];
        }
        return DEFAULT_TITLE;
      })
    ).subscribe((title: string) => {
      this.setDocTitle(title);
    });
  }

  setDocTitle(title: string) {
    if (title) {
      this.titleService.setTitle('GeneTree - ' + this.translateService.instant(title));
    }
    else {
      this.titleService.setTitle(DEFAULT_TITLE);
    }

  }

  //https://blog.bitsrc.io/dynamic-page-titles-in-angular-98ce20b5c334
  loadData() {
    this.translateService.use(environment.defaultLanguage);
    this.setLangSubscriber();
    this.setThemeSubscriber();
    this.setInvertSubscriber();
    this.setGraySubscriber();
    this.setLinkHighlightSubscriber();
    this.setFontSubscriber();
  }

  private setLangSubscriber() {
    this.dataService.language$.subscribe((language) => {
      if (language != null) {
        this.translateService.use(language);
        this.setDocTitle
      }
    });
  }

  private setThemeSubscriber() {
    this.dataService.darkTheme$.subscribe((dark) => {
      if (dark != null && this.dark != dark) {
        this.dark = dark;
      }
    });
  }

  private setInvertSubscriber() {
    this.dataService.invertColor$.subscribe((invert) => {
      if (invert != null && this.invert != invert) {
        this.invert = invert;
      }
    });
  }

  private setGraySubscriber() {
    this.dataService.grayscale$.subscribe((gray) => {
      if (gray != null && this.gray != gray) {
        this.gray = gray;
      }
    });
  }
  private setLinkHighlightSubscriber() {
    this.dataService.linkHighlight$.subscribe((highlight) => {
      if (highlight != null && this.highlight != highlight) {
        this.highlight = highlight;
      }
    });
  }

  private setFontSubscriber() {
    this.dataService.fontSize$.subscribe((fontSize) => {
      if (fontSize != null && this.fontSize != fontSize) {
        this.fontSize = fontSize;
      }
    });
  }
  //https://ionicframework.com/docs/v3/native/mobile-accessibility/
  //https://www.a11yproject.com/
  //https://blog.angular.io/build-more-accessible-angular-apps-1aca4fc39aff
}
