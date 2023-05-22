create DATABASE LAB13
-- 1.3 Практика (хранимые процедуры) -самостоятельная работа
-- 1) Напишите хранимую процедуру, которая выводит данные всех
-- стран 
USE LAB9 
GO 
CREATE PROC PROC1
AS
    BEGIN
    SELECT [Nazvanie], [Stolica], [PL], [KolNas], [Kontinent]
    FROM [LAB9].[dbo].[Tabl_Kontinents]
END 
    --
EXEC PROC1 
DROP PROC if EXISTS PROC3
--2) Напишите хранимую процедуру, которая принимает число, и возвращает количество цифр в нем через параметр OUTPUT
GO 
CREATE PROC PROC2
@Number INT,
@Count INT OUTPUT
AS 
BEGIN 
    SET @Count = LEN(CAST(@Number AS VARCHAR(20)))
END
--
DECLARE @DigitCount INT
EXEC PROC2 @Number = 18, 
@Count = @DigitCount OUTPUT
SELECT @DigitCount AS DigitCount
-- 3) Напишите хранимую процедуру, которая создает таблицу «TestTabl», заполняет ее странами, названия которых начинаются с первой буквой вашей фамилии
GO 
CREATE PROC PROC3
AS 
BEGIN
    IF OBJECT_ID('TestTabl', 'U') IS NOT NULL
            DROP TABLE TestTabl;
            
    CREATE TABLE TestTabl (
        ID INT IDENTITY(1,1),
        CountryName VARCHAR(100)
    );

    INSERT INTO TestTabl (CountryName)
    SELECT Nazvanie
    FROM Tabl_Kontinents
    WHERE Nazvanie LIKE 'M%'
END
-- 
EXEC PROC3

-- 2.4 Практика: Определяемые пользователем функции. Самостоятельная работа.
-- 1) Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
GO
CREATE FUNCTION GetCountriesByArea(@MaxArea DECIMAL(10, 2))
RETURNS TABLE
AS
RETURN
(
    SELECT [Nazvanie] AS CountryName, [PL] AS Area
    FROM [dbo].[Tabl_Kontinents]
    WHERE [PL] < @MaxArea
);
--
SELECT *
FROM dbo.GetCountriesByArea(1000000);

-- 2) Напишите функцию для возврата таблицы с названием страны и плотностью населения, и вызовите ее
GO 
CREATE FUNCTION GetCountryPopulationDensity()
RETURNS TABLE
AS RETURN
(
    SELECT [Nazvanie] AS CountryName, [KolNas] / [PL] AS PopulationDensity
    FROM [dbo].[Tabl_Kontinents]);
-- 
SELECT * 
FROM dbo.GetCountryPopulationDensity()
-- 1) Напишите триггер на добавление записи в таблицу «Student». Данный триггер, в случае успешного добавления данных, выводит «Запись добавлена»
USE Ucheb_7_Mironova
GO 
CREATE TRIGGER TRIG1
ON Student
FOR INSERT 
AS
BEGIN 
    PRINT 'entry added'
END

-- 2) Самостоятельно проверьте работу триггера Trig1, для этого добавьте запись в табл. Student
INSERT INTO [Ucheb_7_Mironova].[dbo].[Student] ([full name], [date], [speciality], [year of admission])
VALUES ('Миронова Лада Викторовна', '2000-01-01', 'Математика', 2021);

-- 3) Напишите триггер на удаление записи из таблицы «Student». Данный триггер, при попытке удаления данных, выводит «Нельзя удалить данные»
USE Ucheb_7_Mironova
GO
CREATE TRIGGER TRIG2
ON [Ucheb_7_Mironova].[dbo].[Student]
INSTEAD OF DELETE 
AS
BEGIN
    PRINT 'YOU CANNOT DELETE DATA'
END
-- 4) Самостоятельно проверьте работу триггера Trig2
DELETE FROM [Ucheb_7_Mironova].[dbo].[Student]
WHERE [full name] = 'Миронова Лада Викторовна' AND [date] = '2000-01-01' AND [speciality] = 'Математика' AND [year of admission] = 2021;

-- Создать таблицу «Студент_Архив», которая будет содержать все данные об удаленных Студентах и даты их удаления.
CREATE TABLE Student_Archive(
    FullName NVARCHAR(40) NULL,
    Date DATE NULL,
    Speciality NVARCHAR(20) NULL,
    YearOfAdmission INT NULL,
    DeleteData DATETIME NOT NULL
)
GO
DROP TRIGGER [dbo].[TRIG2];
-- Написать триггер, который будет фиксировать в таблице «Студент _Архив1» данные студента, удаленного из таблицы «Студенты»
GO
CREATE TRIGGER TRIG3
ON Student 
INSTEAD OF DELETE 
AS BEGIN 
    INSERT Student_Archive 
    SELECT
    [full name], 
    Date,
    Speciality, 
    [Year Of Admission],
    GETDATE() AS DeleteData
        FROM DELETED
END
-- 5 ) Самостоятельно проверьте работу триггера Trig31
DELETE FROM [Ucheb_7_Mironova].[dbo].[Student]
WHERE [full name] = 'Миронова Лада Викторовна' AND [date] = '2000-01-01' AND [speciality] = 'Математика' AND [year of admission] = 2021;
SELECT * FROM Student_Archive;



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
-- 1.2 Примените ваши две созданные хранимые процедуры для вашей БД 

-- увидеть результат для получения информации о клиенте на основе его идентификатора
DECLARE @CustomerID_Out INT
DECLARE @OrderDate_Out DATETIME
DECLARE @TotalCost_Out DECIMAL(8,2)
DECLARE @OrderID_In INT = 3
EXEC GetOrderDetails @OrderID_In, @CustomerID_Out OUTPUT, @OrderDate_Out OUTPUT, @TotalCost_Out OUTPUT
SELECT @CustomerID_Out AS CustomerID, @OrderDate_Out AS OrderDate, @TotalCost_Out AS TotalCost

--увидеть результат для получения информации о заказе на основе его идентификатора
DECLARE @FirstName VARCHAR(50)
DECLARE @LastName VARCHAR(50)
DECLARE @Email VARCHAR(50)
DECLARE @Phone VARCHAR(20)
DECLARE @CustomerID INT = 1 -- Здесь указывается идентификатор клиента
EXEC GetCustomerByID @CustomerID, @FirstName OUTPUT, @LastName OUTPUT, @Email OUTPUT, @Phone OUTPUT
SELECT @FirstName AS FirstName, @LastName AS LastName, @Email AS Email, @Phone AS Phone

-- 2.1Создать 2 определяемые пользователем функции, одна из которых
-- скалярная функция, другая возвращая табличное значение
-- создается функция GetFullName, которая принимает два параметра @FirstName и @LastName. 
-- Функция объединяет значения этих параметров в одну строку, представляющую полное имя, 
-- и возвращает эту строку
GO
CREATE FUNCTION GetFullName(
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50))
RETURNS VARCHAR(101)
AS
BEGIN
  DECLARE @FullName VARCHAR(101)
  SET @FullName = @FirstName + ' ' + @LastName
  RETURN @FullName
END
GO

-- Функция GetCustomerAddresses создана для получения адресов, связанных с указанным идентификатором клиента. 
-- Функция принимает один параметр @CustomerID, 
-- который будет использоваться для фильтрации адресов по указанному идентификатору клиента.
USE PizzaDB
GO
CREATE FUNCTION GetCustomerAddresses(
  @CustomerID INT)
RETURNS TABLE
AS
RETURN(
  SELECT AddressID, Street, City, State, ZipCode
  FROM Addresses
  WHERE CustomerID = @CustomerID)
GO



-- 2.2 Примените ваши две созданные функции для вашей БД
--Вызов функции GetFullName
DECLARE @FirstName VARCHAR(50) = 'Anna'
DECLARE @LastName VARCHAR(50) = 'Mironova'
SELECT dbo.GetFullName(@FirstName, @LastName) AS FullName

--Вызов функции GetCustomerAddresses
DECLARE @CustomerID INT = 2
SELECT * FROM GetCustomerAddresses(@CustomerID)

-- 3.1 Создайте два триггера: триггер AFTER и триггер INSTEAD OF 
-- триггер AFTER 
-- Данный триггер AfterInsertOrder является триггером AFTER INSERT для таблицы Orders в базе данных PizzaDB. 
-- Триггер срабатывает после вставки новой записи в таблицу Orders.
-- В данном случае, триггер выполняет простое действие - выводит сообщение "this entry has been added to the table "Orders"" 
-- с использованием оператора PRINT. 
-- Таким образом, при каждой вставке новой записи в таблицу Orders, будет выводиться указанное сообщение.
USE PizzaDB
GO
CREATE TRIGGER AfterInsertOrder
ON Orders
AFTER INSERT
AS
BEGIN
    -- Тело триггера AFTER
    PRINT 'this entry has been added to the table "Orders" '
    
END
-- триггер INSTEAD OF (InsteadOfInsertOrder) для таблицы Orders заменяет стандартную операцию вставки (INSERT). 
-- Внутри блока BEGIN и END находится код, который определяет, какие данные будут вставлены в таблицу Orders.
-- код выполняет простую операцию вставки данных из вставленных строк (inserted) в таблицу Orders. 
-- Таким образом, все данные, указанные во вставке, будут добавлены в таблицу Orders.
USE PizzaDB
GO
CREATE TRIGGER InsteadOfInsertOrder
ON Orders
INSTEAD OF INSERT
AS
BEGIN
    -- Пример кода, заменяющего вставку записи
    INSERT INTO Orders (CustomerID, OrderDate, TotalCost)
    SELECT CustomerID, OrderDate, TotalCost
    FROM inserted
    WHERE CustomerID IS NOT NULL
END

-- 3.2 Примените ваши два созданные триггера для вашей БД
-- Эта команда включит триггер AFTER (AfterInsertOrder) для таблицы Orders, 
-- что позволит ему выполняться после вставки данных в эту таблицу.
-- После выполнения этой команды, триггер будет активирован и начнет выполнять свое тело, 
-- в данном случае выводить сообщение "this entry has been added to the table 'Orders'".
USE PizzaDB
GO
ALTER TABLE Orders
ENABLE TRIGGER AfterInsertOrder

-- Эта команда включит триггер INSTEAD OF (InsteadOfInsertOrder) для таблицы Orders, 
-- что позволит ему выполняться при вставке данных в эту таблицу.
-- После выполнения этой команды, триггер будет активирован и начнет заменять стандартную операцию вставки 
-- для таблицы Orders со своим собственным кодом.
USE PizzaDB
GO
ALTER TABLE Orders
ENABLE TRIGGER InsteadOfInsertOrder
