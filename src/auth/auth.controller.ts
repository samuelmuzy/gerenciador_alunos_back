import { Body, Controller, Post } from '@nestjs/common';
import { SingInDTO, SingUpDTO } from './dtos/authDTO';
import { AuthService } from './auth.service';
import { Public } from './SkipAuth.decorator';
import { Roles } from './roles.decorator';
import { Role } from './enums/RoleEnum';


@Controller('auth')
export class AuthController {
    constructor(private authService:AuthService){
        
    }

    @Public()
    @Post('signup')
    async singUp(@Body() body:SingUpDTO){
        return this.authService.singUp(body);
    }
    
    @Roles(Role.ADMIN)
    @Post('singin')
    async singIn(@Body() body:SingInDTO){
        return this.authService.singIn(body);
    }
}
