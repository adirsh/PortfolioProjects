-- looking at total_cases vs total_deaths
-- shows likelihood of dying if you contract with covid in your country
select  date, total_cases, total_deaths, ((total_deaths*100)/total_cases) as precentage_deaths
from CovidDeaths
order by 3,4

-- looking at countries with the must infection rate compared the population
select location, population, max(total_cases) as HighestInfection, max(total_cases*100/population) as  PrecentPopulationInfection
from CovidDeaths
group by location,population
order by PrecentPopulationInfection desc


Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2
