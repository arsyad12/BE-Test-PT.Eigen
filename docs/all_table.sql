-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."_prisma_migrations" (
    "id" varchar(36) NOT NULL,
    "checksum" varchar(64) NOT NULL,
    "finished_at" timestamptz,
    "migration_name" varchar(255) NOT NULL,
    "logs" text,
    "rolled_back_at" timestamptz,
    "started_at" timestamptz NOT NULL DEFAULT now(),
    "applied_steps_count" int4 NOT NULL DEFAULT 0,
    PRIMARY KEY ("id")
);

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

INSERT INTO "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") VALUES
('8d7892fd-fcf0-46c4-b10b-20832ebe62ed', '3be6db55898c24e2ae9140c48eda2de7dabe38a111443a5f204cf302acc8673f', '2024-01-10 14:49:42.324326+07', '20240110074942_init', NULL, NULL, '2024-01-10 14:49:42.224386+07', 1);
INSERT INTO "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") VALUES
('26e76a1a-c7b1-4eeb-bef7-65c3e5c9d5a0', '7133f6a492ac7203156fea482d3d86e1e7a46e8dd9a0b808747559593a0fa87c', '2024-01-10 15:42:05.674452+07', '20240110084205_init', NULL, NULL, '2024-01-10 15:42:05.569584+07', 1);
INSERT INTO "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") VALUES
('ca189d75-290d-4ff0-80ee-c9a65496a9ae', 'c18df19e5b189564bb601eedd6a9976ce6c69d7de78b42218d8b654ab6c0921e', '2024-01-10 20:03:37.403379+07', '20240110130337_init', NULL, NULL, '2024-01-10 20:03:37.331676+07', 1);
INSERT INTO "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") VALUES
('8f9e5152-c6c6-44e7-a026-c63734ddb5ce', '3721476dc89706907668944102830e8c76b23ea31ddeb7f70f78321467f9f1bc', '2024-01-11 05:49:30.414378+07', '20240110224930_init', NULL, NULL, '2024-01-11 05:49:30.356303+07', 1),
('580d7969-1315-439f-b358-0a893d047d86', '7c8a26850b82671d9cb73d0b3020591cb33ce42e330cb4306d11e586426ccbc1', '2024-01-11 08:51:14.984537+07', '20240111015114_init', NULL, NULL, '2024-01-11 08:51:14.943978+07', 1),
('63365af2-a4b6-4ad1-819d-6599b3af95be', '906bea88eba1f69e201753138d14ffe86fa4247fe304400cbfb4aacf2b8631b4', '2024-01-11 08:53:51.322125+07', '20240111015351_init', NULL, NULL, '2024-01-11 08:53:51.278177+07', 1),
('124ada12-302d-4af5-85c5-56a1b24f91cb', '9dce3bbc39b03aba9f27f19aa39b326f4ce7326c1b27d67e04a9d24374d77b83', '2024-01-11 08:56:32.506799+07', '20240111015632_init', NULL, NULL, '2024-01-11 08:56:32.494191+07', 1),
('bf2f7035-9143-49a3-98c3-6e1586777846', '20fae5a3cfe0d01db8eec3d1bcf2ada40df01524cf42255d1c7b3108573779a3', '2024-01-11 09:21:52.724379+07', '20240111022152_init', NULL, NULL, '2024-01-11 09:21:52.685105+07', 1),
('8cb56904-0bbc-4681-845b-a729a0299be0', 'b69fe0be53d12b1ab0bdba8c8fb1361af71aa6e9ee90d8565d1370487c6a4a01', '2024-01-11 09:39:12.733621+07', '20240111023912_init', NULL, NULL, '2024-01-11 09:39:12.719369+07', 1),
('4586a8bb-0205-4b7b-b041-5d6f978b20b5', '4323b71069695eb0ca5e7321962fb0cbd844f28ff36f364f9bf4fa89734441f1', '2024-01-11 14:23:59.504527+07', '20240111072359_init', NULL, NULL, '2024-01-11 14:23:59.475968+07', 1),
('6d7bd4c0-6e06-4592-8f1d-fddcffb90494', '490ac9036392bfcf1564ea42ba7810d02d0dc6ac60cebd4c6d045f7570239b81', '2024-01-11 19:39:26.440887+07', '20240111123926_init', NULL, NULL, '2024-01-11 19:39:26.411505+07', 1),
('ed0b6859-3f5d-4060-bbc1-3ac0fff6769b', 'aa70cc5ffdcaf92badec02992cbc2451ee7e74505ad60693b242f10ec14fa6d4', '2024-01-12 07:07:01.412151+07', '20240112000700_init', NULL, NULL, '2024-01-12 07:07:00.681867+07', 1);

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



INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(3, 'MM-40', 'lala', 'lala@gmail.com', '$2b$10$h8kmKWNF.h39BskSKDEAEOWF/iRgKzcRj3bC6Jr82wJUxBiKUu50m', 'c411ab29-8f24-4be3-a7a3-270de0227a2f', 'f');
INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(4, 'themember', 'John', 'john@email.com', '$2b$10$RSuRMMSjGC1kWj2OHx5fVOcfGOxR3MwmJUfRUB3BtCnW7psQp642u', 'b7aad07c-95bd-4c66-b52c-43dbd63a0c25', 'f');
INSERT INTO "public"."member" ("id", "code", "name", "email", "password", "uuid_member", "isMemberPenalize") VALUES
(2, 'MM-80', 'Arsyad', 'arsyad@gmail.com', '$2b$10$dXElXMtMVbHb3n6iU9Txu.8PEBcfnnyYGXLWKYSZMRPh5QEUyB5Z6', '98f03247-7dc0-4ac2-be5f-b1042dff55ab', 't');
