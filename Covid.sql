select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2

select *
from PortfolioProject..CovidVaccinations


--population Vs. Fully_Vaccinated People in Percentage
select cd.date, cd.location, cd.population, cv.people_fully_vaccinated, (cv.people_fully_vaccinated/cd.population)*100 as FullyVaccinatedPercentage
from PortfolioProject..CovidDeaths as cd
join PortfolioProject..CovidVaccinations as cv
	on cd.location = cv.location
	and cd.date = cv.date
where cd.location like '%states%'
order by 1,2


--population Vs. total_deaths in Percentage
select date, location, population, total_deaths, (total_deaths/population)*100 as PercentagePopulationDeath
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

--Percentage of people that got covid vs people that died from covid
select date, location, population, total_cases, (total_cases/population)*100 as PercentPopulationGotCovid, 
total_deaths, (total_deaths/population)*100 as PercentagePopulationDeath
from PortfolioProject..CovidDeaths
where location like '%states'
order by 1,2

--Likelihood of dying
select date, location, total_cases, total_deaths, (total_deaths/total_cases)*100 as DyingChancesPercentage
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2


--Which country has the highest infestion rate by population
select location, population, MAX((total_cases/population))*100 as PopulationInfestedPercent
from PortfolioProject..CovidDeaths
group by location, population
order by PopulationInfestedPercent desc
