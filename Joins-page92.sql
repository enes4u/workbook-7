-- 1. List the product id, product name, unit price and category name of all
-- products. Order by category name and within that, by product name.
SELECT P.ProductID, P.ProductName, P.UnitPrice, C.CategoryName
FROM Products AS P 
JOIN 
Categories AS C ON P.CategoryID= C.CategoryID 
ORDER BY C.CategoryName, ProductName;
-- 2. List the product id, product name, unit price and supplier name of all
-- products that cost more than $75. Order by product name.
SELECT 
    Products.ProductID, Products.ProductName, Products.UnitPrice, Suppliers.CompanyName AS SupplierName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE 
    Products.UnitPrice > 75
ORDER BY 
    Products.ProductName;
-- 3. List the product id, product name, unit price, category name, and supplier
-- name of every product. Order by product name.
SELECT 
    Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName, Suppliers.CompanyName AS SupplierName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY 
    Products.ProductName;
-- 4. What is the product name(s) and categories of the most expensive
-- products? HINT: Find the max price in a subquery and then use that in
-- your more complex query that joins products with categories.
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = (
  SELECT MAX(UnitPrice)
  FROM Products
);
-- 5. List the order id, ship name, ship address, and shipping company name of
-- every order that shipped to Germany.
SELECT o.OrderID, o.ShipName, o.ShipAddress, s.CompanyName AS ShippingCompany
FROM Orders o
INNER JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE o.ShipCountry = 'Germany';
-- 6. List the order id, order date, ship name, ship address of all orders that
-- ordered "Sasquatch Ale"?
SELECT o.OrderID, o.OrderDate, o.ShipName, o.ShipAddress
FROM Orders o
INNER JOIN `Order Details` od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Sasquatch Ale';




