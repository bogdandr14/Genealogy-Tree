import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { AuthService } from '../modules/core/services/auth.service';
import { StorageService } from '../modules/core/services/storage.service';
import { UserService } from '../modules/user/services/user.service';


@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class AppComponent implements OnInit {
  dark = false;
  constructor(
    public authService: AuthService,
    private storageService: StorageService,
    private translateService: TranslateService,
    private userService: UserService
  ) {}
  ngOnInit(): void {
    this.storageService.darkTheme$.subscribe((theme) => {
      if (theme != null && this.dark != theme) {
        this.dark = theme;
      }
    });
    this.storageService.language$.subscribe((language) => {
      if(language!=null){
        this.translateService.use(language);
      }
    });
  }
}
