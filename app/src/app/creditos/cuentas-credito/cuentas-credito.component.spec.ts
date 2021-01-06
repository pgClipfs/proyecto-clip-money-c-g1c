import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CuentasCreditoComponent } from './cuentas-credito.component';

describe('CuentasCreditoComponent', () => {
  let component: CuentasCreditoComponent;
  let fixture: ComponentFixture<CuentasCreditoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CuentasCreditoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CuentasCreditoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
