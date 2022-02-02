import {
  Component,
  EventEmitter,
  OnInit,
  Output,
} from '@angular/core';
import { FormControl } from '@angular/forms';
import { StorageService } from 'src/app/modules/core/services/storage.service';

@Component({
  selector: 'app-theme-select',
  templateUrl: './theme-select.component.html',
  styleUrls: ['./theme-select.component.scss'],
})
export class ThemeSelectComponent implements OnInit {
  @Output() themeChanged = new EventEmitter<boolean>();

  public themeCtrl: FormControl;

  constructor(
    private storageService: StorageService
  ) {
    this.themeCtrl = new FormControl();
  }

  ngOnInit() {
    this.storageService.darkTheme$.subscribe((theme) => {
      if (this.themeCtrl.value != theme) {
        this.themeCtrl.setValue(theme);
      }
    });
  }

  toggleColorTheme(theme: boolean) {
    this.storageService.setTheme(theme);
    this.themeChanged.emit(theme);
  }
}
