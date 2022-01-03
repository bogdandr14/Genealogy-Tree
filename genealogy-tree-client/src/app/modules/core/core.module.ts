import { LoadingSpinnerComponent } from './components/loading-spinner/loading-spinner.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { LanguageSelectComponent } from './components/language-select/language-select.component';
import { AuthInterceptor } from './interceptors/auth.interceptor';
import {
  HttpClient,
  HttpClientModule,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { ErrorHandler, NgModule, Optional, SkipSelf } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import {
  TranslateCompiler,
  TranslateLoader,
  TranslateModule,
} from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { environment } from 'src/environments/environment';
import { AppErrorHandler } from './app-error-handler';
import { AppHttpInterceptor } from './interceptors/http.interceptor';
import { LoadingInterceptor } from './interceptors/loading-interceptor';
import { TranslateMessageFormatCompiler } from 'ngx-translate-messageformat-compiler';
import { RouterModule } from '@angular/router';
import { SharedModule } from '../shared/shared.module';
import { MenuComponent } from './components/menu/menu.component';
import { HeaderComponent } from './components/header/header.component';
import { ThemeSelectComponent } from './components/theme-select/theme-select.component';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// AoT requires an exported function for factories
export function createTranslateLoader(httpClient: HttpClient): TranslateLoader {
  return new TranslateHttpLoader(httpClient, 'assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    NavigationComponent,
    LanguageSelectComponent,
    LoadingSpinnerComponent,
    HeaderComponent,
    MenuComponent,
    ThemeSelectComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    BrowserAnimationsModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: createTranslateLoader,
        deps: [HttpClient],
      },
      compiler: {
        provide: TranslateCompiler,
        useClass: TranslateMessageFormatCompiler,
      },
      defaultLanguage: environment.defaultLanguage,
      useDefaultLang: true,
    }),
    ToastrModule.forRoot(
      {
        timeOut: 4000,
        positionClass: 'toast-bottom-center',
        easeTime: 250,
        enableHtml: true,
        closeButton: true,
      }
    ),
    SharedModule,
    RouterModule,
  ],
  exports: [
    TranslateModule,
    ReactiveFormsModule,
    NavigationComponent,
    LanguageSelectComponent,
    LoadingSpinnerComponent,
    HeaderComponent,
    MenuComponent,
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AppHttpInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: LoadingInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
    { provide: ErrorHandler, useClass: AppErrorHandler },
  ],
})
export class CoreModule {
  constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error(
        'CoreModule is already loaded. Import it in the AppModule only'
      );
    }
  }
}
