import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/modules/user/service/user.service';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AccountProfileModel } from '../../models/profile.model';
import { switchMap, take } from 'rxjs/operators';
import { ActivatedRoute } from '@angular/router';
import { Guid } from 'guid-typescript';
import { iif } from 'rxjs';
import { DataService } from 'src/app/modules/core/services/data.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  public personalInfo: AccountProfileModel;

  constructor(
    private route: ActivatedRoute,
    private userService: UserService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .pipe(
        switchMap((params) => {
          return iif<AccountProfileModel, AccountProfileModel>(
            () => !!params.get('id'),
            this.userService.getUser(this.getGuid(params.get('id'))),
            this.dataService
              .getCurrentUser()
              .pipe(switchMap(() => this.userService.getPersonalInfo()))
          );
        }),
        take(1)
      )
      .subscribe((res) => {
        this.personalInfo = res;
      });
  }

  getGuid(id) {
    return id ? Guid.parse(id) : Guid.createEmpty();
  }

  get isCurrentUser() {
    return this.userService.isCurrentUser(this.personalInfo?.userId);
  }
}
