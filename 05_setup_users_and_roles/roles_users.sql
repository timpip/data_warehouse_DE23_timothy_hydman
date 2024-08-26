use role sysadmin;
CREATE DATABASE ice_cream_db;

CREATE WAREHOUSE dev_wh
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for development and analysis af databases';

USE WAREHOUSE DEV_WH;

CREATE TABLE flavors (
    flavors_id INT AUTOINCREMENT,
    flavors_name STRING,
    price DECIMAL(5,2),
    PRIMARY KEY (flavors_id)
);

CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT,
    flavors_id INT,
    quantity INT,
    transaction_date TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavors_id) REFERENCES flavors (flavors_id)
);

USE ROLE USERADMIN;

SELECT current_role(); 

CREATE ROLE ice_cream_reader COMMENT = 'Able to read icecream_db';
CREATE ROLE ice_cream_writer COMMENT = 'Able to CRUD operations on icecream_db';
CREATE ROLE ice_cream_analyst COMMENT = 'Able to create viwes on icecream_db';

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ICE_CREAM_DB TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader; 

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;
---------
GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;

GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;
GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

SHOW GRANTS TO ROLE ice_cream_writer;

USE ROLE ice_cream_writer;

GRANT ROLE ice_cream_writer TO USER timpip;

USE ROLE ice_cream_writer;

USE WAREHOUSE dev_wh;

USE SCHEMA ice_cream_db.public;

DROP TABLE customers;

INSERT INTO flavors (flavors_name, price) VALUES
('Vanilla', 2.50),
('Chocolate', 2.75),
('Strawberry', 2.50),
('Mint Chocolate Chip', 3.00),
('Cookie Dough', 3.25);

INSERT INTO customers (customer_name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');

INSERT INTO transactions (
    customer_id, flavors_id, quantity, transaction_date
) VALUES
(1, 1, 2, CURRENT_TIMESTAMP),
(2, 2, 1, CURRENT_TIMESTAMP),
(3, 3, 3, CURRENT_TIMESTAMP),
(1, 4, 1, CURRENT_TIMESTAMP),
(2, 5, 2, CURRENT_TIMESTAMP);

USE ROLE ice_cream_reader;

SELECT * FROM FLAVORS;

SELECT * FROM CUSTOMERS;

SELECT * FROM TRANSACTIONS;

