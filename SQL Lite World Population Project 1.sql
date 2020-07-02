
-- How many years are covered is this dataset?
SELECT DISTINCT year from population_years;

-- What is the largest population size for Gabon in this data?
SELECT max(population) from population_years
WHERE country = 'Gabon';

-- What were the 10 lowest population countries in 2005?
SELECT country, population from population_years
WHERE year = 2005
order by population ASC
limit 10;

-- What are all the distinct countries with a population of over 100 million in the year 2010?
SELECT DISTINCT country from population_years
WHERE population > 100 AND year = 2010;

-- How many countries in this dataset have the word “Islands” in their name?
SELECT count(DISTINCT country) from population_years
WHERE country like '%Islands%';

-- What is the difference in population between 2000 and 2010 in Indonesia?
SELECT DISTINCT (SELECT population from population_years
		WHERE year = 2000 AND country = 'Indonesia')
		-
		(SELECT population from population_years
		WHERE year = 2010 AND country = 'Indonesia') AS Difference
from population_years;







