/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `borrowed` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "borrowed_id_key" ON "borrowed"("id");
