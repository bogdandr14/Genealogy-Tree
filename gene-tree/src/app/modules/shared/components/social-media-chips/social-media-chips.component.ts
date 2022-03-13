import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-social-media-chips',
  templateUrl: './social-media-chips.component.html',
  styleUrls: ['./social-media-chips.component.scss'],
})
export class SocialMediaChipsComponent implements OnInit {
  constructor(private inAppBrowser: InAppBrowser) {}

  ngOnInit() {}
  openExternalUrl(url: string) {
    this.inAppBrowser.create(url, '_blank');
  }
}
