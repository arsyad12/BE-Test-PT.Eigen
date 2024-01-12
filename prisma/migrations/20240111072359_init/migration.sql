/*
  Warnings:

  - Added the required column `date_borrwoed` to the `borrowed` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_return` to the `borrowed` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "borrowed" ADD COLUMN     "date_borrwoed" DATE NOT NULL,
ADD COLUMN     "date_return" DATE NOT NULL;
