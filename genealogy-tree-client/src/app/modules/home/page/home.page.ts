import { Component } from '@angular/core';
import { NotificationService } from '../../core/services/notification.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private notifyService : NotificationService) {}
  showToasterSuccess(){
    this.notifyService.showSuccess("Data shown successfully !!")
}

showToasterError(){
    this.notifyService.showError("Something is wrong")
}

showToasterInfo(){
    this.notifyService.showInfo("This is info" )
}

showToasterWarning(){
    this.notifyService.showWarning("This is warning")
}
}
