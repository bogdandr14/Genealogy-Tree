import {
  Component,
  EventEmitter,
  OnInit,
  Output,
  Renderer2,
} from '@angular/core';
import { FormControl } from '@angular/forms';
import { Subscription } from 'rxjs';
import { UserService } from 'src/app/modules/core/services/user.service';

@Component({
  selector: 'app-theme-select',
  templateUrl: './theme-select.component.html',
  styleUrls: ['./theme-select.component.scss'],
})
export class ThemeSelectComponent implements OnInit {
  @Output() themeChanged = new EventEmitter<boolean>();

  public themeCtrl: FormControl;

  constructor(private renderer: Renderer2, private userService: UserService) {
    this.themeCtrl = new FormControl();
  }

  ngOnInit() {
    this.themeCtrl.valueChanges.subscribe((newVal) => {
      this.toggleColorTheme(newVal);
    });
    this.userService
      .getUserSettings(JSON.parse(sessionStorage.getItem('user')).username)
      .subscribe((settings) => {
        this.themeCtrl.setValue(settings.themePreference);
      });
    if (document.body.getAttribute('color-theme') == 'dark') {
      this.themeCtrl.setValue(true);
    }
  }

  private toggleColorTheme(theme: boolean) {
    if (theme) {
      this.renderer.setAttribute(document.body, 'color-theme', 'dark');
    } else {
      this.renderer.setAttribute(document.body, 'color-theme', 'light');
    }
    this.themeChanged.emit(theme);
  }
}
