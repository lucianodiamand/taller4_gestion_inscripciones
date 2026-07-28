import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresanteFormComponent } from './ingresante-form-component';

describe('IngresanteFormComponent', () => {
  let component: IngresanteFormComponent;
  let fixture: ComponentFixture<IngresanteFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [IngresanteFormComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(IngresanteFormComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
