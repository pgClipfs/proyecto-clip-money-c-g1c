import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GirarDescubiertoComponent } from './girar-descubierto.component';

describe('GirarDescubiertoComponent', () => {
  let component: GirarDescubiertoComponent;
  let fixture: ComponentFixture<GirarDescubiertoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GirarDescubiertoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GirarDescubiertoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
