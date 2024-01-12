/*
  Warnings:

  - A unique constraint covering the columns `[uuid_book]` on the table `borrowed` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "borrowed_uuid_book_key" ON "borrowed"("uuid_book");
