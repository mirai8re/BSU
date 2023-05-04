
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
-- 5. Переименуйте одну из таблиц вашей БД
-- 6. Добавьте по две записи в каждую из таблиц вашей БД
-- 7. Измените одну из таблиц вашей БД:
-- • добавьте по смыслу один столбец
-- • добавьте ограничение с именем на новый введенный вами столбец
-- 8. Напишите 5 запросов, используя агрегатные функции (SUM, MAX, MIN, AVG,
-- COUNT)
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
