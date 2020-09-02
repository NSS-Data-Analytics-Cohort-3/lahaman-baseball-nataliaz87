-- Find the player who had the most success stealing bases in 2016, where success is measured as the percentage 
-- of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) 
-- Consider only players who attempted at least 20 stolen bases. "owingch01"
select playerid, sb, yearid, cs+sb as stealing_attempts, 100* (sb)/ (cs+sb) as percentage
from batting
where yearid = 2016 and sb+cs >=20
--group by batting.playerid, batting.yearid, batting.ab, batting.cs, batting.sb
--order by stealing_attempts desc
order by percentage desc

 