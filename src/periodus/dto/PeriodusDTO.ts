import { IsNotEmpty, IsNumber } from "class-validator"

export class CreatePeriodus{
    @IsNotEmpty()
    nome:string

    @IsNotEmpty()
    descricao:string

    @IsNotEmpty()
    @IsNumber()
    nota_corte:number
}