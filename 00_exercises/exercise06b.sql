USE ROLE SYSADMIN;

CREATE DATABASE IF NOT EXISTS ifoods;  

CREATE SCHEMA IF NOT EXISTS staging;

USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS marketing_dlt_role;

GRANT ROLE marketing_dlt_role TO USER extract_loader;
GRANT ROLE marketing_dlt_role TO USER timpip;

USE ROLE SECURITYADMIN;
GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;
GRANT USAGE ON DATABASE ifoods TO ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifoods.staging TO ROLE marketing_dlt_role;

GRANT CREATE TABLE ON SCHEMA ifoods.staging TO ROLE marketing_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifoods.staging TO ROLE marketing_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifoods.staging TO ROLE marketing_dlt_role;








