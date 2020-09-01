-- Find the name and height of the shortest player in the database. 
-- 43 inches; playerID: gaedeed01; team id:SLA

select min(cast (height as integer)) as shortest_height
from people;

-- How many games did he play in? 
--52
select count('G') as games_played, playerid
from batting as b
inner join teams as t
using (teamid)
where  teamid = 'SLA' and playerid = 'gaedeed01'
group by playerid


-- What is the name of the team for which he played? 
-- St. Louis Browns
select playerid, teamid, name
from batting as b
inner join teams as t
using (teamid)
where teamid = 'SLA' and playerid = 'gaedeed01'