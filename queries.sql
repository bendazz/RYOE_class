select rusher_player_id,rusher_player_name,ydstogo,yards_gained
from plays
where rush_attempt=1


select ydstogo,avg(yards_gained) as avg_yards
from plays
where rush_attempt=1
group by ydstogo



select 
rusher_player_id,
rusher_player_name,
avg(yards_gained - (0.12588674*ydstogo+3.47336519)) as ryoe,
count(*) as rush_attempts
from plays
where rush_attempt=1
group by rusher_player_id
having count(*) >= 100
order by ryoe desc

select 
rusher_player_id,
rusher_player_name,
yards_gained - (0.12588674*ydstogo+3.47336519) as ryoe
from plays
where rush_attempt=1
order by ryoe desc


select 
rusher_player_id,
count(*) as rush_attempts
from plays
where rush_attempt=1
group by rusher_player_id
order by count(*) desc
-----------------------------------------------------------

SELECT
    rusher_player_id,
    rusher_player_name,
    yards_gained,
    ydstogo,
    Case
        when down = 2 then 1
        else 0
        end as is_2nd_down,

    Case
        when down = 3 then 1
        else 0
        end as is_3rd_down,

    Case
        when down = 4 then 1
        else 0
        end as is_4th_down
 
from plays
where rush_attempt=1

----------
np.float64(2.471750805961095)

array([0.199273  , 0.73200072, 1.12417315, 0.82187461])

----------------

with rush_data as (
    select
        rusher_player_id,
        rusher_player_name,
        yards_gained,
        ydstogo,
        Case
            when down = 2 then 1
            else 0
            end as is_2nd_down,

        Case
            when down = 3 then 1
            else 0
            end as is_3rd_down,
        Case
            when down = 4 then 1
            else 0
            end as is_4th_down
    from plays
    where rush_attempt=1
)
select
    rusher_player_id,
    rusher_player_name,
    avg(yards_gained - (2.471750805961095 +
        0.199273 * ydstogo +
        0.73200072 * is_2nd_down +
        1.12417315 * is_3rd_down +
        0.82187461 * is_4th_down
    )) as ryoe
from rush_data
group by rusher_player_id
having count(*) >= 100
order by ryoe desc
limit 10;







