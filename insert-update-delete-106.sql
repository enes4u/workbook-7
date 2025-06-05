-- 1. Add a new supplier.
USE northwind;
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, City, Country)
VALUES (164, 'Pitt Supplier Inc.', 'Maksim Aryal', 'Sales REP', 'Pittsburgh', 'USA');


-- 2. Add a new product provided by that supplier
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitsInStock)
VALUES (500, 'New Product PhoneX', 164, 2000.00, 1000);

-- 3. List all products and their suppliers.
SELECT Products.ProductName, Suppliers.CompanyName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- 4. Raise the price of your new product by 15%.
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductID = 500;

-- 5. List the products and prices of all products from that supplier.
SELECT ProductName, UnitPrice 
FROM Products 
WHERE SupplierID = 164;

-- 6. Delete the new product.
DELETE FROM Products
WHERE ProductID = 500;

-- 7. Delete the new supplier.
DELETE FROM Suppliers
WHERE SupplierID = 164;

-- 8. List all products.
SELECT * FROM Products;

-- 9. List all suppliers.
SELECT * FROM Suppliers;

