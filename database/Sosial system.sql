CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "email" varchar,
  "password" varchar,
  "created_at" timestamp
);

CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "description" text,
  "tags" jsonb,
  "photos" jsonb,
  "user_id" integer,
  "status" varchar,
  "latitude" PostGIS,
  "longitude" PostGIS,
  "created_at" timestamp
);

CREATE TABLE "likes" (
  "user_id" integer,
  "post_id" integer,
  "created_at" timestamp
);

CREATE TABLE "comments" (
  "user_id" integer,
  "post_id" integer,
  "comment" varchar,
  "created_at" timestamp
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "chat_id" integer,
  "message" varchar,
  "created_at" timestamp
);

COMMENT ON COLUMN "users"."password" IS 'hash';

COMMENT ON COLUMN "posts"."description" IS 'Content of the post';

COMMENT ON COLUMN "posts"."photos" IS 'keys from s3';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
