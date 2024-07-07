{{
    config(
        materialized='view'
    )
}}

with


source as (
    
    select * from {{ source('seeds', 'bounty_prices') }}

),

final as (

    select
        asset,
        type as bounty_type,
        lower,
        higher,
        average

    from source 

)

select * from final
