/*
1. Observe the result of running this SQL command to show the name, continent and population of all countries.
*/

SELECT NAME,
       continent,
       population
FROM   world; 

/*
2. How to use WHERE to filter records. 
Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
*/

SELECT NAME
FROM   world
WHERE  population >= 200000000; 

/*
3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

HELP:How to calculate per capita GDP
per capita GDP is the GDP divided by the population GDP/population
*/ 

SELECT NAME,
       gdp / population
FROM   world
WHERE  population >= 200000000;

/*
4. Show the name and population in millions for the countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions.
*/ 

SELECT NAME,
       ( population / 1000000 ) AS population
FROM   world
WHERE  continent = 'South America';

/*
5. Show the name and population for France, Germany, Italy
*/

SELECT NAME,
       population
FROM   world
WHERE  NAME IN ( 'France', 'Germany', 'Italy' );

/*
6. Show the countries which have a name that includes the word 'United'
*/

SELECT NAME
FROM   world
WHERE  NAME LIKE '%United%'; 

/*
7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.
*/

SELECT NAME,
       population,
       area
FROM   world
WHERE  area > 3000000
        OR population > 250000000; 

/*
8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. 
Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
*/

SELECT name,
       population,
       area
FROM   world
WHERE  area > 3000000 XOR population > 250000000; 

/*
9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions
Divide by 1000000 (6 zeros) for millions. Divide by 1000000000 (9 zeros) for billions. 
Don't use exponential notation (1E06 or 1E09).
*/

SELECT NAME,
       Round(population / 1000000, 2),
       Round(gdp / 1000000000, 2)
FROM   world
WHERE  continent = 'South America'; 

/*
9. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; 
that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.
*/

SELECT NAME,
       Round(gdp / population, -3)
FROM   world
WHERE  gdp >= 1000000000000; 

/*
11. Greece has capital Athens.
Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters
*/

SELECT NAME,
       capital
FROM   world
WHERE  Length(NAME) = Length(capital); 

/*
12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. 
Don't include countries where the name and the capital are the same word.
*/

SELECT NAME,
       capital
FROM   world
WHERE  LEFT(NAME, 1) = LEFT(capital, 1)
       AND NAME <> capital; 

/*
13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. 
They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.
*/

SELECT NAME
FROM   world
WHERE  NAME LIKE '%a%'
       AND NAME LIKE '%e%'
       AND NAME LIKE '%i%'
       AND NAME LIKE '%o%'
       AND NAME LIKE '%u%'
       AND NAME NOT LIKE '% %';
