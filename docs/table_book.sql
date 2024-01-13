-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS book_id_seq;

-- Table Definition
CREATE TABLE "public"."book" (
    "id" int4 NOT NULL DEFAULT nextval('book_id_seq'::regclass),
    "code" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "author" varchar(255) NOT NULL,
    "stock" int4 NOT NULL,
    "uuid_book" uuid NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."book" ("id", "code", "title", "author", "stock", "uuid_book") VALUES
(3, 'HOB-83', 'The Hobbit, or There and Back Again', 'J.R.R. Tolkien', 1, '8d8f1012-6c36-401e-b0d8-53c5c94919af');
INSERT INTO "public"."book" ("id", "code", "title", "author", "stock", "uuid_book") VALUES
(4, 'NRN-7', 'The Lion, the Witch and the Wardrobe', 'C.S. Lewis', 1, '535de1d3-135f-4b48-9186-2424ad537cfd');
INSERT INTO "public"."book" ("id", "code", "title", "author", "stock", "uuid_book") VALUES
(1, 'JK-45', 'Harry Potter', 'J.K Rowling', 1, '0da1e2c5-c3ff-44f4-86d9-9ac2a1c20954');
INSERT INTO "public"."book" ("id", "code", "title", "author", "stock", "uuid_book") VALUES
(2, 'TW-11', 'Twilight', 'Stephenie Meyer', 1, 'c01b12eb-df4d-42ad-a2e0-b6032452153d'),
(6, 'BNHA-1', 'Bokuno Hero Academia', 'Sensei K', 1, '399968a9-24d4-47d9-aeaa-a86823d18e06'),
(5, 'SHR-1', 'A Study in Scarlet', 'Arthur Conan Doyle', 1, '3a72d51d-bbd4-4dc4-8c9e-2a12470ac3ff');