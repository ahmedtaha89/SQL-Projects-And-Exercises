/* SQL Queries of AdventureWorks Database:
The AdventureWorks Database is a Microsoft product sample that provides an example of an online transaction processing (OLTP) database. 
Adventure Works Cycles is a fictitious multinational manufacturing company that is supported by the AdventureWorks Database.*/
-- Link: https://www.w3resource.com/sql-exercises/adventureworks/index.php

USE AdventureWorks2022;

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
SELECT FirstName
	,LastName
	,businessentityid AS 'Employee_id'
FROM Person.Person
ORDER BY LastName ASC

/*4. From the following table write a query in SQL to return only the rows 
for product that have a sellstartdate that is not NULL and a productline of 'T'.
Return productid, productnumber, and name. Arranged the output in ascending order on name.*/
SELECT ProductID
	,ProductNumber
	,Name AS producname
FROM production.Product
WHERE ProductLine = 'T'
	AND SellStartDate IS NOT NULL
ORDER BY Name;

/*5. From the following table write a query in SQL to return all rows from the salesorderheader table
in Adventureworks database and calculate the percentage of tax on the subtotal have decided. 
Return salesorderid, customerid, orderdate, subtotal, percentage of tax column.
Arranged the result set in ascending order on subtotal.*/
SELECT SalesOrderID
	,CustomerID
	,OrderDate
	,SubTotal
	,((TaxAmt / SubTotal) * 100) AS Tax_percent 
FROM sales.salesorderheader
ORDER BY SubTotal;

/*6. From the following table write a query in SQL to create a list of unique jobtitles in the employee table
in Adventureworks database.Return jobtitle column and arranged the resultset in ascending order.*/
SELECT DISTINCT JobTitle 
FROM HumanResources.Employee
ORDER BY JobTitle;

/*7. From the following table write a query in SQL to calculate the total freight paid by each customer.
Return customerid and total freight. Sort the output in ascending order on customerid.*/
SELECT CustomerID , 
	   SUM(Freight) AS 'total_freigh'
FROM sales.salesorderheader
GROUP BY CustomerID
ORDER BY CustomerID;

/*8. From the following table write a query in SQL to find the average and the sum of the subtotal for every customer.
Return customerid, average and sum of the subtotal. 
Grouped the result on customerid and salespersonid. 
Sort the result on customerid column in descending order.*/
SELECT CustomerID
	  ,SalesPersonID
	  ,AVG(SubTotal) AS 'Average Subtotal'
	  ,SUM(SubTotal) AS 'Sum Subtotal'
FROM sales.salesorderheader
GROUP BY CustomerID , SalesPersonID
ORDER BY CustomerID DESC;

/*9. From the following table write a query in SQL to retrieve total quantity of each productid
which are in shelf of 'A' or 'C' or 'H'. Filter the results for sum quantity is more than 500. 
Return productid and sum of the quantity. Sort the results according to the productid in ascending order.*/
SELECT productid 
	   ,SUM(Quantity) AS total_quantity 
FROM production.productinventory
WHERE Shelf IN ('A','C','H')
GROUP BY productid
HAVING SUM(Quantity) > 500
ORDER BY productid;

-- 10. From the following table write a query in SQL to find the total quentity for a group of locationid multiplied by 10.
SELECT SUM(Quantity) AS total_quentity 
FROM production.productinventory
GROUP BY locationid * 10

/* 11. From the following tables write a query in SQL to find the persons whose last name starts with letter 'L'. 
Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname. */
SELECT Person.Person.BusinessEntityID,FirstName,LastName,PhoneNumber AS person_phone
FROM Person.PersonPhone  JOIN Person.Person
ON PersonPhone.BusinessEntityID = Person.Person.BusinessEntityID
WHERE LastName LIKE 'L%'
ORDER BY  LastName , FirstName 

--**
/* 12. From the following table write a query in SQL to find the sum of subtotal column. 
Group the sum on distinct salespersonid and customerid. Rolls up the results into subtotal and running total.
Return salespersonid, customerid and sum of subtotal column i.e. sum_subtotal. */
SELECT salespersonid,customerid,sum(subtotal) AS sum_subtotal
FROM sales.salesorderheader s 
GROUP BY ROLLUP (salespersonid, customerid);

/* 13. From the following table write a query in SQL to find the sum of
the quantity of all combination of group of distinct locationid and shelf column.
Return locationid, shelf and sum of quantity as TotalQuantity. */
SELECT locationid, 
	   shelf,
	   SUM(Quantity) AS TotalQuantity
FROM production.productinventory
GROUP BY locationid , shelf


SELECT locationid, shelf, SUM(quantity) AS TotalQuantity
FROM production.productinventory
GROUP BY CUBE (locationid, shelf);

