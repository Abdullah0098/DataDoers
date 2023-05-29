{{ config(materialized='table') }}

with chicagocrime_details as 
(
    select id,case_number,date from {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)

select * from chicagocrime_details
