{{
    config(
        materialized='view'
    )
}}

with


source as (
    
    select * from {{ source('s3', 'hackerone_disclosed_reports') }}

),

final as (

    select
        id,
        title,
        substate,
        vulnerability_information,
        reporter['cleared'] as reporter_cleared,
        reporter['disabled'] as reporter_disabled,
        reporter['hacker_mediation'] as reporter_hacker_mediation,
        reporter['hackerone_triager'] as reporter_hackerone_triager,
        team['award_miles'] as team_award_miles,
        replace(team['default_currency'], '"', '') as team_default_currency,
        replace(team['handle'], '"', '') as team_handle,
        team['id'] as team_id,
        team['offers_bounties'] as team_offers_bounties,
        team['only_cleared_hackers'] as team_only_cleared_hackers,
        team['pentest_feature_enabled'] as team_pentest_feature_enabled,
        has_bounty_ as has_bounty,
        visibility,
        weakness['id'] as weakness_id,
        replace(weakness['name'], '"', '') as weakness_name,
        replace(structured_scope['asset_identifier'], '"', '') as structured_scope_asset_identifier,
        replace(structured_scope['asset_type'], '"', '') as structured_scope_asset_type,
        structured_scope['databaseid'] as structured_scope_id,
        replace(structured_scope['max_severity'], '"', '') as structured_scope_max_severity,
        vote_count,
        disclosed_at,
        created_at

    from source 

)

select * from final
