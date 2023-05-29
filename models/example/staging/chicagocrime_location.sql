{{ config(materialized="table") }}

with
chicagocrimedata_location as (
        select id as location_id, location_description, location, longitude, latitude
        from  {{ source('src_chicagocrimedata', 'CHICAGOCRIMEDATA') }}
)

select *
from chicagocrimedata_location
