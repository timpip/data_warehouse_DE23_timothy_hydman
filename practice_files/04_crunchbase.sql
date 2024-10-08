SHOW DATABASES;

USE DATABASE CRUNCHBASE_BASIC_COMPANY_DATA;

SHOW SCHEMAS;

USE SCHEMA PUBLIC;

SHOW VIEWS;

SELECT * FROM ORGANIZATION_SUMMARY LIMIT 10;

SELECT COUNT(*) AS number_rows FROM ORGANIZATION_SUMMARY;

SELECT DISTINCT(TYPE) FROM ORGANIZATION_SUMMARY;
SELECT DISTINCT(ROLES) FROM ORGANIZATION_SUMMARY;
SELECT COUNTRY_CODE, COUNT(COUNTRY_CODE) AS NUMBER_ORGANIZATIONS
FROM ORGANIZATION_SUMMARY
GROUP BY COUNTRY_CODE
ORDER BY NUMBER_ORGANIZATIONS DESC;

SELECT COUNTRY_CODE, COUNT(COUNTRY_CODE) AS NUMBER_ORGANIZATIONS
FROM ORGANIZATION_SUMMARY
WHERE COUNTRY_CODE IN('SWE', 'NOR', 'DK', 'ISL', 'FIN')
GROUP BY COUNTRY_CODE
ORDER BY NUMBER_ORGANIZATIONS DESC;
SELECT COUNTRY_CODE, CITY, COUNT(COUNTRY_CODE) AS NUMBER_ORGANIZATIONS
FROM ORGANIZATION_SUMMARY
WHERE COUNTRY_CODE IN('SWE', 'NOR', 'DK', 'ISL', 'FIN')
GROUP BY COUNTRY_CODE, CITY
ORDER BY NUMBER_ORGANIZATIONS DESC;




