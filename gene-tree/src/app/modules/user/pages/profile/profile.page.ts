import { RelativeStateEnum } from './../../../relative/models/relative-state.enum';
import { RelativeService } from './../../../relative/services/relative.service';
import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../user/service/user.service';
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
  private relativeState: RelativeStateEnum;
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
        .CheckForRelative(relativeId)
        .pipe(
          tap((relativeState) => (this.relativeState = relativeState)),
          take(1)
        )
        .subscribe();
    }
    return this.userService.getUser(relativeId);
  }

  public requestSent(){
    this.relativeState = RelativeStateEnum.Requested;
  }
  getGuid(id) {
    return id ? Guid.parse(id) : Guid.createEmpty();
  }

  get canSync(){
    return this.relativeState === RelativeStateEnum.Unrelated;
  }
  get isCurrentUser() {
    return this.userService.isCurrentUser(this.personalInfo?.userId);
  }

  get isRelative() {
    return this.relativeState === RelativeStateEnum.Related;
  }
}
