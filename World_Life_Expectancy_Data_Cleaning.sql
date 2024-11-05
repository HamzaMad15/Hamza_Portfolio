

SELECT *
FROM world_life_expectancy;


SELECT Country, Year, CONCAT(Country, Year), count(CONCAT(Country, Year))
FROM world_life_expectancy
Group by Country, Year, Concat(Country, Year)
Having count(CONCAT(Country, Year)) > 1
;

Select Row_ID
From(
	Select Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER( partition by CONCAT(Country, Year) ORDER by CONCAT(Country, Year)) as Row_Num
	From world_life_expectancy
    ) As Row_table
WHere row_num > 1
;


DELETE FROM world_life_expectancy
Where
	ROW_ID IN(
    Select Row_ID
From(
	Select Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER( partition by CONCAT(Country, Year) ORDER by CONCAT(Country, Year)) as Row_Num
	From world_life_expectancy
    ) As Row_table
WHere row_num > 1

   
)
;
Select *
From world_life_expectancy
where status = ''
;

Select DISTINCT(status)
From world_life_expectancy
where status <> ''
;

Select distinct(country)
From world_life_expectancy
where status = 'Developing'
;

UPDATE world_life_expectancy
SET status = 'Developing'
Where Country IN (Select distinct(country)
From world_life_expectancy
where status = 'Developing');

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
Set t1.status = 'Developing'
Where t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developing'
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
Set t1.status = 'Developed'
Where t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed'
;

Select *
From world_life_expectancy
#Where `Life expectancy` = ''
;

Select Country, Year, `Life expectancy`
From world_life_expectancy
Where `Life expectancy` = ''
;

Select t1.Country, t1.Year, t1.`Life expectancy`, t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3. `Life expectancy`)/2,1)
From world_life_expectancy t1
Join world_life_expectancy t2
	on t1.country = t2.country
    AND t1.Year = t2.Year - 1
Join world_life_expectancy t3
	on t1.country = t3.country
    AND t1.Year = t3.Year + 1
Where t1.`Life expectancy` = ''
;

UPDATE world_life_expectancy t1
Join world_life_expectancy t2
	on t1.country = t2.country
    AND t1.Year = t2.Year - 1
Join world_life_expectancy t3
	on t1.country = t3.country
    AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3. `Life expectancy`)/2,1)
Where t1.`Life expectancy` = ''
;







