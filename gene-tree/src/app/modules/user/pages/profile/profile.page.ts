import { LoadingService } from './../../../core/services/loading.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { UserService } from 'src/app/modules/user/services/user.service';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AccountProfileModel } from '../../models/profile.model';
import { first, switchMap } from 'rxjs/operators';
import { ActivatedRoute } from '@angular/router';
import { Guid } from 'guid-typescript';
import { Observable } from 'rxjs';
import { DataService } from 'src/app/modules/core/services/data.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  public userId: any;
  personalInfo: AccountProfileModel;
  private personalInfo$: Observable<AccountProfileModel>;

  constructor(private route: ActivatedRoute, private userService: UserService, private dataService: DataService, private loadingService: LoadingService) { }

  async ngOnInit() {
    this.dataService.getCurrentUser().subscribe((currentUser) => {
      this.personalInfo$ = this.route.paramMap.pipe(
        switchMap((params) => {
          const userId = (params.get('id'));
          if (userId) {
            this.userId = Guid.parse(userId);
            return this.userService.getUser<AccountProfileModel>(this.userId);
          } else {
            return this.userService.getPersonalInfo<AccountProfileModel>();
          }
        })
      );
      this.personalInfo$.pipe(first()).subscribe((res) => {
        this.personalInfo = res;
      })
    });
  }

  get isCurrentUser() {
    return this.userService.isCurrentUser(this.personalInfo?.userId);
  }
}
