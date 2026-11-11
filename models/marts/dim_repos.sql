select
    c.repo_id,
    n.repo_name,
    c.tool, 
    c.camp
from 
    {{ ref('contestants') }} c
left join 
    {{ ref('int_github_repos__latest_name') }} n
    using(repo_id)    