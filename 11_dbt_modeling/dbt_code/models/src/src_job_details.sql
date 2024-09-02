WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_data_ads') }})

SELECT id,
       headline,
       description__text AS "DESCRIPTION",
       description__text_formatted as description_html_formatted,
       employment_type__label as employment_type,
       duration__label as duration,
       salary_type__label as salary_type,
       scope_of_work__min as scope_of_work_min,
       scope_of_work__max as scope_of_work_max
FROM stg_job_ads