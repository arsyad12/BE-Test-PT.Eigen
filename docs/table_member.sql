-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS member_id_seq;

-- Table Definition
CREATE TABLE "public"."member" (
    "id" int4 NOT NULL DEFAULT nextval('member_id_seq'::regclass),
    "code" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "uuid_member" uuid NOT NULL,
    "isMemberPenalize" bool NOT NULL DEFAULT false,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(3, 'MM-40', 'lala', 'lala@gmail.com', '$2b$10$h8kmKWNF.h39BskSKDEAEOWF/iRgKzcRj3bC6Jr82wJUxBiKUu50m', 'c411ab29-8f24-4be3-a7a3-270de0227a2f', 'f');
INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(4, 'themember', 'John', 'john@email.com', '$2b$10$RSuRMMSjGC1kWj2OHx5fVOcfGOxR3MwmJUfRUB3BtCnW7psQp642u', 'b7aad07c-95bd-4c66-b52c-43dbd63a0c25', 'f');
INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(2, 'MM-80', 'Arsyad', 'arsyad@gmail.com', '$2b$10$dXElXMtMVbHb3n6iU9Txu.8PEBcfnnyYGXLWKYSZMRPh5QEUyB5Z6', '98f03247-7dc0-4ac2-be5f-b1042dff55ab', 't');