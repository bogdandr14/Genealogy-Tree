import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-accessibility-settings',
  templateUrl: './accessibility-settings.component.html',
  styleUrls: ['./accessibility-settings.component.scss'],
})
export class AccessibilitySettingsComponent implements OnInit {

  public darkCtrl: FormControl;
  public invertCtrl: FormControl;
  public grayCtrl: FormControl;
  public highlightCtrl: FormControl;
  public fontSizeCtrl: FormControl;

  constructor(private dataService: DataService) {
    this.darkCtrl = new FormControl();
    this.invertCtrl = new FormControl();
    this.grayCtrl = new FormControl();
    this.highlightCtrl = new FormControl();
    this.fontSizeCtrl = new FormControl();
  }

  ngOnInit() {
    this.dataService.darkTheme$.subscribe((theme) => {
      if (this.darkCtrl.value != theme) {
        this.darkCtrl.setValue(theme);
      }
    });
  }

  toggleDarkTheme(darkTheme: boolean) {
    this.dataService.setTheme(darkTheme);
  }

  toggleInvertColor(invertColor: boolean) {
    this.dataService.setInvert(invertColor);
  }

  toggleGrayscale(grayscale: boolean) {
    this.dataService.setGrayscale(grayscale);
  }

  toggleLinkHighlight(highlight: boolean) {
    this.dataService.setLinkHighlight(highlight);
  }

  toggleFontSize(fontSize: any) {
    const size = fontSize.detail.value;
    this.dataService.setFontSize(`font-size-${size}`);
  }
}
