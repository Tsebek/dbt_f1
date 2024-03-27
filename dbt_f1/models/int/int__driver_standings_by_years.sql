with driver_standings_joined_names as (
    select
      stands.*,
      drivers.driver_number,
      drivers.name_code,
      drivers.first_name,
      drivers.last_name,
      drivers.birthday,
      drivers.nationality
    from {{ ref("src__driver_stands") }} as stands
      left join {{ ref("src__drivers") }} as drivers
        on stands.driver_id = drivers.driver_id
),

with driver_standings_by_years as (
    select
      dsn.*,
      race.race_year,
      race.round_number,
      race.circuit_id,
      race.race_name
    from driver_standings_joined_names as dsn
      left join {{ ref("src__races") }} as race
        on dsn.race_id = race.race_id
)

select
  *
from driver_standings_by_years