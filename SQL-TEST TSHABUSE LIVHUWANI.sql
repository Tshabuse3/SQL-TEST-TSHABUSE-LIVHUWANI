--QUESTION 1
SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Suppliers;


--QUESTION 2
SELECT ContactName
FROM Customers
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactName;

--QUESTION 3

SELECT *
FROM Orders
WHERE OrderDate = '1997-05-19';


--QUESTION 4

SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC;


--QUESTION 5

SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock = 0;

--QUESTION 6

SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

--QUESTION 7

SELECT AVG(UnitPrice) AS AveragePrice,
       MIN(UnitPrice) AS MinimumPrice,
       MAX(UnitPrice) AS MaximumPrice
FROM Products;


--QUESTION 8

SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL;

--QUESTION 9

SELECT ShipPostalCode, OrderID, OrderDate,
       RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '98124%';


--QUESTION 10

SELECT LastName, FirstName, City
FROM Employees
WHERE City != 'Seattle';


--QUESTION 11

SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%';


--QUESTION 12

SELECT CustomerID,
       SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200;

--QUESTION 13

SELECT S.SupplierID,
       S.CompanyName,
       C.CategoryName,
       P.ProductName,
       P.UnitPrice
FROM Products P, Suppliers S, Categories C
WHERE P.SupplierID = S.SupplierID
  AND P.CategoryID = C.CategoryID;


--QUESTION 14

SELECT O.OrderID,
       E.FirstName,
       E.LastName
FROM Orders O, Employees E
WHERE O.EmployeeID = E.EmployeeID
  AND O.ShippedDate > O.RequiredDate;


--QUESTION 15

SELECT ProductID,
       SUM(Quantity) AS TotalQuantity
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) < 200;

--QUESTION 16

SELECT CustomerID,
       COUNT(OrderID) AS TotalOrders
FROM Orders
WHERE OrderDate > '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15;


--QUESTION 17

SELECT P.ProductName,
       P.UnitPrice,
       S.CompanyName
FROM Products P, Suppliers S
WHERE P.SupplierID = S.SupplierID;


--QUESTION 18

SELECT
    Products.ProductName,
    SUM([Order Details].UnitPrice * [Order Details].Quantity) AS [Total Costs]
FROM Products
INNER JOIN [Order Details]
    ON Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductName
HAVING SUM([Order Details].UnitPrice * [Order Details].Quantity) > 200; 


--QUESTION 19

SELECT OrderID,
       COUNT(OrderID) AS NumberofOrders
FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC;


--QUESTION 20

SELECT S.SupplierID,
       P.ProductName,
       S.CompanyName
FROM Products P, Suppliers S
WHERE P.SupplierID = S.SupplierID
  AND S.CompanyName IN ('Exotic Liquids',
                        'Specialty Biscuits, Ltd.',
                        'Escargots Nouveaux')
ORDER BY S.SupplierID;