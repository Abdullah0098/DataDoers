{{ config(materialized='table') }}

with 
CHICAGOCRIME_DESCRIPTION AS
(
    select id  as description_id,description as crime_description from {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)

select * from CHICAGOCRIME_DESCRIPTION
