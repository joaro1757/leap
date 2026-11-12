with events as (
    select
        date_trunc(month, f.created_at_timestamp)::date as month,
        count(*) as star_events
    from
        {{ ref('fct_events') }} f
    where
        f.type = 'WatchEvent'
    group by all
),

stars as (
    select
        date_trunc(month, s.date) as month,
        sum(s.star_count) as star_count
    from
        {{ ref('fct_repo_stars_daily') }} s
    group by all
)

select
    month,
    e.star_events,
    s.star_count,
    s.star_count - e.star_events as difference
from
    events e
full join
    stars s
    using (month)
order by
    month desc