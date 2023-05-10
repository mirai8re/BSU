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
EXEC sp_rename 'Clients', 'Customers';
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
-- количество пицц каждого типа
USE PizzaDB
SELECT PizzaTypeID, COUNT(*) as Count
FROM Pizza
GROUP BY PizzaTypeID;
--средний счет заказа для каждого клиента
SELECT CustomerID, AVG(TotalCost) as AverageCost
FROM Orders
GROUP BY CustomerID;
-- 10. Написать 2 запроса на фильтрацию групп, используя HAVING.
--список заказов и суммарную стоимость для каждого заказа, у которых суммарная стоимость больше 20 
SELECT OrderID, SUM(TotalCost) AS TotalCost
FROM Orders
GROUP BY OrderID
HAVING SUM(TotalCost) > 20;
--выбирает ID клиентов и количество заказов для каждого клиента, у которых есть два или более заказа
SELECT CustomerID, COUNT(*) AS NumOrders
FROM Orders 
GROUP BY CustomerID
HAVING COUNT(*) >= 2;

-- 11. Написать запросы на расширения SQL Server для группировки (ROLLUP//общий итог и промежуточные, CUBE,
-- GROUPING SETS, OVER)
--ROLLUP//общая сумма заказов для каждого клиента и общая суммф заказов для всех клиентов
SELECT CustomerID, SUM(TotalCost) as Total
FROM Orders
GROUP BY ROLLUP(CustomerID)
--CUBE для получения общего количества заказов по датам, клиентам и итогового количества заказов:
SELECT CONVERT(date, OrderDate) AS OrderDate, CustomerID, COUNT(*) AS NumOrders
FROM Orders
GROUP BY CUBE(CONVERT(date, OrderDate), CustomerID)
--GROUPING SETS для вычисления суммарной стоимости заказов по дате и по клиенту, а также общую сумму по всем заказам
SELECT CustomerID, OrderDate, SUM(TotalCost) as Total
FROM Orders
GROUP BY GROUPING SETS((CustomerID, OrderDate), CustomerID, OrderDate)
--средняя стоимость заказа для каждого заказчика, а также для всех заказов в целом
SELECT CustomerID, OrderDate, TotalCost,
  AVG(TotalCost) OVER (PARTITION BY CustomerID) AS AvgCustomerOrderCost,
  AVG(TotalCost) OVER () AS AvgTotalOrderCost
FROM Orders;

-- 12. Написать запрос на разворачивание данных (PIVOT), отмена разворачивания
-- (UNPIVOT).

--PIVOT
--//each row represents a different customer, and each column represents a different order. 
-- The values in each cell represent the total cost of the order for that customer. 
-- If a customer did not place an order with a particular order ID, the corresponding cell will be NULL.
SELECT CustomerID, [1], [2], [3], [4], [5]
FROM (
  SELECT CustomerID, OrderID, TotalCost
  FROM Orders
) AS SourceTable
PIVOT (
  SUM(TotalCost)
  FOR OrderID IN ([1], [2], [3], [4], [5])
) AS PivotTable;

--UNPIVOT//transform the data back to its original form
SELECT CustomerID, OrderID, TotalCost
FROM (
  SELECT CustomerID, [1], [2], [3], [4], [5]
  FROM (
    SELECT CustomerID, OrderID, TotalCost
    FROM Orders
  ) AS SourceTable
  PIVOT (
    SUM(TotalCost)
    FOR OrderID IN ([1], [2], [3], [4], [5])
  ) AS PivotTable
) AS PivotedTable
UNPIVOT (
  TotalCost FOR OrderID IN ([1], [2], [3], [4], [5])
) AS UnpivotedTable
WHERE CustomerID IN (2, 3);--used to filter the results to only show data for customers 2 and 3

-- 13. Написать по два запроса на каждое соединение таблиц: внутреннее, внешнее
-- левое, внешнее правое, полное внешнее соединение.
--INNER JOIN
-- список заказов и соответствующих им клиентов
SELECT o.OrderID, o.OrderDate, o.TotalCost, c.FirstName
FROM Orders o
INNER JOIN Clients c ON o.CustomerID = c.CustomerID;
-- список пицц и соответствующих им ингридиенты 
SELECT *
FROM PizzaIngredients PI
INNER JOIN Ingredients I ON PI.IngredientID = I.IngredientID;
--
--OUTER JOIN
--Получить информацию о всех заказах вместе с именем и фамилией заказчика, включая заказы, у которых нет связанного заказчика
SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Orders.TotalCost, Clients.FirstName, Clients.LastName
FROM Orders
LEFT OUTER JOIN Clients
ON Orders.CustomerID = Clients.CustomerID;
--Получить информацию о всех ингредиентах и типах пиццы, включая ингредиенты и типы пиццы, которые не использовались ни в одной пицце.
SELECT PizzaTypes.Name AS PizzaName, Ingredients.Name AS IngredientName
FROM PizzaTypes
LEFT OUTER JOIN PizzaIngredients
ON PizzaTypes.PizzaTypeID = PizzaIngredients.PizzaID
LEFT OUTER JOIN Ingredients
ON PizzaIngredients.IngredientID = Ingredients.IngredientID;
--
--LEFT JOIN
--Получить информацию о всех заказах вместе с именем и фамилией заказчика, включая заказы, у которых нет связанного заказчика
SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Orders.TotalCost, Customers.FirstName, Customers.LastName
FROM Orders
LEFT JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID;
--Получить информацию о всех типах пиццы и их ингредиентах, включая типы пиццы, у которых нет связанных ингредиентов.
SELECT PizzaTypes.Name AS PizzaName, Ingredients.Name AS IngredientName
FROM PizzaTypes
LEFT JOIN PizzaIngredients
ON PizzaTypes.PizzaTypeID = PizzaIngredients.PizzaID
LEFT JOIN Ingredients
ON PizzaIngredients.IngredientID = Ingredients.IngredientID;
--
--RIGHT JOIN
--Cписок всех заказов вместе со всеми заказчиками, которые сделали эти заказы.
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;
--список всех заказов,все имена и фамилии клиентов, которые делали заказы, а также даты заказов
SELECT Customers.FirstName, Customers.LastName, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
--
--FULL OUTER JOIN
--все записи из таблицы Customers и связанных с ними адресов из таблицы Addresses
SELECT *
FROM Customers
FULL OUTER JOIN Addresses
ON Customers.CustomerID = Addresses.CustomerID;
--Все записи из таблицы PizzaTypes и связанных с ними ингредиентов из таблицы Ingredients
SELECT *
FROM PizzaTypes
FULL OUTER JOIN PizzaIngredients
ON PizzaTypes.PizzaTypeID = PizzaIngredients.PizzaID
FULL OUTER JOIN Ingredients
ON PizzaIngredients.IngredientID = Ingredients.IngredientID;
-- 14. Написать по два запроса на пересечение, разность, объединение таблиц
--Intersection - возвращает только те строки, которые есть в обеих таблицах
--Найти общих заказчиков, которые оформляли заказы и на Маргариту, и на Пепперони:
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Pizza p ON o.OrderID = p.PizzaID
JOIN PizzaTypes pt ON p.PizzaTypeID = pt.PizzaTypeID
WHERE pt.Name = 'Margherita'
INTERSECT
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Pizza p ON o.OrderID = p.PizzaID
JOIN PizzaTypes pt ON p.PizzaTypeID = pt.PizzaTypeID
WHERE pt.Name = 'Pepperoni'
--список клиентов, которые и являются заказчиками, и оставляли заказы
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
INTERSECT
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
--EXCEPT
--Найти всех заказчиков, которые еще не делали заказов
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
EXCEPT
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
--Найти все адреса, которые не были использованы в заказах.
SELECT DISTINCT a.Street, a.City, a.State, a.ZipCode
FROM Addresses a
EXCEPT
SELECT DISTINCT a.Street, a.City, a.State, a.ZipCode
FROM Addresses a
JOIN Orders o ON a.CustomerID = o.CustomerID;
--UNION
-- Найти все адреса заказчиков и адреса, которые не были использованы в заказах.
SELECT DISTINCT a.Street, a.City, a.State, a.ZipCode
FROM Addresses a
JOIN Customers c ON a.CustomerID = c.CustomerID
UNION
SELECT DISTINCT a.Street, a.City, a.State, a.ZipCode
FROM Addresses a
WHERE a.CustomerID NOT IN (SELECT CustomerID FROM Orders);
--выбирает имена, фамилии, электронные адреса и телефоны всех клиентов с фамилией 'Doe' или 'Smith'
SELECT FirstName, LastName, Email, Phone
FROM Customers
WHERE LastName = 'Doe'
UNION
SELECT FirstName, LastName, Email, Phone
FROM Customers
WHERE LastName = 'Smith'

-- 15. Написать 4 запроса с использованием подзапросов, используя операторы сравнения,
-- операторы IN, ANY|SOME и ALL, предикат EXISTS
--Найти все заказы, которые были сделаны в тот же день, что и заказ с номером 1.
SELECT *
FROM Orders
WHERE CONVERT(DATE, OrderDate) = (
  SELECT CONVERT(DATE, OrderDate)
  FROM Orders
  WHERE OrderID = 1
)
--Найти всех клиентов, у которых есть хотя бы один заказ на сумму больше, чем 20 долларов.
SELECT *
FROM Customers
WHERE CustomerID IN (
  SELECT CustomerID
  FROM Orders
  WHERE TotalCost > 20
);
--Найти все виды пицц, которые содержат ингредиент "Mozzarella".
SELECT *
FROM PizzaTypes
WHERE PizzaTypeID IN (
  SELECT PizzaID
  FROM PizzaIngredients
  WHERE IngredientID = (
    SELECT IngredientID
    FROM Ingredients
    WHERE Name = 'Mozzarella'
  )
);
--Найти всех клиентов, у которых есть заказы, и которые проживают в городе, где есть пиццерия
SELECT *
FROM Customers
WHERE EXISTS (
  SELECT *
  FROM Addresses
  WHERE Addresses.CustomerID = Customers.CustomerID
    AND Addresses.City IN (
      SELECT City
      FROM Addresses
      WHERE CustomerID IN (
        SELECT CustomerID
        FROM Orders
      )
    )
);
-- 16. Написать 4 запроса по строковым функциям
--Запрос на выборку имен пользователей, где первая буква имени заглавная
SELECT FirstName FROM Customers WHERE LEFT(FirstName, 1) = UPPER(LEFT(FirstName, 1));
-- Запрос на выборку адресов, где город начинается на букву "S"
SELECT City FROM Addresses WHERE LEFT(City, 1) = 'S';
--Запрос на выборку email, где доменная часть является "yahoo.com"
SELECT Email FROM Customers WHERE RIGHT(Email, 10) = '@yahoo.com';
--Запрос на выборку адресов, где улица состоит более чем из одного слова
SELECT Street FROM Addresses WHERE LEN(Street) - LEN(REPLACE(Street, ' ', '')) > 0;
-- 17. Написать 4 запроса по числовым функциям
--среднее значение стоимости всех пицц в заказе
SELECT ROUND(AVG(TotalCost), 2) AS avg_cost FROM Orders;
--максимальную и минимальную стоимость пиццы
SELECT MAX(TotalCost) AS max_cost, MIN(TotalCost) AS min_cost FROM Orders;
--    квадратный корень стоимости самой дорогой пиццы в заказе
SELECT SQRT(MAX(TotalCost)) AS max_sqrt FROM Orders;
--результат деления стоимости самой дорогой пиццы на стоимость самой дешевой пиццы
SELECT MAX(TotalCost) / MIN(TotalCost) AS cost_ratio FROM Orders;






-- 18. Создайте 5 представлений по своей БД
-- 19. Покажите применение табличных переменных, временные локальных и глобальных
-- таблиц, а так же обобщенных табличных выражений.
