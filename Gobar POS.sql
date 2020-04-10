CREATE TABLE "item" (
  "id" int PRIMARY KEY,
  "item_code" int NOT NULL,
  "name" varchar NOT NULL,
  "type" int NOT NULL,
  "status" int NOT NULL,
  "is_trash" int NOT NULL
);

CREATE TABLE "item_price" (
  "id" int PRIMARY KEY,
  "item_id" int NOT NULL,
  "active_date" timestamp,
  "price" int NOT NULL,
  "status" int,
  "is_trash" int
);

CREATE TABLE "item_stock" (
  "id" int PRIMARY KEY,
  "item_id" int NOT NULL,
  "type" text NOT NULL,
  "qty" int NOT NULL,
  "date" datetime NOT NULL
);

CREATE TABLE "pos_transaction" (
  "id" int PRIMARY KEY,
  "transaction_code" varchar NOT NULL,
  "consumer_name" varchar NOT NULL,
  "date" datetime,
  "total" int NOT NULL,
  "disc" int NOT NULL,
  "tax" int NOT NULL,
  "grand_total" int NOT NULL,
  "status" int NOT NULL,
  "is_trash" int NOT NULL
);

CREATE TABLE "pos_transaction_dt" (
  "id" int PRIMARY KEY,
  "transaction_id" int NOT NULL,
  "item_id" int NOT NULL,
  "price_id" int NOT NULL,
  "qty" int NOT NULL,
  "total_price" int NOT NULL,
  "status" int NOT NULL,
  "is_trash" int NOT NULL
);

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "item_price" ("item_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "item_stock" ("item_id");

ALTER TABLE "pos_transaction_dt" ADD FOREIGN KEY ("transaction_id") REFERENCES "pos_transaction" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "pos_transaction_dt" ("item_id");

ALTER TABLE "item_price" ADD FOREIGN KEY ("id") REFERENCES "pos_transaction_dt" ("price_id");
