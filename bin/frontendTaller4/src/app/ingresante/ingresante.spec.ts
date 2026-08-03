import { TestBed } from '@angular/core/testing';

import { Ingresante } from './ingresante';

describe('Ingresante', () => {
  let service: Ingresante;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Ingresante);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
