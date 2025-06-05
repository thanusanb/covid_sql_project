# 🦠 COVID-19 Data Exploration using SQL

## 📌 Overview
This project explores global COVID-19 trends using SQL on a public dataset. The goal is to derive insights about infection rates, mortality, and vaccination progress over time and by location. 

---

## 💡 Questions Answered

1. How do total cases and deaths evolve over time?
2. What percentage of each country’s population was infected?
3. Which countries had the highest death count relative to their population?
4. How do infection and death trends differ by continent?
5. What does global infection vs death rate look like over time?
6. How are vaccination efforts progressing around the world?
7. What percentage of a country's population has been vaccinated?

---

## 📂 Data Sources - Kaggle

- https://github.com/thanusanb/covid_sql_project/blob/main/CovidDeaths.xlsx#:~:text=t-,CovidDeaths,-.xlsx : Contains data on cases, deaths, and population by location and date.
- **`covid_vaccinations`**: Contains data on daily and cumulative vaccinations by country.


---

## 🧠 Key Insights

- Countries like the U.S. and Brazil showed early and sustained high infection and death rates.
- Some small countries had high percentages of their population infected, even if the absolute case count was lower.
- Death percentages (deaths / cases) remained under 10% globally, but varied greatly by region.
- Vaccination rates show significant disparities between continents and countries.
- Using window functions allows for tracking vaccination progress cumulatively per country over time.


---

## 👨‍💻 Author
Thanusan Baskaran — Aspiring Data Analyst | SQL, Excel, Data Visualization  
LinkedIn: www.linkedin.com/in/thanusan-baskaran-34a871197
