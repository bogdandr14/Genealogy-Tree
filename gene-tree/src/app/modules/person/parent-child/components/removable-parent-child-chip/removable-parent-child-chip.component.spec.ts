import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { RemovableParentChildChipComponent } from './removable-parent-child-chip.component';

describe('RemovableParentChildChipComponent', () => {
  let component: RemovableParentChildChipComponent;
  let fixture: ComponentFixture<RemovableParentChildChipComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ RemovableParentChildChipComponent ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(RemovableParentChildChipComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
