SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS demo_db;

SHOW DATABASES;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_db.staging;

SHOW SCHEMAS IN demo_db;

CREATE TABLE IF NOT EXISTS cutomer(
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

SHOW TABLES;

ALTER TABLE cutomer
RENAME TO customer;

SHOW TABLES;

SELECT * FROM customer;

INSERT INTO customer (customer_id, age, email)
VALUES 
    (1, 32, 'ola@hotmail.com'),
    (2, 33, 'kalle@golsson.se')
;

SELECT * FROM customer;

DROP DATABASE demo_db;

SHOW DATABASES;

