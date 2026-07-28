import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresanteComponent } from './ingresante.component';

describe('Ingresante', () => {
  let component: IngresanteComponent;
  let fixture: ComponentFixture<IngresanteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [IngresanteComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(IngresanteComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
