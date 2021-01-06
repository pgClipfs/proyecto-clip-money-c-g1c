import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListaCreditosComponent } from './lista-creditos.component';

describe('ListaCreditosComponent', () => {
  let component: ListaCreditosComponent;
  let fixture: ComponentFixture<ListaCreditosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListaCreditosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListaCreditosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
