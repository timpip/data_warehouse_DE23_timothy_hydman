USE ROLE SYSADMIN;

SHOW ROLES;


USE ROLE USERADMIN;
CREATE USER IF NOT EXISTS transformer
    PASSWORD = 'transformer_password123'
    DEFAULT_WAREHOUSE = dev_wh
    LOGIN_NAME = 'transformer'
    DEFAULT_NAMESPACE = 'job_ads.warehouse'
    COMMENT = 'dbt user for transforming data'
    DEFAULT_ROLE = 'job_ads_dbt_role';