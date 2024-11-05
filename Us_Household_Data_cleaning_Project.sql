

SELECT *
FROM us_project.us_household_income;

Alter Table us_project.us_household_income_statistics rename column `ï»¿id` to `id`;

SELECT * 
FROM us_project.us_household_income_statistics;

SELECT Count(id)
FROM us_project.us_household_income;

SELECT Count(id)
FROM us_project.us_household_income_statistics;


Select id, count(id)
from us_project.us_household_income
Group by Id
Having Count(id) > 1
;


select *
from (
Select row_id,
id,
Row_Number() Over(Partition by id Order by id) row_num
From us_project.us_household_income
) duplicates
where row_num > 1
;

Delete from us_household_income
Where row_id IN (
select row_id
from (
Select row_id,
id,
Row_Number() Over(Partition by id Order by id) row_num
From us_project.us_household_income
) duplicates
where row_num > 1)
;

Select Distinct State_Name
from us_project.us_household_income
Order by 1
;

Update us_project.us_household_income
Set State_Name = 'Georgia'
Where State_name = 'georia';

Update us_project.us_household_income
Set State_Name = 'Alabama'
Where State_name = 'alabama';

Select *
From us_project.us_household_income
Where County = 'Autauga County'
Order by 1
;

Update us_household_income
Set Place = 'Autaugaville'
Where County = 'Autauga County'
And City = 'Vinemont';

Select Type, Count(Type)
From us_project.us_household_income
Group by Type
;


Update us_household_income
Set type = 'Borough'
Where Type = 'Boroughs'
;

Select ALand, AWater
From us_project.us_household_income
Where AWater = 0 or AWater= '' or AWater is Null
And ALand = 0 or ALand= '' or ALand is Null









