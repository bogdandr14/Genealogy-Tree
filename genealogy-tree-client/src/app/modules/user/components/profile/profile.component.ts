import { Component, OnInit, ViewChild } from '@angular/core';
import { IonAccordionGroup } from '@ionic/angular';
import { Clipboard } from '@ionic-native/clipboard/ngx';
import { AlertService } from 'src/app/modules/core/services/alert.service';
import { UserService } from 'src/app/modules/core/services/user.service';
import { UserModel } from 'src/app/modules/core/models/user.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent implements OnInit {
  @ViewChild(IonAccordionGroup, { static: true })
  accordionGroup: IonAccordionGroup;
  personalInfo: UserModel;
  constructor(private clipboard: Clipboard, private alertService: AlertService, private userService: UserService) {}

  // Copy
  ngOnInit() {
    this.userService.user$.subscribe((user)=>{
       this.userService.getOneById<UserModel>(user.id).subscribe((res)=> {
        this.personalInfo = res;
       });
    });
  }

  copyInfo(info: string) {
    this.clipboard.copy(info);
    this.alertService.showInfo("Text copied to clipboard");
  }
}
