--a) Create a marketing virtual warehouse called marketing_wh with size xs, 1 min suspend time, it should autoresume, suspend initially and give it a suitable comment.
USE ROLE sysadmin;

CREATE WAREHOUSE IF NOT EXISTS marketing_wh
WITH
WAREHOUSE_SIZE = 'X-Small'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Marketing virtual warehouse';

--b) Now create a database called ifood, and add a staging layer by creating a schema called staging.
CREATE DATABASE IF NOT EXISTS ifoods;

USE DATABASE ifoods;

CREATE SCHEMA IF NOT EXISTS staging;

--c) Create a user called extract_loader and setup its credentials.
CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = dev_wh;

--d) Create a role marketing_dlt_role and grant it access to staging.
CREATE ROLE IF NOT EXISTS marketing_dlt_role;
USE ROLE SECURITYADMIN;
--usage database
GRANT USAGE ON SCHEMA stagning TO ROLE marketing_dlt_role;
usage schema

future staging
--e) Assign marketing_dlt_role to extract_loader user.
GRANT ROLE marketing_dlt_role TO USER extract_loader;

SHOW GRANTS TO USER extract_loader;

SHOW GRANTS TO ROLE marketing_dlt_role;

-- Load this marketing data into the staging layer using dlt.

USE ROLE ACCOUNTADMIN;

DROP DATABASE ifoods;

DROP ROLE marketing_dlt_role;
