import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CarrerasFormComponent } from './carreras-form-component';

describe('CarrerasFormFormComponent', () => {
  let component: CarrerasFormComponent;
  let fixture: ComponentFixture<CarrerasFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CarrerasFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(CarrerasFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
