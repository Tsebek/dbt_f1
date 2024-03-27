with race_results as (
    select
      *
    from {{ ref("src__results") }}
),

sprint_resuts as (
    select
      *
    from {{ ref("src__sprint_results") }}
)

select
  result_id,
  race_id,
  driver_id,
  constructor_id,
  grid,
  position,
  points
from race_results as race
  left join sprint_resuts as sprint
    on race.race_id = sprint.race_id
      and race.driver_id = sprint.driver_id