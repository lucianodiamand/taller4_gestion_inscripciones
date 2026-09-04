import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MateriasAprobadas } from './materias-aprobadas';

describe('MateriasAprobadas', () => {
  let component: MateriasAprobadas;
  let fixture: ComponentFixture<MateriasAprobadas>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MateriasAprobadas],
    }).compileComponents();

    fixture = TestBed.createComponent(MateriasAprobadas);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
