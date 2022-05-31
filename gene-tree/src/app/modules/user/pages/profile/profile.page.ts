import { RelativeService } from './../../../relative/services/relative.service';
import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/modules/user/service/user.service';
import { AccountProfileModel } from '../../models/profile.model';
import { switchMap, take, tap } from 'rxjs/operators';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Guid } from 'guid-typescript';
import { iif, Observable } from 'rxjs';
import { DataService } from '../../../core/services/data.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  public personalInfo: AccountProfileModel;
  public canSync = false;
  constructor(
    private route: ActivatedRoute,
    private userService: UserService,
    private relativeService: RelativeService,
    private dataService: DataService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .pipe(
        switchMap((params) => {
          return iif<AccountProfileModel, AccountProfileModel>(
            () => !!params.get('id'),
            this.getUserInfo(params),
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

  getUserInfo(params: ParamMap): Observable<AccountProfileModel> {
    const relativeId = this.getGuid(params.get('id'));
    if (!relativeId.equals(Guid.createEmpty()) && !this.userService.isCurrentUser(relativeId)) {
      this.relativeService
        .canAddRelative(relativeId)
        .pipe(
          tap((canAdd) => (this.canSync = canAdd)),
          take(1)
        )
        .subscribe();
    }
    return this.userService.getUser(relativeId);
  }

  getGuid(id) {
    return id ? Guid.parse(id) : Guid.createEmpty();
  }

  get isCurrentUser() {
    return this.userService.isCurrentUser(this.personalInfo?.userId);
  }

  get isRelative() {
    return false;
  }
}
