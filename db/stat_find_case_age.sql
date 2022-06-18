select d.week, sum("0-5") as "0-5", sum("6-10") as "6-10" ,
sum("0-5") as "0-5", sum("6-10") as "6-10" ,
sum("11-15") as "11-15", sum("16-20") as "16-20" ,
sum("21-25") as "21-25", sum("26-30") as "26-30" ,
sum("31-35") as "31-35", sum("36-40") as "36-40" ,
sum("41-45") as "41-45", sum("46-50") as "46-50" ,
sum("51-55") as "51-55", sum("56-60") as "56-60" ,
sum("61-65") as "61-65", sum("66+") as "66+" from (
select c.week, case when age<=5 then 1 else 0 end as "0-5",
case when age>=6 and age<=10 then 1 else 0 end as "6-10",
case when age>=11 and age<=15 then 1 else 0 end as "11-15",
case when age>=16 and age<=20 then 1 else 0 end as "16-20",
case when age>=21 and age<=25 then 1 else 0 end as "21-25",
case when age>=26 and age<=30 then 1 else 0 end as "26-30",
case when age>=31 and age<=35 then 1 else 0 end as "31-35",
case when age>=36 and age<=40 then 1 else 0 end as "36-40",
case when age>=41 and age<=45 then 1 else 0 end as "41-45",
case when age>=46 and age<=50 then 1 else 0 end as "46-50",
case when age>=51 and age<=55 then 1 else 0 end as "51-55",
case when age>=56 and age<=60 then 1 else 0 end as "56-60",
case when age>=61 and age<=65 then 1 else 0 end as "61-65",
case when age>=66 then 1 else 0 end as "66+" from (
select  date_trunc('week', date) - interval '1 day' as week, 
	EXTRACT(year FROM age(a."date",b."dateOfBirth")) :: int as age
	from "Cases" a, "Customers" b where
	a.date >=to_date('01/01/2018','dd/MM/yyyy')
	and a.date <=to_date('01/09/2019','dd/MM/yyyy')
	and a."customerID" = b."customerID") c
	) d group by d.week;