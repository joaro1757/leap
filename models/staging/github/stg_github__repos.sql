select 
    r.repo_id,
    r.repo_name,
    r.first_seen,
    r.last_seen
from 
    {{ source('github', 'github_repos') }} r