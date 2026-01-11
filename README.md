# Crime Rate vs Unemployment Rate Analysis (Global)

<img width="auto" height="auto" alt="A horizontal banner with a clean white background. On the left side, bold blue text asks the question, DOES LOW UNEMPLOYMENT MEAN LOW CRIME? On the right side, there is a large, faint, light-blue graphic of a human fingerprint, which is partially cropped by the edge of the frame." src="https://github.com/user-attachments/assets/e1f516a4-51b5-4598-9ef2-d47be539c41e" />


## 📌 Project Overview
- This project explores the relationship between unemployment rates and crime rates across countries. Using publicly available datasets, the analysis investigates whether higher unemployment is associated with higher crime levels and identifies notable outliers that challenge this assumption.
---

## 🎯 Key Questions
- Is there a relationship between unemployment rate and crime rate across countries?
- Do countries with higher unemployment tend to experience higher crime rates?
- Are there notable outliers that challenge the unemployment–crime assumption?

---

## 🧰 Tools & Technologies
- **SQL (PostgreSQL)** – data cleaning, aggregation, correlation analysis
- **DBeaver** – SQL development environment
- **Excel** – initial data inspection and cleaning
- **Canva** – data visualization
- **GitHub** – version control and documentation

---

## 📊 Data Sources
- World Population Review
- World Bank Group 
- Trading Economics
---

## 🧹 Data Cleaning & Preparation
Key preparation steps included:
- Importing CSV data into PostgreSQL tables
- Verifying data types for numerical fields
- Checking for missing values
- Removing rows with NULL values in unemployment or crime rate fields

---

## 🔍 Analysis Steps

### Step 1 — Data Validation
Confirmed that all records used in analysis contained valid unemployment and crime rate values.
```
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

```

### Step 2 — Correlation Analysis
A Pearson correlation coefficient was calculated to measure the relationship between unemployment rate and crime rate.
```
SELECT
  CORR(unemployment_rate, crime_rate) AS correlation_value
FROM unemployment_vs_crime_cleaned;
```
- **Correlation value:** `0.26`

**Interpretation:**  
This indicates a **weak positive relationship**, suggesting that higher unemployment is associated with higher crime rates, but unemployment alone does not strongly predict crime.

---

### Step 3 — Grouping Countries by Unemployment Level
Countries were categorized into three groups:
- Low unemployment
- Medium unemployment
- High unemployment
```
SELECT 
	CASE
		WHEN unemployment_rate < 5 THEN 'Low unemployment'
		WHEN unemployment_rate BETWEEN 5 AND 10 THEN 'Medium unemployment'
		ELSE 'high unemployment' 
		END AS unemployment_group,
	COUNT(*) as country_count,
	ROUND(AVG(crime_rate), 2) AS avg_crime_rate
FROM unemployment_vs_crime_cleaned 
GROUP BY unemployment_group 
ORDER BY avg_crime_rate DESC;
```

Average crime rates were calculated for each group.

| Unemployment Group | Avg Crime Rate |
|-------------------|----------------|
| Low               | 43.17          |
| Medium            | 45.48          |
| High              | 49.41          |

**Interpretation:**  
Crime rates increase gradually as unemployment levels rise. While this supports a positive association, the differences are moderate, indicating that additional socioeconomic factors influence crime levels.

---

### Step 4 — Top 10 Countries by Unemployment Rate
A focused analysis of the highest-unemployment countries highlights variation within this group.

```
SELECT country_name,
	unemployment_rate,
	crime_rate
FROM unemployment_vs_crime_cleaned
ORDER BY unemployment_rate DESC
LIMIT 10;

```

| Country        | Unemployment Rate | Crime Rate |
|----------------|-------------------|------------|
| South Africa   | 33%               | 75         |
| Botswana       | 23%               | 52         |
| Namibia        | 19%               | 63         |
| Jordan         | 18%               | 40         |
| Libya          | 18%               | 60         |
| Tunisia        | 16%               | 44         |
| Iraq           | 15%               | 44         |
| Haiti          | 15%               | 77         |
| Montenegro     | 14%               | 38         |
| Angola         | 14%               | 66         |




### Step 5 - Top 10 Countries that has low unemployment but high crime

```
SELECT country_name,
	unemployment_rate,
	crime_rate
FROM unemployment_vs_crime_cleaned
WHERE unemployment_rate < 5
ORDER BY crime_rate DESC
LIMIT 10;

```
|     Country       |Unemployment Rate|Crime Rate|
|-------------------|-----------------|----------|
|Papua New Guinea   |2%               |79        |
|Trinidad and Tobago|4%               |70        |
|Jamaica            |4%               |68        |
|Peru               |4%               |67        |
|Nigeria            |2%               |66        |
|Bolivia            |3%               |64        |
|Mozambique         |3%               |63        |
|Cameroon           |3%               |63        |
|Ecuador            |4%               |62        |
|Bangladesh         |4%               |61        |


**Insight:**  
While high unemployment often coincides with high crime, countries such as Jordan and Montenegro show relatively lower crime rates, suggesting that governance, social stability, and policy interventions play important roles.

---

## ✅ Key Findings
- There is a **weak positive relationship** between unemployment and crime globally.
- Countries with higher unemployment tend to have higher average crime rates.
- Significant variation exists, indicating unemployment is not the sole driver of crime.
- Social, political, and institutional factors likely influence crime outcomes.

<img width="250" height="auto" alt="A horizontal bar chart comparing eight countries with low unemployment rates (all under 4%) against high crime indices, ranging from Uganda at 55.00 to Papua New Guinea at 79.70" src="https://github.com/user-attachments/assets/9dd32d7e-950c-4fd0-a9d2-c91c34ddaaa5" />
<img width="250" height="auto" alt="A horizontal bar chart illustrating seven countries where high unemployment (15.52% to 33.17%) correlates with high crime indices (40.40 to 75.40), with South Africa leading in both categories." src="https://github.com/user-attachments/assets/10bfa95e-846b-457a-93db-f8f6e33e3824" />

---

## ⚠️ Limitations
- Crime rate data is index-based and may vary in methodology by country.
- Analysis is cross-sectional and does not imply causation.
- Other variables (income inequality, education, policing, urbanization) were not included.

---

## 🚀 Future Improvements
- Include additional socioeconomic variables such as GDP, education, inequality rates
- Perform a time-series analysis where data is available
- Create interactive dashboards using Power BI or Tableau
---
## 👤 Contact
- Eliza C. Huang | Data Analyst with a background in UX and data-driven analysis. Interested in roles within public policy, NGOs, human rights, and social impact organizations.
- Data Visualizations: Instagram – @DataDrawers 
- LinkedIn: [https://www.linkedin.com/in/chuyunh/]
