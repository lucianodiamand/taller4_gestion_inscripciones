import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscripcioncarrerasFormComponent } from './inscripcioncarreras-form-component';

describe('InscripcioncarrerasFormComponent', () => {
  let component: InscripcioncarrerasFormComponent;
  let fixture: ComponentFixture<InscripcioncarrerasFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InscripcioncarrerasFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(InscripcioncarrerasFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
