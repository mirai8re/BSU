--В тестовой БД на языке Т-SQL: создать таблицу employees, задать соответствующие SQl- ограничения и заполнить данными.

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, age, salary)
VALUES (1, 'John Smith', 35, 50000.00),
       (2, 'Jane Doe', 28, 60000.00),
       (3, 'Bob Johnson', 42, 75000.00),
       (4, 'Alice Brown', 31, 55000.00),
       (5, 'Mike Davis', 45, 80000.00);


-- 2. Из таблицы выбрать записи, у которых поле id больше 2-х и меньше 4-х
SELECT * FROM employees
WHERE id > 2 AND id < 4;

-- 3. Из таблицы выбрать у которых зарплата равна 400 или возраст 23 (хотя бы одно и них)
SELECT * FROM employees
WHERE salary = 400 OR age = 23;

-- 4. Из таблицы выбрать записи с id от 2-х до 4-х включительно и чтобы при этом зарплата
-- была 500
SELECT * FROM employees
WHERE id >= 2 AND id <= 4 AND salary = 500;

-- 5. Из таблицы выбрать с id, НЕ равным 1, 3 и 5
SELECT * FROM employees
WHERE id NOT IN (1, 3, 5);

-- 6. Найти среднюю зарплату по всей таблице
SELECT AVG(salary) FROM employees;

-- 7. Подсчитать в таблице одновременно количество разных возрастов и количество разных
-- зарплат
SELECT age, COUNT(DISTINCT age) as age_count, COUNT(DISTINCT salary) as salary_count
FROM employees
GROUP BY age;
-- 8. Выбрать все уникальные значения зарплат из таблицы
SELECT DISTINCT salary FROM employees;
-- 9. Выберем те записи, у которых возраст начинается с цифры 2, а затем идет еще один
-- символ
SELECT * FROM employees
WHERE age LIKE '2_';
-- 10. Найти минимальное значение зарплаты среди тех записей, у которых id больше или равен
-- 2-м
SELECT MIN(salary) FROM employees
WHERE id >= 2;
-- 11. Записи таблицы сгруппировать по возрасту и подсчитать максимальную зарплату внутри
-- каждой группы
SELECT age, MAX(salary) as max_salary
FROM employees
GROUP BY age;

-- 12. Выделите (Подчеркните) правильный ответ:
-- Операторы =, <>, <=, >=, <, > относятся к 1)Реляционным операторам 2)Логическим операторам 3)Специальным операторам 4)Агрегатным функциям
-- 5)Нет правильного варианта

-- Правильный ответ: 1) Реляционным операторам.

-- 13. Выделите (Подчеркните) правильный ответ:
-- Какие из агрегатных функций используют только числовые поля? 1)SUM, AVG
-- 2)COUNT, SUM
-- 3)MAX, MIN
-- 4)AVG, MAX, MIN
-- 5)Все выше перечисленные

-- Правильный ответ: 1) SUM, AVG.


-- 14. Создать таблицу Отдел, задать соответствующие SQl-ограничения на уровне таблицы. Таблица Отдел c полями (Id Отдел, наименование)
-- Установить связи между таблицами employees, Отдел, вывести диаграмму связей.

CREATE TABLE Отдел (
    Id_отдел INT PRIMARY KEY,
    наименование VARCHAR(50) NOT NULL
);

INSERT INTO Отдел  (Id_отдел, наименование) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Finance');


ALTER TABLE employees
ADD id_отдел INT;

INSERT INTO employees (id, name, Id_отдел) VALUES
(6, 'John Doe', 1),
(7, 'Jane Smith', 2),
(8, 'Bob Johnson', 1);


sp_helptable


CREATE SCHEMA myschema;  -- create a new schema to hold the diagram
GO

-- generate the diagram and save it as an image
EXEC sp_adddiagram 'employees', @diagramname = 'Employee_Department_Diagram', @vOwnerID = 1, @iOptions = 0x11;

-- open the diagram
EXEC sp_helpdiagrams 'myschema.Employee_Department_Diagram';


ALTER TABLE employees
ADD CONSTRAINT fk
