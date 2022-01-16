/* eslint-disable no-debugger */
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { of } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  public location: string;
  constructor(
    private router : Router,
    private route: ActivatedRoute,
    public translate: TranslateService
  ) {}

  ngOnInit() {
    // let c = this.route.paramMap
    //   .pipe(
    //     switchMap((params) => {
    //       debugger;
    //       return of(params.keys);
    //     })
    //   )
    //   .subscribe((val) => {
    //     debugger;
    //     this.location = val.pop();
    //   });
    this.router.events
      .pipe(
        filter((event) => event instanceof NavigationEnd),
        map((event: NavigationEnd) => event.url)
      )
      .subscribe((url) => {
        this.location = url.split('?')[0].split('/').pop();
      });
  }
}
