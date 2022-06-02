import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { RelativeUpdatesNotificationComponent } from './relative-updates-notification.component';

describe('RelativeUpdatesNotificationComponent', () => {
  let component: RelativeUpdatesNotificationComponent;
  let fixture: ComponentFixture<RelativeUpdatesNotificationComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ RelativeUpdatesNotificationComponent ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(RelativeUpdatesNotificationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
