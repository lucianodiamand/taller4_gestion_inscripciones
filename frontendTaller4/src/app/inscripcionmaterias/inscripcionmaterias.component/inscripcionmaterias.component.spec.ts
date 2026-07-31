import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscripcionmateriasComponent } from './inscripcionmaterias.component';

describe('InscripcionmateriasComponent', () => {
  let component: InscripcionmateriasComponent;
  let fixture: ComponentFixture<InscripcionmateriasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InscripcionmateriasComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(InscripcionmateriasComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
