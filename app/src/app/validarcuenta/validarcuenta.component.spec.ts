import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ValidarcuentaComponent } from './validarcuenta.component';

describe('ValidarcuentaComponent', () => {
  let component: ValidarcuentaComponent;
  let fixture: ComponentFixture<ValidarcuentaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ValidarcuentaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ValidarcuentaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
