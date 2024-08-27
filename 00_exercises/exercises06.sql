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

CREATE SCHEMA staging;


--c) Create a user called extract_loader and setup its credentials.
CREATE IF NOT EXISTS USER extract_loader
--d) Create a role marketing_dlt_role and grant it access to staging.

--e) Assign marketing_dlt_role to extract_loader user.