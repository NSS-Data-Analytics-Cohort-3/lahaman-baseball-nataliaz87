-- Find the name and height of the shortest player in the database. 
-- 43 inches; playerID: gaedeed01; team id:SLA, player's name: Gaedel Eddie

select min(cast (height as integer)) as shortest_height, namelast, namefirst
from people
where height = 43
group by people.namelast, people.namefirst

-- How many games did he play in? 
--52
select count('G') as games_played, playerid
from batting as b
inner join teams as t
using (teamid)
where  teamid = 'SLA' and playerid = 'gaedeed01'
group by playerid
---------------------
-- How many games did he play in? 1

SELECT 
	DISTINCT p.playerid, namefirst, namelast, p.height AS height_in_inches, 
	t.name, a.teamid, a.g_all AS games_played	
FROM people as p
JOIN appearances as a
ON p.playerid = a.playerid
JOIN teams as t
ON a.teamid = t.teamid
WHERE height IS NOT NULL
GROUP BY p.playerid, t.name, a.teamid, a.g_all
ORDER BY height_in_inches asc;



-- What is the name of the team for which he played? 
-- St. Louis Browns
select playerid, teamid, name
from batting as b
inner join teams as t
using (teamid)
where teamid = 'SLA' and playerid = 'gaedeed01'