CREATE ROLE IF NOT EXISTS job_ads_dbt_role;

GRANT ROLE job_ads_dbt_role to USER transformer;

GRANT ROLE job_ads_dbt_role to USER timpip;