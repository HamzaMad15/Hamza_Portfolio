


Select *
from us_household_income
;

Select *
from us_household_income_statistics
;

Select State_Name, SUM(ALand), SUM(AWater)
from us_household_income
Group By State_Name
Order by 3 desc
Limit 10;

Select *
from us_household_income u
Join us_household_income_statistics us
	On u.id = us.id
    ;
 
Select u.State_Name, County, Type, `Primary`, Mean, Median
from us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
Where Mean <> 0;

Select u.State_Name, AVG(Mean), AVG(Median)
from us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
Where Mean <> 0
Group By u.State_Name
Order by 3 asc
Limit 20
;

Select Type, Count(Type), ROUND(AVG(Mean),1), Round(AVG(Median),1)
from us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
Where Mean <> 0
Group by 1
order by 4 desc
Limit 20
;

Select *
From us_household_income
Where Type = 'Community';

Select u.State_Name, City, Round(AVG(Mean),1)
From us_household_income u
Join us_household_income_statistics us
	on u.id = us.id;
Group by u.State_Name, City
order by City desc


 