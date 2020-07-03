-- How many entries in the database are from Africa?

SELECT Count(name) from countries
WHERE continent = 'Africa';

-- What was the total population of Oceania in 2005?

With CombinedTable AS (
SELECT * from countries
JOIN population_years on countries.id = population_years.country_id)

SELECT sum(population) from CombinedTable
WHERE continent = 'Oceania' AND year = 2005;


-- What is the average population of countries in South America in 2003?

With CombinedTable AS (
SELECT * from countries
JOIN population_years on countries.id = population_years.country_id)

SELECT avg(population) from CombinedTable
WHERE continent = 'South America' AND year = 2003;

-- What country had the smallest population in 2007?

With CombinedTable AS (
SELECT * from countries
JOIN population_years on countries.id = population_years.country_id)

SELECT name from CombinedTable
WHERE year = 2007 AND population IS NOT NULL
ORDER by population ASC
LIMIT 1;

-- What is the average population of Poland during the time period covered by this dataset?

With CombinedTable AS (
SELECT * from countries
JOIN population_years on countries.id = population_years.country_id)

SELECT avg(population) from CombinedTable
WHERE name = 'Poland';

-- How many countries have the word "The" in their name?

SELECT count(name) from countries
WHERE name like '%The%';


-- What was the total population of each continent in 2010?

With CombinedTable AS (
SELECT * from countries
JOIN population_years on countries.id = population_years.country_id)

SELECT continent, sum(population) from CombinedTable
WHERE year = 2010
GROUP by 1
ORDER by 2 DESC;

