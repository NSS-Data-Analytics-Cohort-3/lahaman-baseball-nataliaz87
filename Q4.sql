/*Q4.Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", 
those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". */

select count(pos),
case when pos = 'OF' then 'Outfitted'
	 when pos in ('SS', '1B', '2B', '3B') then 'Infield'
	 when pos in ('P','C') then 'Battery'
	 ELSE 'Other' END as position_group
from fielding
group by position_group

--Determine the number of putouts made by each of these three groups in 2016.
select sum(po) As no_of_putouts,
case when pos = 'OF' then 'Outfitted'
	 when pos in ('SS', '1B', '2B', '3B') then 'Infield'
	 when pos in ('P','C') then 'Battery' END as position_group
	 from fielding
	 where yearid = 2016
	 group by position_group