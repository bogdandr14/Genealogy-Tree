import {
  Component,
  EventEmitter,
  OnInit,
  Output,
} from '@angular/core';
import { FormControl } from '@angular/forms';
import { DataService } from 'src/app/modules/core/services/data.service';

@Component({
  selector: 'app-theme-select',
  templateUrl: './theme-select.component.html',
  styleUrls: ['./theme-select.component.scss'],
})
export class ThemeSelectComponent implements OnInit {
  @Output() themeChanged = new EventEmitter<boolean>();

  public themeCtrl: FormControl;

  constructor(
    private dataService: DataService
  ) {
    this.themeCtrl = new FormControl();
  }

  ngOnInit() {
    this.initThemeSubscriber();
  }

  initThemeSubscriber(){
    this.dataService.darkTheme$.subscribe((theme) => {
      if (this.themeCtrl.value != theme) {
        this.themeCtrl.setValue(theme);
      }
    });
  }

  toggleColorTheme(theme: boolean) {
    this.dataService.setTheme(theme);
    this.themeChanged.emit(theme);
  }
}
