-- What range of years does the provided database cover?
-- 1871 - min
select min (Managers.yearid) as Managers_min
from Managers 

-- 2017 - max
select max (yearid)
from HallOfFame 