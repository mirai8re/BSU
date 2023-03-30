CREATE DATABASE Pizza
ON(
    NAME = Test_data,
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/pizza.mdf',
    SIZE = 10 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5 MB)
LOG ON (
    NAME = 'pizza_log',
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/pizza.ldf',
    SIZE = 5 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5%)

USE Pizza
CREATE TABLE Customers (
   CustomerID INT IDENTITY(1,1) PRIMARY KEY,
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   Email VARCHAR(50) NOT NULL UNIQUE,
   PhoneNumber VARCHAR(20) NOT NULL,
   Address VARCHAR(100) NOT NULL
);

CREATE TABLE Pizzas (
   PizzaID INT IDENTITY(1,1) PRIMARY KEY,
   Name VARCHAR(50) NOT NULL UNIQUE,
   Description VARCHAR(100) NOT NULL,
   Price DECIMAL(5,2) NOT NULL CHECK(Price > 0)
);


CREATE TABLE Orders (
   OrderID INT IDENTITY(1,1) PRIMARY KEY,
   CustomerID INT NOT NULL,
   PizzaID INT NOT NULL,
   OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
   Quantity INT NOT NULL CHECK(Quantity > 0),
   TotalPrice DECIMAL(5,2) NOT NULL CHECK(TotalPrice > 0),
   FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
   FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID)
);


INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address)
VALUES ('John', 'Doe', 'johndoe@email.com', '1234567890', '123 Main St'),
       ('Jane', 'Smith', 'janesmith@email.com', '0987654321', '456 Oak Ave');

INSERT INTO Pizzas (Name, Description, Price)
VALUES ('Cheese', 'Mozzarella cheese and tomato sauce', 10.99),
       ('Pepperoni', 'Pepperoni, mozzarella cheese, and tomato sauce', 12.99);

DECLARE @customerID INT;
SET @customerID = (SELECT CustomerID FROM Customers WHERE Email = 'johndoe@email.com');

DECLARE @pizzaID INT;
SET @pizzaID = (SELECT PizzaID FROM Pizzas WHERE Name = 'Cheese');

INSERT INTO Orders (CustomerID, PizzaID, Quantity, TotalPrice)
VALUES (@customerID, @pizzaID, 2, 21.98);


SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.Name AS PizzaName,
    SUM(o.Quantity * p.Price) AS TotalCost
FROM 
    Orders o
    JOIN Customers c ON o.CustomerId = c.CustomerId
    JOIN Pizzas p ON o.PizzaId = p.PizzaId
GROUP BY 
    c.FirstName + ' ' + c.LastName,
    p.Name WITH ROLLUP;


SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.Name AS PizzaName,
    CONVERT(date, o.OrderDate) AS OrderDate,
    SUM(o.Quantity * p.Price) AS TotalCost
FROM 
    Orders o
    JOIN Customers c ON o.CustomerId = c.CustomerId
    JOIN Pizzas p ON o.PizzaId = p.PizzaId
GROUP BY 
    c.FirstName + ' ' + c.LastName,
    p.Name,
    CONVERT(date, o.OrderDate) WITH CUBE;
