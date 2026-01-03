# Crime Rate vs Unemployment Rate Analysis (Global)

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

### Step 2 — Correlation Analysis
A Pearson correlation coefficient was calculated to measure the relationship between unemployment rate and crime rate.

- **Correlation value:** `0.26`

**Interpretation:**  
This indicates a **weak positive relationship**, suggesting that higher unemployment is associated with higher crime rates, but unemployment alone does not strongly predict crime.

---

### Step 3 — Grouping Countries by Unemployment Level
Countries were categorized into three groups:
- Low unemployment
- Medium unemployment
- High unemployment

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
|country_name       |unemployment_rate|crime_rate|
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

## 👤 Analyst: **Eliza C. Huang**  
Data Analyst with a background in UX research and data-driven analysis.  
Interested in roles within public policy, NGOs, human rights, and social impact organizations.

---

## 📎 Portfolio
More projects and visualizations available on:
- GitHub: https://github.com/elizachuang
- Instagram (data visualizations): https://www.instagram.com/datadrawers/
