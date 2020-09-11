-- Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Dav
-- Give their full name and the teams that they were managing when they won the award.

select a1.playerid, a1.awardid, a1.yearid,a1.lgid, a2.awardid, a2.yearid,a2.lgid, namefirst, namelast
from awardsmanagers as a1
inner join awardsmanagers a2
on a1.playerid = a2.playerid
inner join people as p
on a1.playerid = p.playerid
where a1.awardid = 'TSN Manager of the Year' and a1.lgid = 'NL' and a2.lgid = 'AL' and a2.awardid = 'TSN Manager of the Year'
order by a1.playerid
-------------------------------------
select name, playerid, t.yearid
from teams as t
inner join managers as m
on t.teamid=m.teamid
where playerid = 'johnsda02' and t.yearid = 2012
group by t.yearid, t.name, m.playerid
--------------------------------------------
select playerid, awardid, yearid, lgid 
from awardsmanagers
where awardid = 'TSN Manager of the Year' and (lgid = 'NL' or lgid = 'AL')
order by playerid

SELECT  am1.playerid
		, am1.lgid
		, am1.yearid as firstYear
		, s1.playerid, s1.lgid, s1.yearid
from awardsmanagers am1
inner join(
	SELECT am1.playerid
				, am1.lgid
				, am1.yearid
			from awardsmanagers am1
			where am1.awardid = 'TSN Manager of the Year'
			and (am1.lgid = 'NL')
		   ) s1 on s1.playerid = am1.playerid
		   and s1.yearid <> am1.yearid
		   and s1.lgid <> am1.lgid
where am1.awardid = 'TSN Manager of the Year'
and ( am1.lgid = 'AL')
order by am1.playerid

------------------
SELECT CONCAT(namefirst,' ', namelast) AS mgr_name,
	 a.yearid, t.franchname
FROM awardsmanagers AS a
INNER JOIN people AS p
ON a.playerid = p.playerid 
INNER JOIN managers AS m
ON a.playerid = m.playerid AND a.yearid=m.yearid
INNER JOIN teamsfranchises AS t
ON m.teamid = t.franchid

WHERE a.playerid IN 
	(SELECT a.playerid
	FROM awardsmanagers AS a
	WHERE awardid LIKE '%TSN%' 
	AND a.lgid LIKE 'NL'
	INTERSECT
	SELECT a.playerid
	FROM awardsmanagers AS a
	WHERE awardid LIKE '%TSN%'
	AND a.lgid LIKE 'AL')
GROUP BY mgr_name,  a.yearid, t.franchname
ORDER BY mgr_name
