SELECT * 
FROM us_household_income.us_household_income_statistics;

SELECT * 
FROM us_household_income.us_household_income;

ALTER TABLE  us_household_income_statistics 
RENAME COLUMN `ï»¿id` TO `id`
;

SELECT COUNT(id)
FROM us_household_income
;

SELECT COUNT(id)
FROM us_household_income_statistics
;

#CHECK FOR DUPLICATES
SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING count(id) > 1
;
#REMOVE DUPLICATES us_household_income_statistics
DELETE FROM us_household_income_statistics
WHERE id IN (
SELECT *
FROM (
    SELECT 
        id, 
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS Number_Row
    FROM us_household_income_statistics
) AS RankedRows
WHERE Number_Row > 1)
;
#REMOVE DUPLICATES us_household_income
DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM (
    SELECT 
        row_id,  
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS Number_Row
    FROM us_household_income
) AS RankedRows
WHERE Number_Row > 1)
;

SELECT State_Name, COUNT(State_Name)
FROM us_household_income
GROUP BY State_Name
;

#Unify state name
UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name like 'georia'
;

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT State_ab, COUNT(State_ab)
FROM us_household_income
GROUP BY State_Name
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE row_id = 32 ;

#Unify Type
UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

#EXPLORATORY DATA ANALYST 

#TOP 10 STATES BY SUM OF ALAND AND AWATER 
SELECT State_Name , SUM(ALand), SUM(AWater)
FROM us_household_income 
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

#Five Lowest average income for the entire household
SELECT u.State_Name, ROUND(AVG(MEAN),1), ROUND(AVG(MEDIAN),1)
FROM us_household_income.us_household_income U
INNER JOIN us_household_income.us_household_income_statistics us
ON u.id= us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5
;

#the average mean and median income for each household type, grouping by type and ordering by average mean income.
SELECT Type , ROUND(AVG(MEAN),1), ROUND(AVG(MEDIAN),1)
FROM us_household_income.us_household_income U
INNER JOIN us_household_income.us_household_income_statistics us
ON u.id= us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 2
;


SELECT * 
FROM us_household_income.us_household_income
WHERE Type = 'Community';

# Highest average household income cities
SELECT u.State_Name, City, ROUND(AVG(MEAN),1)
FROM us_household_income.us_household_income U
INNER JOIN us_household_income.us_household_income_statistics us
ON u.id= us.id
GROUP BY 1,2
ORDER BY 3 desc;
