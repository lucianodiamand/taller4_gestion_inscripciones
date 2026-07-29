import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MateriaFormComponent } from './materia-form-component';

describe('MateriaFormComponent', () => {
  let component: MateriaFormComponent;
  let fixture: ComponentFixture<MateriaFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MateriaFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(MateriaFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
