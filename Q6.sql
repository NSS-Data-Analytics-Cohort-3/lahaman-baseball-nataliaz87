-- Find the player who had the most success stealing bases in 2016, where success is measured as the percentage 
-- of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) 
-- Consider only players who attempted at least 20 stolen bases.

select playerid, sum(ab) at_bats, yearid, sum(cs+sb)as successful_stealing_attempts
from batting
where yearid = 2016 and sb+cs >=20
group by batting.playerid, batting.yearid
order by successful_stealing_attempts desc


 