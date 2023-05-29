{{ config(materialized='table') }}

with 
CHICAGOCRIME_ARRESTMENT AS
(
    select id as arrestment_id,arrest from  {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)

select * from CHICAGOCRIME_ARRESTMENT
