USE world;

SELECT COUNT(*) AS TotalCitiesInUSA
FROM City
WHERE CountryCode = 'USA';

SELECT *
FROM city;

SELECT name, LifeExpectancy
FROM Country
ORDER BY LifeExpectancy DESC
LIMIT 5;

SELECT 
    Name AS CityName,
    COUNT(*) AS Frequency
FROM 
    City
GROUP BY 
    Name
ORDER BY 
    Name ASC
    LIMIT 100;
    
    SELECT *
    FROM country;
    
    SELECT `name`, `population`
    FROM `city`
    ORDER BY `population` ASC
    LIMIT 1;
    
    SELECT `Name`, `HeadOfState` AS 'capital'
    FROM `country`
    WHERE `Name` = 'Spain';
    
    SELECT city.Name AS Capital
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Name = 'Spain';

SELECT city.Name AS European''Cities
FROM `country`
JOIN city ON country.continent = city.ID
WHERE country.continent = 'Europe';

SELECT `Continent`
FROM `country`
WHERE continent = 'Europe';

SELECT city.Name AS 'European Cities'
FROM `city`
JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe'
ORDER BY 'city.Name' ASC;


    SELECT 
    country.Name AS `Country`,
    SUM(city.Population) AS `Total Population`,
    AVG(city.Population) AS `Average City Population`
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
ORDER BY country.Name ASC;

SELECT *
FROM city;

SELECT 
    country.Name AS 'Country',
    city.Name AS 'Capital City',
    city.Population AS 'Population'
FROM country
JOIN city ON country.Capital = city.ID
ORDER BY city.Population DESC;

SELECT `name`, `population`
FROM `city`
ORDER BY population ASC
LIMIT 1;

SELECT `name`, `population`, `SurfaceArea`,
(population / SurfaceArea)
AS 'Population Density'
FROM country
ORDER BY 'Population Density' DESC;

SELECT 
    city.Name AS 'City',
    country.Name AS 'Country',
    (country.GNP / country.Population) AS 'GDP per Capita'
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE (country.GNP / country.Population) > (SELECT AVG (country.GNP / country.Population) FROM country)
ORDER BY 'GNP per Capita' DESC
LIMIT 1000;

SELECT *
FROM city;

SELECT * FROM country;

SELECT 
    `Name` AS 'City',
    `CountryCode` AS 'Country',
    `Population`
FROM city
ORDER BY Population DESC
LIMIT 10 OFFSET 30;

