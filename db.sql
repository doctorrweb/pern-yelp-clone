-- for help     \?

-- list database       \l

-- create database CREATE DATABASE database_name

-- list all tables      \d

CREATE TABLE products (
    id INT,
    name VARCHAR(50),
    price INT,
    on_sale boolean
);

ALTER TABLE products ADD COLUMN featured boolean;
ALTER TABLE products DROP COLUMN featured;

CREATE TABLE restaurants (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    price_range INT NOT NULL check(price_range >= 1 and price_range <= 5)
);

CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL,
    rating INT NOT NULL CHECK(rating >= 1 AND rating <= 5)
);

INSERT INTO restaurants (name, location, price_range) values ('wendys', 'miami', 4);
INSERT INTO reviews (restaurant_id, name, review, rating) values (4, 'joann', 'bad restaurant', 4);