{{ config(materialized='table') }}

with chicagocrime_details as 
(
    select * from {{ ref ('chicagocrime_details') }}
),

CHICAGOCRIMEDATA_DESCRIPTION AS
(
    select * from {{ ref ('chicagocrime_description') }}
),

CHICAGOCRIMEDATA_ARRESTMENTS AS
(
    select * from {{ ref('chicagocrime_arrestment')}}
),

CHICAGOCRIMEDATA_location AS
(
    select * from {{ ref ('chicagocrime_location')}}
),

final_data as
(
    select

    chicagocrime_details.id,
    chicagocrime_details.case_number,
    chicagocrime_details.date,
    CHICAGOCRIMEDATA_DESCRIPTION.crime_description,
    CHICAGOCRIMEDATA_location.location,
    CHICAGOCRIMEDATA_location.location_description,
    CHICAGOCRIMEDATA_ARRESTMENTS.arrest
    from (((chicagocrime_details
    inner join CHICAGOCRIMEDATA_DESCRIPTION on chicagocrime_details.id = CHICAGOCRIMEDATA_DESCRIPTION.description_id)
    inner join CHICAGOCRIMEDATA_ARRESTMENTS on chicagocrime_details.id = CHICAGOCRIMEDATA_ARRESTMENTS.arrestment_id)
    inner join CHICAGOCRIMEDATA_location on chicagocrime_details.id = CHICAGOCRIMEDATA_location.location_id)
)

select * from final_data
