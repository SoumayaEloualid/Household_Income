# Household Income Data Analysis

## Overview  
This project focuses on cleaning and analyzing the **US Household Income Dataset**. The analysis involves removing duplicates, unifying data formats, and exploring various insights, such as top states by land and water area, household income distribution, and city rankings based on income.

## Dataset Details  
The project uses two main tables:  
1. **`us_household_income_statistics`**  
   - Contains household income statistics like Mean and Median income.  
2. **`us_household_income`**  
   - Includes location details such as State Name, City, Type, and land/water area.  

## Objectives  
- Clean and preprocess the dataset for consistency and accuracy.  
- Perform exploratory data analysis (EDA) to extract meaningful insights.  
- Present findings for better understanding of household income distribution in the U.S.

## SQL Queries  
Key queries used for this analysis include:  
- Checking and removing duplicate entries.  
- Standardizing and unifying inconsistent data.  
- Grouping and ordering data for insights.  
- Performing joins to combine relevant data for analysis.


## Insights  
1. The states with the largest land areas include Alaska, Texas, and California.  
2. States with the lowest average household income are predominantly rural.  
3. Boroughs, Counties, and Communities show varying income trends, with Boroughs having the highest average income.  
4. Cities like **San Francisco** and **New York** lead in average household income.

## How to Use This Repository  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/household-income-analysis.git
   ```
2. Load the datasets into a SQL-compatible database.  
3. Run the provided SQL scripts to replicate the cleaning and analysis.

## Tools Used  
- **SQL Database**: MySQL  
- **Data Source**: US Household Income Dataset  

---

