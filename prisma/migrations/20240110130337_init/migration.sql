-- CreateTable
CREATE TABLE "borrowed" (
    "id" SERIAL NOT NULL,
    "uuid_member" UUID NOT NULL,
    "uuid_book" UUID NOT NULL,

    CONSTRAINT "borrowed_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "borrowed_uuid_member_key" ON "borrowed"("uuid_member");

-- CreateIndex
CREATE UNIQUE INDEX "borrowed_uuid_book_key" ON "borrowed"("uuid_book");
