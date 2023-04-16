CREATE DATABASE PizzaDB
ON(
    NAME = Test_data,
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/pizzaDB.mdf',
    SIZE = 10 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5 MB)
LOG ON (
    NAME = 'pizza_log',
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/pizzaDB.ldf',
    SIZE = 5 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5%)

USE PizzaDB
-- Create the Customers table
CREATE TABLE Customers (
  CustomerID INT NOT NULL PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  UNIQUE (Email)
);

-- Create the Addresses table
CREATE TABLE Addresses (
  AddressID INT NOT NULL PRIMARY KEY,
  CustomerID INT NOT NULL,
  Street VARCHAR(100) NOT NULL,
  City VARCHAR(50) NOT NULL,
  State VARCHAR(50) NOT NULL,
  ZipCode VARCHAR(10) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create the PizzaTypes table
CREATE TABLE PizzaTypes (
  PizzaTypeID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(255) NOT NULL
);

CREATE TABLE Ingredients (
  IngredientID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(255) NOT NULL
);

CREATE TABLE Pizza (
  PizzaID INT NOT NULL PRIMARY KEY,
  PizzaTypeID INT NOT NULL,
  FOREIGN KEY (PizzaTypeID) REFERENCES PizzaTypes(PizzaTypeID)
);

CREATE TABLE PizzaIngredients (
  PizzaID INT NOT NULL,
  IngredientID INT NOT NULL,
  FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID),
  FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID),
  PRIMARY KEY (PizzaID, IngredientID)
);

CREATE TABLE Orders (
  OrderID INT NOT NULL PRIMARY KEY,
  CustomerID INT NOT NULL,
  OrderDate DATETIME NOT NULL,
  TotalCost DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Insert customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-1234');

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678');

-- Insert addresses
INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, ZipCode)
VALUES (1, 1, '123 Main St', 'Anytown', 'CA', '12345');

INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, ZipCode)
VALUES (2, 2, '456 Oak St', 'Othertown', 'NY', '67890');

-- Insert pizza types
INSERT INTO PizzaTypes (PizzaTypeID, Name, Description)
VALUES (1, 'Margherita', 'Tomato sauce, mozzarella, and basil.');

INSERT INTO PizzaTypes (PizzaTypeID, Name, Description)
VALUES (2, 'Pepperoni', 'Tomato sauce, mozzarella, and pepperoni.');

-- Insert ingredients
INSERT INTO Ingredients (IngredientID, Name, Description)
VALUES (1, 'Tomato sauce', 'A sauce made from tomatoes.');

INSERT INTO Ingredients (IngredientID, Name, Description)
VALUES (2, 'Mozzarella', 'A soft, white Italian cheese.');

INSERT INTO Ingredients (IngredientID, Name, Description)
VALUES (3, 'Basil', 'A herb commonly used in Italian cuisine.');

INSERT INTO Ingredients (IngredientID, Name, Description)
VALUES (4, 'Pepperoni', 'A type of spicy sausage.');

-- Insert pizzas
INSERT INTO Pizza (PizzaID, PizzaTypeID)
VALUES (1, 1);

INSERT INTO Pizza (PizzaID, PizzaTypeID)
VALUES (2, 2);

-- Insert pizza ingredients
INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (1, 1);

INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (1, 2);

INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (1, 3);

INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (2, 1);

INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (2, 2);

INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (2, 4);

-- Insert orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalCost)
VALUES (1, 1, '2023-04-05 14:00:00', 15.99);

