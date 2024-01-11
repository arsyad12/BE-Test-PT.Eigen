/*
  Warnings:

  - A unique constraint covering the columns `[title]` on the table `borrowed` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `borrowed` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "borrowed" ADD COLUMN     "title" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "borrowed_title_key" ON "borrowed"("title");
