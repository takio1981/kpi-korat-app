import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DistrictDashboard } from './district-dashboard';

describe('DistrictDashboard', () => {
  let component: DistrictDashboard;
  let fixture: ComponentFixture<DistrictDashboard>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DistrictDashboard]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DistrictDashboard);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
