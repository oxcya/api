CREATE TABLE "threads" (
  "id" int PRIMARY KEY,
  "username" string,
  "created_at" timestamp,
  "subject" string,
  "content" string,
  "image" string
);

CREATE TABLE "comments" (
  "id" integer PRIMARY KEY,
  "thread_id" integer,
  "username" string,
  "content" string
);

ALTER TABLE "threads" ADD FOREIGN KEY ("id") REFERENCES "comments" ("thread_id");
