{{ config(materialized='table') }}

with 
CHICAGOCRIME_ARRESTMENTS AS
(
    select id as arrestment_id,arrest from  {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)

select * from CHICAGOCRIME_ARRESTMENTS
