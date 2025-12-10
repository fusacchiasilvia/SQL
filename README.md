# SQL skills project:

This project demonstrates a series of SQL queries executed in SQL Workbench to explore and analyse data from the world database. The focus is on retrieving information, aggregating data, joining tables, and performing calculations to generate meaningful insights about countries, cities, and populations.

Through this project, I applied practical SQL skills that are essential for a data analyst in a real-world environment. By using aggregation functions like SUM(), AVG(), COUNT(), and MAX(), I was able to summarise large datasets efficiently, gaining a high-level understanding of trends such as population distribution, urban density, and GDP per capita. Filtering and sorting data using WHERE and ORDER BY allowed me to isolate specific regions, countries, or cities, making it easier to identify top performers or areas requiring attention.

Joining tables with JOIN enabled me to combine related datasets, such as linking city populations with their respective countries, which is critical for performing comprehensive analysis across multiple dimensions. Derived calculations, such as population density and GDP per capita, provided actionable metrics that can support strategic decision-making.

In a professional context, these SQL techniques are directly applicable to tasks such as:

- Analysing economic and demographic trends to inform policy or business strategy.

- Identifying high-performing regions or underserved areas for targeted interventions.

- Summarising large volumes of transactional or geographic data to produce clear, data-driven reports.

By completing this project, I demonstrated the ability to manipulate complex datasets efficiently, extract actionable insights, and communicate findings in a structured, meaningful way, all skills that are essential for any data analyst working with real-world data.

## SQL Functions Reference
Function / Clause	Syntax / Example	Purpose

COUNT()	SELECT COUNT(*) FROM city WHERE CountryCode = 'USA';	Counts the number of rows meeting a condition. Useful for totals or frequency.

SUM()	SELECT SUM(city.Population) FROM city;	Calculates the total value of a numeric column. Useful for totals.

AVG()	SELECT AVG(city.Population) FROM city;	Calculates the average of a numeric column. Useful for mean values.

MAX()	SELECT MAX(city.Population) FROM city;	Returns the highest value in a column. Useful for identifying extremes.

MIN()	SELECT MIN(city.Population) FROM city;	Returns the lowest value in a column. Useful for identifying the smallest values.

GROUP BY	SELECT Name, COUNT(*) FROM city GROUP BY Name;	Groups rows with the same value for aggregation. Useful for summarising data.

JOIN	SELECT city.Name, country.Name FROM city JOIN country ON city.CountryCode = country.Code;	Combines data from two tables based on a relationship. Useful for cross-table analysis.

WHERE	SELECT * FROM country WHERE Continent = 'Europe';	Filters rows based on a condition. Useful for selective queries.

ORDER BY	SELECT Name, LifeExpectancy FROM country ORDER BY LifeExpectancy DESC;	Sorts results by column values. Useful for ranking or sorting.

LIMIT	SELECT * FROM city LIMIT 10;	Restricts the number of returned rows. Useful for previews or pagination.

OFFSET	SELECT * FROM city LIMIT 10 OFFSET 30;	Skips a number of rows before returning results. Useful for pagination.

Aliases (AS)	SELECT city.Name AS CityName FROM city;	Renames columns or tables in the result. Useful for readability.

Calculated Columns	SELECT (population / SurfaceArea) AS 'Population Density' FROM country;	Creates new values based on calculations. Useful for derived metrics.

Subquery	SELECT * FROM country WHERE (GNP / Population) > (SELECT AVG(GNP / Population) FROM country);	Queries nested within another query. Useful for comparative analysis.

### Queries and Their Purpose
1. Count Total Cities in the USA
SELECT COUNT(*) AS TotalCitiesInUSA
FROM City
WHERE CountryCode = 'USA';


Purpose: Counts the total number of cities in the USA. Useful for quickly understanding dataset size for a specific country.

2. View All Cities
SELECT *
FROM city;

<img width="932" height="512" alt="Screenshot 2025-12-10 at 14 28 37" src="https://github.com/user-attachments/assets/db6c1118-5dfb-4959-ae1e-020e1a87f7bc" />

Purpose: Retrieves all rows and columns in the city table. Useful for exploring data structure and available information.

3. Top 5 Countries by Life Expectancy
SELECT name, LifeExpectancy
FROM Country
ORDER BY LifeExpectancy DESC
LIMIT 5;


Purpose: Identifies countries with the highest life expectancy.

4. Frequency of City Names
SELECT 
    Name AS CityName,
    COUNT(*) AS Frequency
FROM City
GROUP BY Name
ORDER BY Name ASC
LIMIT 100;


Purpose: Shows how often each city name occurs, helping to identify duplicates or common names.

5. View All Countries
SELECT *
FROM country;


Purpose: Retrieves all data from the country table, including population, GNP, and continent.

6. City with Smallest Population
SELECT name, population
FROM city
ORDER BY population ASC
LIMIT 1;


Purpose: Finds the city with the lowest population.

7. Capital of Spain
SELECT city.Name AS Capital
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Name = 'Spain';


Purpose: Retrieves the capital using a JOIN to link country and city data.

8. European Cities
SELECT city.Name AS 'European Cities'
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe'
ORDER BY city.Name ASC;


Purpose: Lists all cities in Europe alphabetically.

9. Population Aggregations by Country
SELECT 
    country.Name AS Country,
    SUM(city.Population) AS TotalPopulation,
    AVG(city.Population) AS AverageCityPopulation
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
ORDER BY country.Name ASC;


Purpose: Calculates total and average city populations per country.

10. Capital Cities Ordered by Population
SELECT 
    country.Name AS Country,
    city.Name AS CapitalCity,
    city.Population AS Population
FROM country
JOIN city ON country.Capital = city.ID
ORDER BY city.Population DESC;


Purpose: Lists capitals by population to identify the largest capital cities.

11. Population Density
SELECT name, population, SurfaceArea,
(population / SurfaceArea) AS PopulationDensity
FROM country
ORDER BY PopulationDensity DESC;


Purpose: Calculates population density for each country.

12. GDP per Capita Above Average
SELECT 
    city.Name AS City,
    country.Name AS Country,
    (country.GNP / country.Population) AS GDPperCapita
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE (country.GNP / country.Population) > (SELECT AVG(country.GNP / country.Population) FROM country)
ORDER BY GDPperCapita DESC
LIMIT 1000;


Purpose: Identifies cities in wealthier countries with GDP per capita above the global average.

13. Pagination Example: 10 Cities with Offset
SELECT 
    Name AS City,
    CountryCode AS Country,
    Population
FROM city
ORDER BY Population DESC
LIMIT 10 OFFSET 30;


Purpose: Retrieves a specific subset of cities by population, demonstrating pagination.

How I Applied SQL Skills in a Real-World Context

In this project, I applied a range of SQL techniques to explore and analyse the world database, simulating tasks a data analyst might face in a real work environment:

Counting and Aggregating: Using COUNT(), SUM(), AVG(), and MAX(), I quantified totals, averages, and extremes (e.g., total cities in a country or largest capital populations). In a business setting, this is essential for understanding scale, performance, or market size.

Filtering and Sorting: Using WHERE and ORDER BY, I isolated specific continents, countries, or cities. This is useful for producing targeted reports, identifying trends, or prioritising high-impact regions in a real dataset.

Grouping and Frequency Analysis: Applying GROUP BY allowed me to summarise patterns, such as common city names. In practice, this helps spot duplicates, standardise data, and generate insights for decision-making.

Joining Tables: By joining city and country tables, I linked related datasets, enabling analysis such as capital populations, European city listings, or GDP per capita. In a real work environment, joins are crucial for combining disparate datasets for comprehensive insights.

Derived Calculations and Subqueries: Calculated metrics like population density and GDP per capita, and compared values against averages. This mirrors real-world tasks like benchmarking performance or identifying outliers.

Pagination and Data Management: Using LIMIT and OFFSET allowed me to manage large datasets efficiently, similar to retrieving manageable chunks of data from production databases.

By applying these SQL skills, I demonstrated the ability to manipulate complex datasets efficiently, perform detailed analyses, and present actionable insights — key competencies for any data analyst working with real-world data.
