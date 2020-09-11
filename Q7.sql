-- From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? Seattle Mariners, 116 wins.
-- What is the smallest number of wins for a team that did win the world series? Doing this will probably result 
-- in an unusually small number of wins for a world series champion – determine why this is the case. Los Angeles Dodgers, 63 wins.
-- Then redo your query, excluding the problem year. 
-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

 select name, yearid, w as Wins, l as Losses, wswin as  World_Series_Winner
 from teams
 where yearid between 1970 and 2016 and wswin = 'N'
 order by wins desc
 --------------------------------------
 select name, yearid, w as Wins, l as Losses, wswin as  World_Series_Winner
 from teams
 where yearid between 1970 and 2016 and wswin = 'Y'
 order by wins
---------------------------------------
 select name, yearid, w as Wins, l as Losses, wswin as  World_Series_Winner
 from teams
 where yearid between 1970 and 2016 and wswin = 'Y'
 and yearid <> 1981
 order by wins
 ---------------------------------------
 with max_wins as (select yearid, max(w) as max_wins
 from teams
 where yearid between 1970 and 2016
 group by yearid
 order by yearid),
 
 World_Series_Winner as (select name, yearid, w as Wins, l as Losses, wswin as  World_Series_Winner
 from teams
 where yearid between 1970 and 2016 and wswin = 'Y'
 and yearid <> 1981
 order by wins),
 
 /*select *, case when wins = max_wins then 1 else 0 end as all_wins
 from World_Series_Winner
 inner join max_wins
 on world_series_Winner.yearid = max_wins.yearid*/

 win_to_losses as (select *, case when wins = max_wins then 1 else 0 end as all_wins
 from World_Series_Winner
 inner join max_wins
 on world_series_Winner.yearid = max_wins.yearid)
 
select count (*), round(avg(all_wins)::numeric,2) as percentage, sum(all_wins) as sum_of_all_wins, round(sum(all_wins)::numeric/count(all_wins),2) as percentage
from win_to_losses