select
    r.tool,
    count(*) as events,
    avg(f.is_weekend) as weekend_share
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
    weekend_share desc