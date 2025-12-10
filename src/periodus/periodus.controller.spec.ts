import { Test, TestingModule } from '@nestjs/testing';
import { PeriodusController } from './periodus.controller';

describe('PeriodusController', () => {
  let controller: PeriodusController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PeriodusController],
    }).compile();

    controller = module.get<PeriodusController>(PeriodusController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
