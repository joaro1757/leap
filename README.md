# leap

Star wars; a Snowflake and dbt project which compares the GitHub activity of five open-source data tools.

## The contest

| Tool | Repo | Camp |
|---|---|---|
| dbt Core | `dbt-labs/dbt` | Snowflake & dbt |
| Apache Iceberg | `apache/iceberg` | Snowflake & dbt |
| Apache Spark | `apache/spark` | Databricks |
| Delta Lake | `delta-io/delta` | Databricks |
| DuckDB | `duckdb/duckdb` | Independent |

Five questions, each answered by a query in `analyses/`:

1. Who is winning the star race? (`star_race.sql`)
2. Who has the biggest community? (`community_size.sql`)
3. Who works weekends? (`weekend_activity.sql`)
4. Who takes Christmas off? (`christmas_activity.sql`)
5. How much of the work is done by bots? (`bot_share.sql`)

## Setup

- **Snowflake**: trial account on AWS.
- **dbt**: dbt platform, connected through Snowflake Partner Connect.
- **Git**: this repo, connected to dbt through the GitHub integration.
- **Data**: the *Snowflake Curated Data (Free)* listing on the Snowflake Marketplace. Read-only, so no data is copied or ingested. Three tables are used: `github_events`, `github_repos`, and `github_stars`.