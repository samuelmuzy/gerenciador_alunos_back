import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Role } from '../enums/RoleEnum';
import { ROLES_KEY } from '../decorators/roles.decorator';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const requiredRoles = this.reflector.getAllAndOverride<Role[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);
    type Payload = {
      nome: string;
      email: string;
      role: Role;
    };
    if (!requiredRoles) {
      return true;
    }
    const request: Request & { user: Payload } = context
      .switchToHttp()
      .getRequest();
    return requiredRoles.some((role) => request.user.role?.includes(role));
  }
}
