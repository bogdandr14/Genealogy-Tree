import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import { DataService } from 'src/app/modules/core/services/data.service';

@Component({
  selector: 'app-theme-select',
  templateUrl: './theme-select.component.html',
  styleUrls: ['./theme-select.component.scss'],
})
export class ThemeSelectComponent implements OnInit {
  public themeCtrl: FormControl;

  constructor(private dataService: DataService) {
    this.themeCtrl = new FormControl();
  }

  ngOnInit() {
    this.dataService.darkTheme$.subscribe((theme) => {
      if (this.themeCtrl.value != theme) {
        this.themeCtrl.setValue(theme);
      }
    });
  }

  toggleColorTheme(theme: boolean) {
    this.dataService.setTheme(theme);
  }
}
