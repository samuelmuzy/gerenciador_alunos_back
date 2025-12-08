import { Injectable } from '@nestjs/common';
import type { SingUpDTO } from './dtos/authDTO';


import { Public } from './SkipAuth.decorator';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AuthService {

    constructor(private prismaService:PrismaService){}
    
    
    public async singUp(data:SingUpDTO){
        const newUser = await this.prismaService.usuarios.create({data});
        return newUser
    }

    public async singIn(data:SingUpDTO){
        return 'ss'
    }
}
