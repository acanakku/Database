CREATE DATABASE "lab2"

CREATE TABLE countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    population INT
);

INSERT INTO countries VALUES (1, 'Kazakhstan', 1, 56);
INSERT INTO countries (country_id, country_name) VALUES (2, 'Spain');
INSERT INTO countries (country_id, country_name, region_id, population) VALUES (3, 'Nigeria', NULL, 7283);
INSERT INTO countries (country_id, country_name, region_id, population) VALUES
    (4, 'France', 4, 873745),
    (5, 'Russia', 5, 302831092),
    (6, 'USA', 10, 3283236);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries (country_id,country_name, region_id, population) VALUES (7,DEFAULT, 2, 6384734);
INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);
INSERT INTO countries_new SELECT * FROM countries;
UPDATE countries_new SET region_id = 1 WHERE region_id IS NULL;
UPDATE countries_new
SET population = population * 1.1
RETURNING country_name, population AS New_Population;

DELETE FROM countries WHERE population < 100000;
DELETE FROM countries_new USING countries WHERE countries_new.country_id = countries.country_id RETURNING countries_new.*;
DELETE FROM countries RETURNING *;