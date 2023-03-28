-- task 3.1
CREATE DATABASE productsDB
ON(
    NAME = prooductsDB,
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/productsDB'
)
GO
USE productsDB;
CREATE TABLE Product(
    ID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(30) NOT NULL,
    Proizvod NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price Money NOT NULL
)
INSERT Product VALUES('iPhone7', 'apple', 5,1000)

-- task 3.2
INSERT Product(Name, Price, Proizvod)
VALUES('iPhone6', 6100, 'apple')
-- tak 3.3
INSERT INTO Product
VALUES
('iPhone 6', 'apple', 3, 34000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy s8 Plus', 'Samsung', 1, 56000)

-- task 3.4

INSERT Product(Name, Proizvod, ProductCount, Price)
VALUES('Mi6', 'Xiaomi', DEFAULT, 28000)