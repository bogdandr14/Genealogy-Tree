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
  dark = false;

  constructor(
    public menu: MenuController,
    public router: Router,
    public dataService: DataService,
    private cd: ChangeDetectorRef
  ) {    this.setThemeSubscriber();
  }

  ngOnInit() {}
  private setThemeSubscriber() {
    this.dataService.darkTheme$.subscribe((theme) => {
      if (theme != null && this.dark != theme) {
        this.dark = theme;
      }
    });
  }
  next() {
    this.slides.slideNext();
  }

  startApp() {
    this.router
      .navigate(['/home'])
      .then(() => this.dataService.set('has-seen-intro', true));
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
    this.slides.slideTo(0);
  }


  ionViewDidLeave() {
    // enable the root left menu when leaving the tutorial page
    this.menu.enable(true);
  }
}
