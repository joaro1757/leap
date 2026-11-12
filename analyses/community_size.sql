select
    r.tool,
    date_trunc(month, f.created_at_timestamp)::date as month,
    count(distinct f.actor_id) as active_people
from
    {{ ref('fct_events') }} f
inner join
    {{ ref('dim_repos') }} r
    using (repo_id)
where
    f.is_bot = 0
    and f.type in (
        'PushEvent',
        'PullRequestEvent',
        'PullRequestReviewEvent',
        'PullRequestReviewCommentEvent',
        'IssuesEvent',
        'IssueCommentEvent'
    )
group by 
    all
order by
    month desc,
    r.tool