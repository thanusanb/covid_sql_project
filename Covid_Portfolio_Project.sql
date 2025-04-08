-- SELECT Data that we are going to be using 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths 

SELECT location, date, total_cases, total_deaths, (total_deaths::decimal/total_cases)*100 AS DeathPercentage
FROM covid_deaths
WHERE location Ilike '%states%'
ORDER BY 1,2

-- Looking at Total Cases vs Total Populations

SELECT location, date,population,total_cases,(total_cases::decimal/population)*100 AS Percentage
FROM covid_deaths
WHERE location Ilike '%states'
ORDER BY 1,2

-- Looking at countries with highest infection rate compared to population

SELECT location,population,MAX(total_cases) AS cases,MAX((total_cases::decimal/population))*100 AS population_infected
FROM covid_deaths
WHERE population IS NOT NULL AND total_cases IS NOT NULL
GROUP BY location,population
ORDER BY Population_Infected DESC

-- Showing countries with Highest Death Count per Population

SELECT location,population,MAX(total_deaths) AS deaths,MAX((total_deaths::decimal/population))*100 AS percentage_of_deaths
FROM covid_deaths
WHERE population IS NOT NULL AND total_deaths IS NOT NULL
GROUP BY location,population
ORDER BY percentage_of_deaths DESC

-- Showing total death count per country 

SELECT location, MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE total_deaths IS NOT NULL AND CONTINENT IS NOT NULL
GROUP BY 1
ORDER BY total_death_count DESC

-- Now by Contitent 

SELECT continent, MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE total_deaths IS NOT NULL AND CONTINENT IS NOT NULL
GROUP BY 1
ORDER BY total_death_count DESC

-- Global numbers 

SELECT date,SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths::decimal)/SUM(new_cases::decimal)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL 
GROUP BY date
ORDER BY 1,2

-- Looking at total population vs vacinations 

SELECT cd.continent,cd.location,cd.date,population,cv.new_vaccinations
, SUM(cv.new_vaccinations) OVER(PARTITION BY cd.location ORDER BY cd.date) AS total_vaccinations
FROM covid_deaths cd
JOIN covid_vaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL 
ORDER BY 2,3

-- Using CTE to see accumulated percentage of vaccinations 

WITH CTE_total_vaccines AS (
SELECT cd.continent,cd.location,cd.date,population,cv.new_vaccinations
, SUM(cv.new_vaccinations) OVER(PARTITION BY cd.location ORDER BY cd.date) AS total_vaccinations
FROM covid_deaths cd
JOIN covid_vaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL 
ORDER BY 2,3
)

SELECT *, (total_vaccinations/population)*100 AS percentage_vaccinated
FROM CTE_total_vaccines

-- Creating View to store data for later visualizations

CREATE VIEW PercentPopulationVaccinated AS
SELECT cd.continent,cd.location,cd.date,population,cv.new_vaccinations
, SUM(cv.new_vaccinations) OVER(PARTITION BY cd.location ORDER BY cd.date) AS total_vaccinations
FROM covid_deaths cd
JOIN covid_vaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL 
ORDER BY 2,3







