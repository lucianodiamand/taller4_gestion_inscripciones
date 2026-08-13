import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscripcionMateriaFormComponent } from './inscripcionmaterias-form-component';

describe('InscripcionmateriasFormComponent', () => {
  let component: InscripcionMateriaFormComponent;
  let fixture: ComponentFixture<InscripcionMateriaFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InscripcionMateriaFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(InscripcionMateriaFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
