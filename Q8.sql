-- Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016
--(where average attendance is defined as total attendance divided by number of games). 
-- Only consider parks where there were at least 10 games played. 
-- Report the park name, team name, and average attendance. 
-- Repeat for the lowest 5 average attendance.

select sum(h.attendance)/sum(h.games) as avg_attendance, t.park, games, year, t.name as team_name
from homegames as h
inner join teams as t
on h.team = t.teamid and t.yearid = 2016
where year = 2016 and games >=10
group by h.team,t.park, h.games, h.year, t.name
order by avg_attendance desc
limit 5

-----------------------------------------
select sum(h.attendance)/sum(h.games) as avg_attendance, t.park, games, year, t.name as team_name
from homegames as h
inner join teams as t
on h.team = t.teamid and t.yearid = 2016
where year = 2016 and games >=10
group by h.team,t.park, h.games, h.year, t.name
order by avg_attendance
limit 5

select games, team, attendance from homegames
where year = 2016
group by homegames.team, homegames.attendance, homegames.attendance, homegames.games