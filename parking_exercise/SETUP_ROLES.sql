USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS parking_dlt_role;


USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE parking_wh TO ROLE parking_dlt_role;

GRANT USAGE ON DATABASE parking_db TO ROLE parking_dlt_role;

GRANT USAGE ON SCHEMA parking_db.staging TO ROLE parking_dlt_role;
GRANT USAGE ON SCHEMA parking_db.staging_mc TO ROLE parking_dlt_role;


GRANT SELECT ON ALL TABLES IN SCHEMA parking_db.staging TO ROLE parking_dlt_role;

GRANT CREATE TABLE ON SCHEMA parking_db.staging TO ROLE parking_dlt_role;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA parking_db.staging TO ROLE parking_dlt_role;

--GRANT FUTURE--

GRANT SELECT ON FUTURE TABLES IN SCHEMA parking_db.staging TO ROLE parking_dlt_role;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA parking_db.staging TO ROLE parking_dlt_role;

--GRANT TO USER--


GRANT ROLE parking_dlt_role TO USER parking_user;
GRANT ROLE parking_dlt_role TO USER timpip;

--Control--

SHOW GRANTS TO ROLE parking_dlt_role;
