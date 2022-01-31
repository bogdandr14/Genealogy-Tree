import { Component, OnInit } from '@angular/core';
import { Platform } from '@ionic/angular';
import { TranslateService } from '@ngx-translate/core';
import { environment } from 'src/environments/environment';
import { AuthService } from '../modules/core/services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent implements OnInit {
  constructor(private platform: Platform, public authService: AuthService) {}

  ngOnInit() {
    // this.translate.use(environment.defaultLanguage);
    // this.platform.ready().then(() => {
    //   if (Capacitor.isPluginAvailable('SplashScreen')) {
    //     Plugins.SplashScreen.hide();
    //   }
    // });
  }

  // public useLanguage(language: string): void {
  //   this.translate.use(language);
  // }
}
