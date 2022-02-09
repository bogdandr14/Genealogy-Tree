import { TestBed } from '@angular/core/testing';

import { RelativesService } from './relatives.service';

describe('RelativesService', () => {
  let service: RelativesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RelativesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
