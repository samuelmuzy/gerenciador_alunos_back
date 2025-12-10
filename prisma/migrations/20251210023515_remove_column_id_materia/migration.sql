/*
  Warnings:

  - You are about to drop the column `materiaId` on the `etapa` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "etapa" DROP CONSTRAINT "etapa_materiaId_fkey";

-- AlterTable
ALTER TABLE "etapa" DROP COLUMN "materiaId";
