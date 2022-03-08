import { DataService } from 'src/app/modules/core/services/data.service';
import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import Swiper from 'swiper';
import { Router } from '@angular/router';
import { MenuController } from '@ionic/angular';

@Component({
  selector: 'app-intro',
  templateUrl: './intro.page.html',
  styleUrls: ['./intro.page.scss'],
})
export class IntroPage implements OnInit {
  showSkip = true;
  private slides: Swiper;
  constructor(
    public menu: MenuController,
    public router: Router,
    public dataService: DataService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {}

  next() {
    this.slides.slideNext();
  }

  startApp() {
    this.router
      .navigate(['/user/login'])
      .then(() => this.dataService.set('ion_did_tutorial', true));
  }

  setSwiperInstance(swiper: Swiper) {
    this.slides = swiper;
  }

  onSlideChangeStart() {
    this.showSkip = !this.slides.isEnd;
    this.cd.detectChanges();
  }

  ionViewWillEnter() {
    this.menu.enable(false);
  }

  ionViewDidLeave() {
    // enable the root left menu when leaving the tutorial page
    this.menu.enable(true);
  }
}
