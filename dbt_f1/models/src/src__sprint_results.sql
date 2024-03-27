with sprint_results as (
    select
      *
    from {{ source('f1', 'sprint_results') }}
)

select
  resultId as result_id,
  raceId as race_id,
  driverId as driver_id,
  constructorId as constructor_id,
  grid,
  case
    when position = 'N'
      then 0
      else cast(position as integer)
  end as position,
  points
from sprint_results