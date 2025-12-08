/*
  Warnings:

  - A unique constraint covering the columns `[cpf]` on the table `usuarios` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "usuarios" ADD COLUMN     "cpf" TEXT;

-- CreateTable
CREATE TABLE "alunos" (
    "id" TEXT NOT NULL,
    "matricula" TEXT NOT NULL,
    "id_usuario" TEXT NOT NULL,
    "id_turma" TEXT NOT NULL,

    CONSTRAINT "alunos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professores" (
    "id" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "graduacao" TEXT NOT NULL,
    "id_usuario" TEXT NOT NULL,

    CONSTRAINT "professores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "periodo" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "periodo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "turmas" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "id_periodo" TEXT NOT NULL,

    CONSTRAINT "turmas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professores_Turmas" (
    "professores_id" TEXT NOT NULL,
    "turmas_id" TEXT NOT NULL,

    CONSTRAINT "professores_Turmas_pkey" PRIMARY KEY ("professores_id","turmas_id")
);

-- CreateTable
CREATE TABLE "materia" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "id_periodo" TEXT NOT NULL,

    CONSTRAINT "materia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professores_materia" (
    "professores_id" TEXT NOT NULL,
    "materia_id" TEXT NOT NULL,

    CONSTRAINT "professores_materia_pkey" PRIMARY KEY ("professores_id","materia_id")
);

-- CreateTable
CREATE TABLE "etapa" (
    "id" TEXT NOT NULL,
    "data_Incicio" TIMESTAMP(3) NOT NULL,
    "data_fim" TIMESTAMP(3) NOT NULL,
    "nota_etapa" DOUBLE PRECISION NOT NULL,
    "id_materia" TEXT NOT NULL,

    CONSTRAINT "etapa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "provas" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "nota" DOUBLE PRECISION NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "id_etapa" TEXT NOT NULL,

    CONSTRAINT "provas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "trabalho" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "nota" DOUBLE PRECISION NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "data_Inicio" TIMESTAMP(3) NOT NULL,
    "data_fim" TIMESTAMP(3) NOT NULL,
    "id_etapa" TEXT NOT NULL,

    CONSTRAINT "trabalho_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "alunos_matricula_key" ON "alunos"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_id_usuario_key" ON "alunos"("id_usuario");

-- CreateIndex
CREATE UNIQUE INDEX "professores_id_usuario_key" ON "professores"("id_usuario");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_cpf_key" ON "usuarios"("cpf");

-- AddForeignKey
ALTER TABLE "alunos" ADD CONSTRAINT "alunos_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos" ADD CONSTRAINT "alunos_id_turma_fkey" FOREIGN KEY ("id_turma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores" ADD CONSTRAINT "professores_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "turmas" ADD CONSTRAINT "turmas_id_periodo_fkey" FOREIGN KEY ("id_periodo") REFERENCES "periodo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_Turmas" ADD CONSTRAINT "professores_Turmas_professores_id_fkey" FOREIGN KEY ("professores_id") REFERENCES "professores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_Turmas" ADD CONSTRAINT "professores_Turmas_turmas_id_fkey" FOREIGN KEY ("turmas_id") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "materia" ADD CONSTRAINT "materia_id_periodo_fkey" FOREIGN KEY ("id_periodo") REFERENCES "periodo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_materia" ADD CONSTRAINT "professores_materia_professores_id_fkey" FOREIGN KEY ("professores_id") REFERENCES "professores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_materia" ADD CONSTRAINT "professores_materia_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "etapa" ADD CONSTRAINT "etapa_id_materia_fkey" FOREIGN KEY ("id_materia") REFERENCES "materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "provas" ADD CONSTRAINT "provas_id_etapa_fkey" FOREIGN KEY ("id_etapa") REFERENCES "etapa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "trabalho" ADD CONSTRAINT "trabalho_id_etapa_fkey" FOREIGN KEY ("id_etapa") REFERENCES "etapa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
