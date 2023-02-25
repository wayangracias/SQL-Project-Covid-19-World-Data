--- COVID19 PORTFOLIO PROJECT ---

--- Skills required: selecting data from a table, joining data, ordering data,
--- doing simple mathematical functions, using CTE.

--- 1. Calculating total cases, deaths, vaccinations, CFR, percent population infected, dead and
--- vaccinated around the world
SELECT
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS percent_population_infected,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS percent_population_dead,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS percent_population_vaccinated
FROM coviddeaths as d
INNER JOIN covidvaccinations as v
ON d.location = v.location AND d.date = v.date

--- 2. Looking at top 10 countries with the highest cases, deaths, CFR, case percentage and death percentage
--- 2a. looking countries with the most cases
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
--- country with most cases: United States

--- 2b. looking at countries with the highest deaths
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10
--- country with the highest deaths: United States

--- 2c. looking at countries with the highest vaccinations
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 4 DESC
LIMIT 10
--- country with the highest vaccinations: China

--- 2d. looking at countries with the highest CFR (the most lethal)
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 5 DESC
LIMIT 10
--- country with the highest CFR: Yemen

---2e. looking at top 10 countries with the highest case percentage
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 6 DESC
LIMIT 10
--- Country with the highest case percentage: Cyprus

--- 2f. looking at top 10 countries with the highest death percentage
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 7 DESC
LIMIT 10
--- country with the highest death percentage: Peru

--- 2f. looking at top 10 countries with the highest vaccinations percentage
SELECT
d.location,
TO_CHAR(MAX(d.total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(d.total_deaths), '9,999,999,999,999') AS total_deaths,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
ROUND((MAX(d.total_deaths)/MAX(d.total_cases)*100),2) AS CFR,
ROUND((MAX(d.total_cases)/MAX(d.population)*100),2) AS case_percentage,
ROUND((MAX(d.total_deaths)/MAX(d.population)*100),2) AS death_percentage,
ROUND((MAX(v.people_vaccinated)/MAX(d.population)*100),2) AS vaccination_percentage
FROM coviddeaths AS d
INNER JOIN covidvaccinations AS v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
d.total_cases IS NOT NULL AND
d.total_deaths IS NOT NULL AND
v.total_vaccinations IS NOT NULL AND
v.people_vaccinated IS NOT NULL
GROUP BY 1
ORDER BY 8 DESC
LIMIT 10
--- country with the highest vaccination percentage: Gibraltar

--- 3. looking at total cases, deaths and CFR in each continent
SELECT
continent,
TO_CHAR(MAX(total_cases), '9,999,999,999,999') AS total_cases,
TO_CHAR(MAX(total_deaths), '9,999,999,999,999') AS total_deaths,
ROUND((MAX(total_deaths)/MAX(total_cases)*100),2) AS CFR
FROM coviddeaths
WHERE continent IS NOT NULL AND
total_cases IS NOT NULL AND 
total_deaths IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC, 3 DESC, 4 DESC

--- 4. categorizing the countries by CFR and calculating total of each CFR categories
WITH cfr_table AS
(
SELECT
	location,
	MAX(total_cases) AS total_cases,
	MAX(total_deaths) AS total_deaths,
	ROUND((MAX(total_deaths)/MAX(total_cases)*100),2) AS cfr
FROM coviddeaths
WHERE continent IS NOT NULL AND
	total_cases IS NOT NULL AND
	total_deaths IS NOT NULL
GROUP BY location
)
SELECT location,
		CASE
		WHEN cfr < 1 THEN 'Less than 1%'
		WHEN cfr >= 1 AND cfr < 2 THEN '1% to 2%'
		WHEN cfr >= 2 AND cfr < 5 THEN '2% to 5%'
		ELSE 'Greater than 5%'
		END AS cfr_category
FROM cfr_table
GROUP BY location, cfr_category
ORDER BY cfr_category DESC

--- calculating total number of countries in each category

WITH cfr_table 
AS
(
SELECT
	location,
	MAX(total_cases) AS total_cases,
	MAX(total_deaths) AS total_deaths,
	ROUND((MAX(total_deaths)/MAX(total_cases)*100),2) AS cfr
FROM coviddeaths
WHERE continent IS NOT NULL AND
	total_cases IS NOT NULL AND
	total_deaths IS NOT NULL
GROUP BY location
),
cfr_data AS
(
SELECT location,
		CASE
		WHEN cfr < 1 THEN 'Less than 1%'
		WHEN cfr >= 1 AND cfr < 2 THEN '1% to 2%'
		WHEN cfr >= 2 AND cfr < 5 THEN '2% to 5%'
		ELSE 'Greater than 5%'
		END AS cfr_category
FROM cfr_table
GROUP BY location, cfr_category
ORDER BY cfr_category
)
SELECT cfr_category, COUNT(*)
FROM cfr_data
GROUP BY cfr_category

--- 5. categorizing countries by percent population vaccinated
WITH popvac AS
(
SELECT 
d.location, d.population,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
TO_CHAR(MAX(v.people_vaccinated), '9,999,999,999,999') AS people_vaccinated,
ROUND(MAX(v.people_vaccinated)/MAX(d.population)*100,2) AS percent_population_vaccinated
FROM coviddeaths as d
INNER JOIN covidvaccinations as v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
	v.total_vaccinations IS NOT NULL AND
	v.people_vaccinated IS NOT NULL
GROUP BY d.location, d.population
)
SELECT 
	location, 
	population, 
	total_vaccinations, 
	people_vaccinated, 
	percent_population_vaccinated,
	CASE
	WHEN percent_population_vaccinated < 20 THEN 'Less than 20%'
	WHEN percent_population_vaccinated < 40 THEN '20% - 40%'
	WHEN percent_population_vaccinated < 60 THEN '40 - 60%'
	ELSE 'Greater than 60%'
	END AS vaccination_rate
FROM popvac
GROUP BY 1,2,3,4,5
ORDER BY vaccination_rate DESC

--- calculating the number of countries in each vaccination categories
WITH popvac AS
(
SELECT 
d.location, d.population,
TO_CHAR(MAX(v.total_vaccinations), '9,999,999,999,999') AS total_vaccinations,
TO_CHAR(MAX(v.people_vaccinated), '9,999,999,999,999') AS people_vaccinated,
ROUND(MAX(v.people_vaccinated)/MAX(d.population)*100,2) AS percent_population_vaccinated
FROM coviddeaths as d
INNER JOIN covidvaccinations as v
ON d.location = v.location AND d.date = v.date
WHERE d.continent IS NOT NULL AND
	v.total_vaccinations IS NOT NULL AND
	v.people_vaccinated IS NOT NULL
GROUP BY d.location, d.population
), 
vac_rate_table AS
(
SELECT 
	location, 
	population, 
	total_vaccinations, 
	people_vaccinated, 
	percent_population_vaccinated,
	CASE
	WHEN percent_population_vaccinated < 20 THEN 'Less than 20%'
	WHEN percent_population_vaccinated < 40 THEN '20% - 40%'
	WHEN percent_population_vaccinated < 60 THEN '40 - 60%'
	ELSE 'Greater than 60%'
	END AS vaccination_rate
FROM popvac
GROUP BY 1,2,3,4,5
ORDER BY vaccination_rate DESC
)
SELECT vaccination_rate, COUNT(*)
FROM vac_rate_table
GROUP BY 1
ORDER BY 1 DESC