create DATABASE LAB13
-- В вашей, ранее спроектированной БД (индивидуальное задание из Лабораторной работы No4):

-- 1.1.Создать 2 хранимые процедуры, одна из которых будет иметь выходные параметры
--
EXEC sp_MSforeachtable 'SELECT * FROM ?'
USE PizzaDB
--процедура для получения информации о клиенте на основе его идентификатора
GO
CREATE PROCEDURE GetCustomerByID
@CustomerID INT,
@FirstName VARCHAR(50) OUTPUT,
@LastName VARCHAR(50) OUTPUT,
@Email VARCHAR(50) OUTPUT,
@Phone VARCHAR(20) OUTPUT
AS
BEGIN
    SELECT
    @FirstName = FirstName,
    @LastName = LastName,
    @Email = Email,
    @Phone = Phone
    FROM Customers
    WHERE CustomerID = @CustomerID
END
--увидеть результат
DECLARE @FirstName VARCHAR(50)
DECLARE @LastName VARCHAR(50)
DECLARE @Email VARCHAR(50)
DECLARE @Phone VARCHAR(20)
DECLARE @CustomerID INT = 1 -- Здесь указывается идентификатор клиента

EXEC GetCustomerByID @CustomerID, @FirstName OUTPUT, @LastName OUTPUT, @Email OUTPUT, @Phone OUTPUT
SELECT @FirstName AS FirstName, @LastName AS LastName, @Email AS Email, @Phone AS Phone
--
--для получения информации о заказе на основе его идентификатора
GO
CREATE PROCEDURE GetOrderDetails
@OrderID INT,
@CustomerID INT OUTPUT,
@OrderDate DATETIME OUTPUT,
@TotalCost DECIMAL(8,2) OUTPUT
AS
BEGIN
    SELECT
    @CustomerID = CustomerID,
    @OrderDate = OrderDate,
    @TotalCost = TotalCost
    FROM Orders
        WHERE OrderID = @OrderID
END
-- result 
DECLARE @CustomerID_Out INT
DECLARE @OrderDate_Out DATETIME
DECLARE @TotalCost_Out DECIMAL(8,2)
DECLARE @OrderID_In INT = 3
EXEC GetOrderDetails @OrderID_In, @CustomerID_Out OUTPUT, @OrderDate_Out OUTPUT, @TotalCost_Out OUTPUT
SELECT @CustomerID_Out AS CustomerID, @OrderDate_Out AS OrderDate, @TotalCost_Out AS TotalCost

-- 1.2 Примените ваши две созданные хранимые процедуры для вашей БД ( 2.1Создать 2 определяемые пользователем функции, одна из которых
-- скалярная функция, другая возвращая табличное значение
-- 2.2 Примените ваши две созданные функции для вашей БД
-- 3.1 Создайте два триггера: триггер AFTER и триггер INSTEAD OF 3.2 Примените ваши два созданные триггера для вашей БД