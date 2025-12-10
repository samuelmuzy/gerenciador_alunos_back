/*
  Warnings:

  - You are about to drop the column `nota_etapa` on the `etapa` table. All the data in the column will be lost.
  - Added the required column `nota_maxima_etapa` to the `etapa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_corte` to the `periodo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "etapa" DROP COLUMN "nota_etapa",
ADD COLUMN     "nota_maxima_etapa" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "periodo" ADD COLUMN     "nota_corte" DOUBLE PRECISION NOT NULL;
