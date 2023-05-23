{{ config(materialized='table') }}

with chicagocrime_details as 
(
    select id,case_number from {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)