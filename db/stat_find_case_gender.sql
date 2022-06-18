select case when c.week is not null then c.week 
when d.week is not null then d.week
else d.week end as week,
case when c.male is null then 0 else c.male end as male,
case when d.female is null then 0 else d.female end as female,
case when e.other is null then 0 else e.other end as other
from
(select week, count(*) as male from	(
	select  date_trunc('week', date) - interval '1 day' as week
	from "Cases" a, "Customers" b where
	a.date >=to_date('01/01/2019','dd/MM/yyyy')
	and a.date <=to_date('01/09/2019','dd/MM/yyyy')
	and a."customerID" = b."customerID"
	and b.gender='男'
) b group by week) c
full outer join
(select week, count(*) as female from	(
	select  date_trunc('week', date) - interval '1 day' as week
	from "Cases" a, "Customers" b where
	a.date >=to_date('01/01/2019','dd/MM/yyyy')
	and a.date <=to_date('01/09/2019','dd/MM/yyyy')
	and a."customerID" = b."customerID"
	and b.gender='女'
) b group by week) d on c.week=d.week
full outer join
(select week, count(*) as other from	(
	select  date_trunc('week', date) - interval '1 day' as week
	from "Cases" a, "Customers" b where
	a.date >=to_date('01/01/2019','dd/MM/yyyy')
	and a.date <=to_date('01/09/2019','dd/MM/yyyy')
	and a."customerID" = b."customerID"
	and (b.gender is null or b.gender not in('女','男'))
) b group by week) e on c.week=e.week
order by c.week;
