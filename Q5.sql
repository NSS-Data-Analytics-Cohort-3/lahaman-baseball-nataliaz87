-- Find the average number of strikeouts per game by decade since 1920. 
-- Round the numbers you report to 2 decimal places. 
-- Do the same for home runs per game. Do you see any trends? Avg_strikeouts number has been inceasing each year, 
-- whereas the avg_homeruns number has not changed a lot over the years.

select round(sum(so)::numeric/(sum(g)/2),2) as strikeouts,
case when yearid >=1920 and yearid <=1929 then '1920s' 
	 when yearid between 1930 and 1939 then '1930s' 
	 when yearid between 1940 and 1949 then '1940s' 
	 when yearid between 1950 and 1959 then '1950s' 
	 when yearid between 1960 and 1969 then '1960s'	
	 when yearid between 1970 and 1979 then '1970s' 	 
	 when yearid between 1980 and 1989 then '1980s' 	 
	 when yearid between 1990 and 1999 then '1990s' 
	 when yearid between 2000 and 2009 then '2000s' 
	 when yearid between 2010 and 2016 then '2010s' 
	 ELSE 'Other' end as decade
from teams
where yearid between 1920 and 2017
group by decade
order by decade desc

with games as (select year, sum(games) as games
from homegames
group by year),

stats as (select yearid, sum(so) as strikeouts, sum(hr) as homeruns
from teams 
group by yearid)

select stats.yearid/10*10 as decade, round(sum(stats.strikeouts)/sum(games.games),2) as avg_strikeouts,
 round(sum(stats.homeruns)/sum(games.games),2) as avg_homeruns
 from stats
 inner join games
 on games.year=stats.yearid
 where yearid between 1920 and 2017
 group by decade 
 order by decade desc
 