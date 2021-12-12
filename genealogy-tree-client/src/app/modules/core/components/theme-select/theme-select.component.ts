import { Component, OnInit, Renderer2 } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-theme-select',
  templateUrl: './theme-select.component.html',
  styleUrls: ['./theme-select.component.scss'],
})
export class ThemeSelectComponent implements OnInit {
  public darkTheme: boolean;
  public themeCtrl: FormControl;

  constructor(private renderer: Renderer2) {
    this.themeCtrl = new FormControl();
  }

  ngOnInit() {
    this.darkTheme = true;
    this.themeCtrl.valueChanges.subscribe((newVal) => {
      this.toggleColorTheme(newVal);
    });
    this.themeCtrl.setValue(this.darkTheme);
  }

  private toggleColorTheme(theme: boolean) {
    if (theme) {
      this.renderer.setAttribute(document.body, 'color-theme', 'dark');
    } else {
      this.renderer.setAttribute(document.body, 'color-theme', 'light');
    }
  }
}
