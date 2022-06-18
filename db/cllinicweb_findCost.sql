select A."caseID", A."date", A."problem", A."dosage", A."dosePrice", A."consultationFee", A."price",
case when A."price" is null or price=0 then A."dosage"*70+60 else A."price" end as "price2"
from "Cases" A, "Customers" B 
where A."customerID" = B."customerID"
and B."name" IN ('馬天倫','馬衛理','吳蕙儀') and A."date" >= to_date('20170713','yyyyMMdd')
order by date desc;

select sum("price2") from
(
select A."caseID", A."date", A."problem", A."dosage", A."dosePrice", A."consultationFee", A."price",
case when A."price" is null or price=0 then A."dosage"*70+60 else A."price" end as "price2"
from "Cases" A, "Customers" B 
where A."customerID" = B."customerID"
and B."name" IN ('馬天倫','馬衛理','吳蕙儀') and A."date" >= to_date('20170713','yyyyMMdd')) C