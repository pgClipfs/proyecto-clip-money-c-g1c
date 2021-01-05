import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresardineroComponent } from './ingresardinero.component';

describe('IngresardineroComponent', () => {
  let component: IngresardineroComponent;
  let fixture: ComponentFixture<IngresardineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IngresardineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IngresardineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
