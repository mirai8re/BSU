USE PizzaDB
INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, ZipCode)
VALUES 

  (3, 1, '789 Oak St', 'Anytown', 'CA', '12345'),
  (4, 3, '1011 Pine St', 'Smalltown', 'TX', '54321'),
  (5, 4, '1213 Maple St', 'Bigcity', 'IL', '98765'),
  (7, 4, '1617 Birch St', 'Bigcity', 'IL', '98765'),
  (8, 5, '1819 Spruce St', 'Hometown', 'FL', '13579'),
  (9, 6, '2021 Fir St', 'Mountainville', 'OR', '86420'),
  (10, 7, '2223 Pine St', 'Seaside', 'WA', '24680');
-- • - вывести все данные из таблиц
EXEC sp_MSforeachtable 'SELECT * FROM ?'

-- • вывести определенные данные, отсортированные в алфавитном порядке по
-- определенному полю
SELECT name as PizzaDescription 
FROM Ingredients
ORDER BY PizzaDescription ASC
-- • вывести определенные данные, отсортированные в обратном алфавитном
-- порядке по двум полям
SELECT name as PizzaDescription, IngredientID AS ID
FROM Ingredients
ORDER BY PizzaDescription DESC, ID DESC
-- • создать вычисляемое поле, и вывести данные, убрав дубликаты
SELECT DISTINCT AddressID, CustomerID, 
(AddressID+CustomerID) AS RESULT
FROM  Addresses
-- • вывести 30% строк
SELECT TOP 30 PERCENT * FROM PizzaTypes
-- • вывести первые 5 строк
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES
  (3, 'Anna', 'Mironova', 'mironova@yahoo.com', '345-678-9012'),
  (4, 'Samantha', 'Davis', 'sdavis@hotmail.com', '456-789-0123'),
  (5, 'Michael', 'Lee', 'mlee@gmail.com', '567-890-1234'),
  (6, 'Emily', 'Nguyen', 'enguyen@yahoo.com', '678-901-2345'),
  (7, 'David', 'Kim', 'dkim@gmail.com', '789-012-3456'),
  (8, 'Sarah', 'Jones', 'sjones@hotmail.com', '890-123-4567'),
  (9, 'Kevin', 'Brown', 'kbrown@yahoo.com', '901-234-5678'),
  (10, 'Megan', 'Taylor', 'mtaylor@gmail.com', '012-345-6789');

  SELECT TOP 5 *
  FROM Customers
-- • вывести строки начиная с 4 строки по 7 строку, отсортированные в обратном
-- порядке
SELECT * FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY CustomerID DESC) as rows, * FROM Customers) AS RESULT
WHERE rows >= 4 AND rows <= 7;
-- • Отсортировать данные, используя в качестве критерия сортировки сложно
-- выражение на основе столбцов
SELECT * FROM Customers ORDER BY CASE 
    WHEN FirstName = 'Samantha' THEN 2
    WHEN FirstName = 'Anna' AND LastName = 'Mironova' THEN 1
    ELSE 3 
END;
-- • Запрос на выборку с добавлением SELECT INTO
SELECT FirstName, LastName, Email
INTO CustomerEmails
FROM Customers;
SELECT *
FROM CustomerEmails 

-- 4. С помощью языка T-SQL написать и выполнить 7 запросов на фильтрацию данных
-- с использованием в запросах операторов сравнения, логических операторов (см. лаб.
-- 3)
--WHERE
SELECT * 
FROM Addresses
WHERE ZipCode >20000
--AS
SELECT FirstName + ' ' + LastName AS FullName
FROM Customers
--AND 
SELECT * 
FROM Addresses
WHERE ZipCode >3000 AND [State] = 'NY'
--OR
SELECT * 
FROM Addresses
WHERE ZipCode >50000 OR [State] = 'NY'
--NOT LIKE
SELECT * 
FROM Addresses
WHERE [State]   NOT LIKE  'NY'
--BETWEEN
SELECT * 
FROM Addresses
WHERE ZipCode BETWEEN 10000 AND 40000 
--
SELECT *
FROM Addresses
WHERE [State] IN ('NY', 'CA', 'WA')
-- 5. Переименуйте одну из таблиц вашей БД
EXEC sp_rename 'Customers', 'Clients';
-- 6. Добавьте по две записи в каждую из таблиц вашей БД
-- Add two customers
INSERT INTO Clients (CustomerID, FirstName, LastName, Email, Phone)
VALUES (13, 'Alice', 'Johnson', 'alice@example.com', '555-9876'),
(12, 'Bob', 'Williams', 'bobwilliams@example.com', '555-4321');

-- Add two addresses
INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, ZipCode)
VALUES (35, 13, '789 Elm St', 'Somewhere', 'TX', '54321'),
(41, 14, '321 Maple St', 'Nowhere', 'IL', '67890');

-- Add two pizza types
INSERT INTO PizzaTypes (PizzaTypeID, Name, Description)
VALUES (13, 'Hawaiian', 'Tomato sauce, mozzarella, ham, and pineapple.'),
(14, 'Meat Lovers', 'Tomato sauce, mozzarella, pepperoni, sausage, ham, and bacon.');

-- Add two ingredients
INSERT INTO Ingredients (IngredientID, Name, Description)
VALUES (15, 'Ham', 'A type of meat that comes from a pig.'),
(16, 'Pineapple', 'A tropical fruit that is often used on pizza.');

-- Add two pizzas
INSERT INTO Pizza (PizzaID, PizzaTypeID)
VALUES (13, 13),
(14, 14);

-- Add two pizza ingredients
INSERT INTO PizzaIngredients (PizzaID, IngredientID)
VALUES (14, 1),
(14, 2);

-- Add two orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalCost)
VALUES (12, 2, '2023-04-05 15:00:00', 18.99),
(13, 3, '2023-04-06 16:00:00', 21.99);


-- 7. Измените одну из таблиц вашей БД:
-- • добавьте по смыслу один столбец
ALTER TABLE Clients
ADD BirthDate DATE;
-- • добавьте ограничение с именем на новый введенный вами столбец
ALTER TABLE Clients
ADD CONSTRAINT CK_Clients_BirthDate CHECK (BirthDate < GETDATE());
-- 8. Напишите 5 запросов, используя агрегатные функции (SUM, MAX, MIN, AVG,
-- COUNT)
-- общее количество заказов 
SELECT COUNT(*) AS TotalOrders FROM Orders;
-- общая сумму заказов
SELECT SUM(TotalCost) AS TotalOrdersCost
FROM Orders;
-- минимальная стоимость пиццы
SELECT MIN(TotalCost) AS MinOrderCost
FROM Orders;
-- максимальная стоимость пиццы
SELECT MAX(TotalCost) AS MinOrderCost
FROM Orders;
-- средняя стоимость заказа
SELECT AVG(TotalCost) AS AvgOrderCost
FROM Orders;

-- 9. Написать 2 запроса на группировку данных, используя оператор GROUP BY
-- 10. Написать 2 запроса на фильтрацию групп, используя HAVING.
-- 11. Написать запросы на расширения SQL Server для группировки (ROLLUP, CUBE,
-- GROUPING SETS, OVER)
-- 12. Написать запрос на разворачивание данных (PIVOT), отмена разворачивания
-- (UNPIVOT).
-- 13. Написать по два запроса на каждое соединение таблиц: внутреннее, внешнее
-- левое, внешнее правое, полное внешнее соединение.
-- 14. Написать по два запроса на пересечение, разность, объединение таблиц
-- 15. Написать 4 запроса с использованием подзапросов, используя операторы сравнения,
-- операторы IN, ANY|SOME и ALL, предикат EXISTS
-- 16. Написать 4 запроса по строковым функциям
-- 17. Написать 4 запроса по числовым функциям
-- 18. Создайте 5 представлений по своей БД
-- 19. Покажите применение табличных переменных, временные локальных и глобальных
-- таблиц, а так же обобщенных табличных выражений.
