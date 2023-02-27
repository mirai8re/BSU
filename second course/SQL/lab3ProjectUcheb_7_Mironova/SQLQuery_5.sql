use Ucheb_7_Mironova
SELECT ProductName + ' (' + Manufacturer + ')', Price, Price*ProductCount
FROM Products

SELECT ProductName + ' (' + [Manufacturer] + ')', Price, Price*ProductCount 
FROM Products;

SELECT ProductName + ' (' + Manufacturer + ')' 
AS ModelName, Price
INTO ProductSummary 
FROM Products
SELECT * FROM ProductSummary

SELECT ProductName, ProductCount*Price AS TotalSum 
FROM Products
ORDER BY TotalSum

use Ucheb_7_Mironova
SELECT ProductName, Price, ProductCount 
FROM Products
ORDER BY ProductCount*Price

