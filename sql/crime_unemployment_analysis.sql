---Step 1 Check all values, confirms data is readable and look correct
SELECT *
FROM unemployment_vs_crime uvc 
LIMIT 10;

---Step 2 count null values 
SELECT
  COUNT(*) AS total_rows,
  COUNT(crime_rate) AS non_null_crime_rate,
  COUNT(unemployment_rate) AS non_null_unemployment_rate
FROM unemployment_vs_crime;

---Step 3 Identify where the missing values are
SELECT *
FROM unemployment_vs_crime
WHERE crime_rate IS NULL
   OR unemployment_rate IS NULL;

---Step 4 Drop rows with NULL values, create a new table
CREATE TABLE unemployment_vs_crime_cleaned AS
SELECT
  country_name,
  crime_rate,
  unemployment_rate
FROM unemployment_vs_crime
WHERE crime_rate IS NOT NULL
  AND unemployment_rate IS NOT NULL;

---Step 5 confirm the table works
SELECT
  COUNT(*) AS total_rows,
  COUNT(crime_rate) AS crime_count,
  COUNT(unemployment_rate) AS unemployment_count
FROM unemployment_vs_crime_cleaned;

---Step 6 Find out the answer for the question 'Is there a relationship between unemployment rate and crime rate?'
SELECT
  CORR(unemployment_rate, crime_rate) AS correlation_value
FROM unemployment_vs_crime_cleaned;

--- The correlation value = 0.26, which suggests a weak positive relationship between unemployment and 
--- crime rates. This indicates that higher unemployment is associated with slightly higher crime levels, 
--- but the relationship is not strong, implying that crime is influenced by multiple factors beyond unemployment alone.

--- Step 7 Find out the answer for the question 'Do countries with higher unemployment tend to experience higher crime rates?'
--- Group the country by the unemployment level
select 
	case 
		when unemployment_rate < 5 THEN 'Low unemployment'
		when unemployment_rate BETWEEN 5 and 10 then 'Medium unemployment'
		else 'high unemployment' 
		end as unemployment_group,
	COUNT(*) as country_count,
	ROUND(AVG(crime_rate), 2) as avg_crime_rate
from unemployment_vs_crime_cleaned 
group by unemployment_group 
order by avg_crime_rate DESC;

--- Group results
---| Unemployment Group  | Avg Crime Rate |
---| ------------------- | -------------- |
---| Low unemployment    | 43.17          |
---| Medium unemployment | 45.48          |
|--- High unemployment   | 49.41          |

---The results show a gradual increase in average crime rates as unemployment levels rise. Countries with high unemployment exhibit higher average crime rates compared to those with medium and low unemployment. This suggests a positive association between unemployment and crime at an aggregated level.
---However, the differences are moderate, indicating that unemployment alone does not fully explain variations in crime rates. Other socioeconomic factors such as income inequality, education, urbanization, and law enforcement effectiveness are likely to play significant roles.


--- Step 8 Top 10 unemployment countries
select country_name,
	unemployment_rate,
	crime_rate
from unemployment_vs_crime_cleaned
order by unemployment_rate desc
limit 10;

--- The top 10 countries with the highest unemployment rates show consistently elevated 
--- crime levels. South Africa records the highest unemployment rate (33%) alongside 
--- a high crime rate (75), while Haiti exhibits one of the highest crime rates (77) 
--- despite a lower unemployment rate (15%). Several countries, including Namibia, Angola, 
--- and Libya, display both high unemployment and high crime rates, 
--- suggesting potential socioeconomic stress.

--- However, variation exists within this group. 
--- For example, Jordan and Montenegro maintain relatively lower crime rates despite elevated 
--- unemployment, indicating that unemployment alone does not fully explain crime levels. 
--- These findings highlight the importance of considering additional factors such as 
--- governance, social stability, and law enforcement when interpreting 
--- unemployment–crime relationships.

--- Step 9 Country that has high unemployment but low crime
select country_name,
	unemployment_rate,
	crime_rate
from unemployment_vs_crime_cleaned
where unemployment_rate > 10
order by crime_rate asc
limit 10;

--- Step 10 Country that has low unemployment but high crime
select country_name,
	unemployment_rate,
	crime_rate
from unemployment_vs_crime_cleaned
where unemployment_rate < 5
order by crime_rate desc
limit 10;
--- In these countries, high job availability fails to curb crime. 
--- This suggests that the high crime rates are primarily driven by non-unemployment factors, 
--- such as: High income inequality. political Instability, curroption, Drug and Gang Violence.

--- Summary table
SELECT
  country_name,
  ROUND(unemployment_rate, 2) AS unemployment_rate,
  ROUND(crime_rate, 2) AS crime_rate
FROM unemployment_vs_crime_cleaned
ORDER BY unemployment_rate DESC;


