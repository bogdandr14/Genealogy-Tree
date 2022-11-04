import { DataService } from 'src/app/modules/core/services/data.service';
import { UserService } from '../user/service/user.service';
import { Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { SupportTicketModel } from './models/support-ticket.model';
import { AuthService } from '../core/services/auth.service';
import { SupportTypeEnum } from './models/support-type.enum';
import { filter, switchMap, take, tap } from 'rxjs/operators';
import { AlertService } from '../core/services/alert.service';

@Component({
  selector: 'app-support',
  templateUrl: './support.page.html',
  styleUrls: ['./support.page.scss'],
})
export class SupportPage implements OnInit, AfterViewInit {
  @ViewChild('form') form: NgForm;
  supportForm = new SupportTicketModel();
  supportTypes = Object.values(SupportTypeEnum);

  constructor(
    public authService: AuthService,
    private userService: UserService,
    private alertService: AlertService,
    private dataService: DataService
  ) { }

  ngOnInit(): void {
    this.authService.isLoggedIn$.pipe(filter((isLoggedIn) => isLoggedIn), take(1)).subscribe(() =>
      this.supportForm.emailContact = this.userService.getUserEmail()
    );
  }

  ngAfterViewInit(): void {
    setTimeout(() => {
      this.alertService.showWarning('_message._warning.languageForSupport');
    }, 1000)
  }

  submit() {
    this.dataService.getLanguage().pipe(
      tap(lang => this.supportForm.language = lang),
      switchMap(() => this.userService.sendSupportTicket(this.supportForm)),
      take(1),
      tap(() => {
        this.alertService.showInfo('_message._information.supportRequestSent');
        this.supportForm = new SupportTicketModel();
        this.form.form.markAsPristine();
      }
      )).subscribe();

  }
}
