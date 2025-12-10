import { Test, TestingModule } from '@nestjs/testing';
import { PeriodusService } from './periodus.service';

describe('PeriodusService', () => {
  let service: PeriodusService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PeriodusService],
    }).compile();

    service = module.get<PeriodusService>(PeriodusService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
