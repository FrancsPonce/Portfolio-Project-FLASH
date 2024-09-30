

--select * from [Portafolio Project]..CovidVaccinations$

-- Select Data that we are going to USE

SELECT Location, date, total_cases, new_cases,total_deaths, population
FROM [Portafolio Project]..CovidDeaths$
order by 1,2

-- Looking Total Cases VS Total Deaths
-- Shows the probability of death cuz Covid

SELECT Location, date, total_cases, total_deaths, (total_deaths/NULLIF(total_cases,0))*100 as Death_Percentage
FROM [Portafolio Project]..CovidDeaths$
WHERE location like '%chile%' 
order by 1,2

-- Looking Total Cases VS Population
---- Shows what percentage of the population got Covid

SELECT Location, date, total_cases, population, (total_cases/NULLIF(population,0))*100 as Infection_rate
FROM [Portafolio Project]..CovidDeaths$
WHERE location like '%chile%' 
order by 1,2

-- Country with the Highest Infection Rate

SELECT Location, MAX(total_cases) as Infection_count, population, MAX( (total_cases/NULLIF(population,0)) )*100 as Infection_rate
FROM [Portafolio Project]..CovidDeaths$
--WHERE location like '%chile%' 
GROUP BY location, population
order by Infection_rate DESC

-- Country with the Highest Death Rate

SELECT Location,MAX(cast(total_deaths as bigint)) as Total_death_count
FROM [Portafolio Project]..CovidDeaths$
--WHERE location like '%chile%' 
WHERE continent is not null
GROUP BY location
order by Total_death_count DESC

-- Continent with the Highest Death Rate

SELECT location,MAX(cast(total_deaths as bigint)) as Total_death_count
FROM [Portafolio Project]..CovidDeaths$
--WHERE location like '%chile%' 
WHERE continent is null
GROUP BY location
order by Total_death_count DESC


