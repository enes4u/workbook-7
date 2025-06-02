/*
1. What categories of products does Northwind Traders sell?
- Beverages, Condiments , confections ,dairy products, grains/cereals, Meat/Poultry, Produce, Seafood
2. What is the name of a product that sounds interesting to you?

3. What are some of the countries in which we have customers?
Argentina
Austria
Belgium
Brazil
Canada
Denmark
Finland
France
Germany
Ireland
Italy
Mexico
Norway
Poland
Portugal
Spain
Sweden
Switzerland
UK
USA
Venezuela
4. What date was our first order placed? How did you determine that?
'1996-07-04 00:00:00'
5. What date was our last order placed?
1998-05-06 00:00:00
6. How many customers do we currently have? 
93
7. Do we have any suppliers in South America? Europe? Africa?

8. What is our most expensive product?
9. What is our least expensive product?
10. We have a customer named "The Big Cheese" if I wanted to get details

about their last order from us how would you find that information?
	THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way Suite 2	Portland	OR	97201	USA	(503) 555-3612	
    
    1998-04-01 00:00:00
a. What tables would you use?
prders and customers 
1-9
b. How would you link the data in the tables you are using
c. What information might I want to know about their order?
i. Order Date?
ii. Sales Total?
iii. Product Name?
iv. Is there other information that you might find interesting?

*/ 
SELECT o.OrderID, o.OrderDate, c.CustomerID, c.CompanyName
FROM northwind.orders AS o
JOIN northwind.customers AS c
ON o.CustomerID = c.CustomerID
WHERE c.CompanyName = 'The Big Cheese';

--
USE northwind;

SELECT o.OrderID, o.OrderDate, SUM(od.UnitPrice * od.Quantity) AS SalesTotal, p.ProductName, c.CompanyName
FROM northwind.orders AS o
JOIN northwind.`order details` AS od ON o.OrderID = od.OrderID
JOIN northwind.products AS p ON od.ProductID = p.ProductID
JOIN northwind.customers AS c ON o.CustomerID = c.CustomerID
WHERE c.CompanyName = 'The Big Cheese'
GROUP BY o.OrderID, o.OrderDate, p.ProductName, c.CompanyName;

--

-- most expensive product(s)
SELECT ProductName, UnitsInStock, UnitPrice FROM Products ORDER BY UnitPrice DESC LIMIT 3;