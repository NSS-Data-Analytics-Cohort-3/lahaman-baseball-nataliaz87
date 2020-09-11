-- Q3.Find all players in the database who played at Vanderbilt University. 
with vandy_players as (
select distinct playerid, schoolid
from collegeplaying 
where schoolID like 'vandy'
)

/*select distinct p.playerid, schoolid
from collegeplaying as c
left join people as p
on c.playerid=p.playerid
left join salaries as s
on c.playerid = s.playerid
where schoolid like 'vandy' and salary is not null

-- Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
select distinct p.playerid, namefirst, namelast, sum(s.salary) as total_salary, schoolid
from collegeplaying as c
left join salaries as s
on c.playerid = s.playerid
left join people as p
on c.playerid = p.playerid
where schoolid like 'vandy' and salary is not null
group by p.playerid, c.schoolid*/

--Sort this list in descending order by the total salary earned. 
select namefirst, namelast, sum(s.salary)::numeric::money as total_salary, schoolid
from vandy_players as v
left join salaries as s
on v.playerid = s.playerid
left join people as p
on v.playerid = p.playerid
where salary is not null
group by p.playerid, v.schoolid
order by total_salary desc

-- Which Vanderbilt player earned the most money in the majors? David Price