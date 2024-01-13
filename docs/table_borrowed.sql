-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS borrowed_id_seq;

-- Table Definition
CREATE TABLE "public"."borrowed" (
    "id" int4 NOT NULL DEFAULT nextval('borrowed_id_seq'::regclass),
    "uuid_member" uuid NOT NULL,
    "uuid_book" uuid NOT NULL,
    "date_borrwoed" date NOT NULL,
    "date_return" date NOT NULL,
    PRIMARY KEY ("id")
);

