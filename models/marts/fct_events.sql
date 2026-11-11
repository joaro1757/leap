{{ config(materialized='incremental', unique_key='id') }}

select 
    e.id,
    e.created_at_timestamp,
    e.type,
    e.actor_id,
    e.actor_login,
    e.repo_id,
    e.payload_action,
    e.load_date,
    e.is_bot,
    e.is_weekend,
    e.is_christmas
from 
    {{ ref('int_github_events__contestants') }} e
{% if is_incremental() %}
where 
    e.load_date >= (select max(l.load_date) from {{ this }} l)
{% endif %}