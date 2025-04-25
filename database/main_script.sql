CREATE TABLE "user"(
    "id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "user" ADD PRIMARY KEY("id");
alter table "user"
alter column created_date set default current_timestamp;
ALTER TABLE "user"
ALTER COLUMN "deleted_date" DROP NOT NULL;
ALTER TABLE "user" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE "watchlist"(
    "id" BIGINT NOT NULL,
    "user_id" VARCHAR(255) NOT NULL,
    "item_id" BIGINT NOT NULL,
    "item_type_id" INTEGER NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "watchlist" ADD PRIMARY KEY("id");
CREATE TABLE "movie"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "duration" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "release_date" DATE NOT NULL,
    "genre_id" INTEGER NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "rating" INTEGER NOT NULL
);
ALTER TABLE
    "movie" ADD PRIMARY KEY("id");
CREATE TABLE "Episode"(
    "id" INTEGER NOT NULL,
    "series_id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "duration" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Episode" ADD PRIMARY KEY("id");
ALTER TABLE "Episode" RENAME TO episode;
CREATE TABLE "Series"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "total_episode" INTEGER NOT NULL,
    "released_date" DATE NOT NULL,
    "rating" INTEGER NOT NULL,
    "genre_id" INTEGER NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Series" ADD PRIMARY KEY("id");
ALTER TABLE "Series" RENAME TO series;
CREATE TABLE "genre"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "genre" ADD PRIMARY KEY("id");
CREATE TABLE "payment"(
    "id" BIGINT NOT NULL,
    "user_id" VARCHAR(255) NOT NULL,
    "method" VARCHAR(255) NOT NULL,
    "bank" VARCHAR(255) NOT NULL,
    "bank_number" VARCHAR(255) NOT NULL,
    "status" BOOLEAN NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "transaction_id" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "payment" ADD PRIMARY KEY("id");
CREATE TABLE "package"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "duration" BIGINT NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "package" ADD PRIMARY KEY("id");
CREATE TABLE "order"(
    "id" BIGINT NOT NULL,
    "user_id" VARCHAR(255) NOT NULL,
    "package_id" INTEGER NOT NULL,
    "date_order" BIGINT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "total_ammount" DECIMAL(10, 2) NOT NULL,
    "created_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "order" ADD PRIMARY KEY("id");
CREATE TABLE "list_item_type"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "list_item_type" ADD PRIMARY KEY("id");
ALTER TABLE
    "movie" ADD CONSTRAINT "movie_genre_id_foreign" FOREIGN KEY("genre_id") REFERENCES "genre"("id");
ALTER TABLE
    "series" ADD CONSTRAINT "series_genre_id_foreign" FOREIGN KEY("genre_id") REFERENCES "genre"("id");
ALTER TABLE
    "watchlist" ADD CONSTRAINT "watchlist_item_type_id_foreign" FOREIGN KEY("item_type_id") REFERENCES "list_item_type"("id");
ALTER TABLE
    "watchlist" ADD CONSTRAINT "watchlist_item_id_foreign" FOREIGN KEY("item_id") REFERENCES "movie"("id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("id");
 
ALTER TABLE
    "order" ADD CONSTRAINT "order_package_id_foreign" FOREIGN KEY("package_id") REFERENCES "package"("id");
ALTER TABLE
    "payment" ADD CONSTRAINT "payment_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("id");
ALTER TABLE
    "episode" ADD CONSTRAINT "episode_series_id_foreign" FOREIGN KEY("series_id") REFERENCES "series"("id");
ALTER TABLE
    "watchlist" ADD CONSTRAINT "watchlist_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("id");

ALTER TABLE "package"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "order"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "payment"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "watchlist"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "movie"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "series"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "episode"
ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "package" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "order" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "payment" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "watchlist" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "episode" 
ALTER COLUMN "updated_date" SET DEFAULT CURRENT_TIMESTAMP;

CREATE SEQUENCE movie_id_seq;
ALTER SEQUENCE movie_id_seq OWNED BY movie.id;
ALTER TABLE movie ALTER COLUMN id SET DEFAULT nextval('movie_id_seq');
SELECT setval('movie_id_seq', COALESCE((SELECT MAX(id) FROM movie), 0) + 1, false);

ALTER TABLE "movie"
ADD COLUMN "updated_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP;

