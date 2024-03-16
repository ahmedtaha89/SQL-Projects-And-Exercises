/* 1. From the following table write a query in SQL to retrieve all rows and columns 
from the employee table in the Adventureworks database.
Sort the result set in ascending order on jobtitle. */
SELECT *
FROM HumanResources.Employee
ORDER BY jobtitle ASC

/* 2. From the following table write a query in SQL to retrieve all rows and columns from the employee table
using table aliasing in the Adventureworks database. 
Sort the output in ascending order on lastname. */
SELECT *
FROM Person.Person
ORDER BY LastName ASC

/* 3. From the following table write a query in SQL to return all rows and a subset of the columns 
(FirstName, LastName, businessentityid) from the person table in the AdventureWorks database. 
The third column heading is renamed to Employee_id. 
Arranged the output in ascending order by lastname. */

SELECT FirstName,
	LastName,
	businessentityid
FROM Person.Person