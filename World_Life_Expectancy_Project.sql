# World Life Expectancy Project (Exploratory Data Analysis)

Select *
from world_life_expectancy
;

Select Country, MIN(`Life expectancy`), MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) as Life_Increase_15_Years
from world_life_expectancy
Group by Country
Having MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
Order by Life_Increase_15_Years asc
;

Select Year, Round(avg(`Life expectancy`),2)
from world_life_expectancy
Group by Year
Order by Year
;

Select Year, Round(avg(`Life expectancy`),2)
from world_life_expectancy
Where `Life expectancy` <> 0
And `Life expectancy` <> 0
Group by Year
Order by Year
;

Select Country, round(AVG(`Life expectancy`),1) As Life_Exp, Round(Avg(GDP),1) as GDP
from world_life_expectancy
Group by country
Having Life_Exp > 0
And GDP > 0
Order by GDP desc
;

Select 
Sum(Case When GDP >= 1500 Then 1 Else 0 End) High_GDP_Count,
AVG(Case When GDP >= 1500 Then `Life expectancy` Else Null End) High_GDP_Life_expectancy,
Sum(Case When GDP <= 1500 Then 1 Else 0 End) Low_GDP_Count,
AVG(Case When GDP <= 1500 Then `Life expectancy` Else Null End) Low_GDP_Life_expectancy
from world_life_expectancy;

Select Status, Round(avg(`Life expectancy`),1)
from world_life_expectancy
Group by Status;

Select Status, Count(distinct Country), Round(avg(`Life expectancy`),1)
from world_life_expectancy
Group by Status
;

Select Country, round(AVG(`Life expectancy`),1) As Life_Exp, Round(Avg(BMI),1) as BMI
from world_life_expectancy
Group by Country
Having Life_Exp > 0
And BMI > 0
Order by BMI asc
;

Select Country,
Year,
`Life expectancy`,
`Adult Mortality`,
Sum(`Adult Mortality`) Over(Partition by Country Order by Year) AS Rolling_total
from world_life_expectancy
Where Country Like '%United%'
;


