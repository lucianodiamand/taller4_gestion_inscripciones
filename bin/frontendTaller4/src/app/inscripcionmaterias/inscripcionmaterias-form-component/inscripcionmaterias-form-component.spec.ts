import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscripcionmateriasFormComponent } from './inscripcionmaterias-form-component';

describe('InscripcionmateriasFormComponent', () => {
  let component: InscripcionmateriasFormComponent;
  let fixture: ComponentFixture<InscripcionmateriasFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InscripcionmateriasFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(InscripcionmateriasFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
