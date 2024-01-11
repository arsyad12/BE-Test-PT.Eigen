/*
  Warnings:

  - You are about to drop the column `title` on the `borrowed` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "book_title_key";

-- DropIndex
DROP INDEX "borrowed_title_key";

-- AlterTable
ALTER TABLE "borrowed" DROP COLUMN "title";
