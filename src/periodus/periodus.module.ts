import { Module } from '@nestjs/common';
import { PeriodusController } from './periodus.controller';
import { PeriodusService } from './periodus.service';
import { APP_GUARD } from '@nestjs/core';
import { RolesGuard } from 'src/auth/guards/Roles.guard';
import { AuthGuard } from 'src/auth/guards/auth.guard';

@Module({
  controllers: [PeriodusController],
  providers: [
    PeriodusService,
    {
      provide: APP_GUARD,
      useClass: AuthGuard,
    },
    {
      provide: APP_GUARD,
      useClass: RolesGuard,
    },
  ],
})
export class PeriodusModule {}
