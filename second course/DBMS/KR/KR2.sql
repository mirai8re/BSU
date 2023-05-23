-- 1. В тестовой БД на языке Т-SQL: создать таблицу users, задать соответствующие SQl- ограничения и заполнить данными.
CREATE TABLE users (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    age INT NOT NULL,
    sex VARCHAR(10) NOT NULL CHECK (sex IN ('M', 'W'))
);
INSERT INTO users (id, first_name, last_name, birthday, age, sex)
VALUES (1, 'John', 'Doe', '1990-01-01', 31, 'M'),
       (2, 'Jane', 'Doe', '1995-03-15', 17, 'W'),
       (3, 'Bob', 'Smith', '1985-05-10', 15, 'M'),
       (4, 'Alice', 'Smith', '1992-12-25', 29, 'W');
-- 2. Выбрать данные из таблицы users возраст пользователей которых больше 18.
SELECT *
FROM users
WHERE age > 18;
-- 3. Выполнить сортировку записей по двум поля, сперва по фамилии, затем по имени
SELECT *
FROM users
ORDER BY last_name, first_name;

-- 4. Упорядочить данные в таблице users по дате рождения (по убыванию).
SELECT *
FROM users
ORDER BY birthday DESC;

-- 5. Выбрать в таблице users всех совершенолетних мужчин.
SELECT *
FROM users
WHERE age >= 18 AND sex = 'M';
-- 6. Подсчитать в таблице всех пользователей с возрастом 23 года
SELECT COUNT(*)
FROM users
WHERE age = 23;
-- 7. Выбрать все уникальные значения по полю возраст из таблицы users
SELECT DISTINCT age
FROM users;
-- 8. Выберем те записи, у которых возраст начинается с цифры 1, а затем идет еще один символ
SELECT *
FROM users
WHERE CAST(age AS VARCHAR(10)) LIKE '1_';
-- 9. Записи таблицы сгруппировать по возрасту и подсчитать количество записей в каждой группе 
SELECT age, COUNT(*)
FROM users
GROUP BY age;
-- 10. Введите дополнительный столбец SALARY (зарплата) в таблицу users,
ALTER TABLE users
ADD SALARY MONEY;
-- 11. Установите по умолчанию столбец SALARY (зарплата) значение 0, и задайте имя ограничению 
ALTER TABLE users
ADD CONSTRAINT DF_SALARY DEFAULT 0 FOR SALARY;
-- 12. Выделите (Подчеркните) предложение команды Select, которое позволяет устанавливать условия для агрегатных функций
-- 1) Order by
-- 2) Distinct
-- 3) Where
-- 4) Having
-- 5) Group by

--     Для установки условий для агрегатных функций используется предложение HAVING, например:
-- SELECT age, COUNT(*)
-- FROM users
-- GROUP BY age
-- HAVING COUNT(*) > 1;

-- 13. Выделите (Подчеркните) среди предложенных названий то, которое является названием агрегатной функции
-- 1) COUNT
-- 2) SUM
-- 3) AVG
-- 4) MAX
-- 5) MIN
-- 6) Все варианты верные

-- Все варианты верные, т.к. COUNT, SUM, AVG, MAX и MIN являются агрегатными функциями.

-- 14. Создать таблицы Product и Заказ, задать соответствующие SQl-ограничения на уровне таблиц Таблица Product c полями (Id продукта, наименование, стоимость)
-- Таблица Заказ с полями ( Id заказа, Id users, Id продукта, количество, дата покупки) Установить связи между таблицами users, Product, Заказ и вывести диаграмму связей
-- Дополнительно оцениваются тестовые 

-- Создание таблицы Product
CREATE TABLE Product (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы Заказ
CREATE TABLE Orders (
    Id INT PRIMARY KEY,
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

-- Вывод диаграммы связей
EXEC sp_msdependencies @intrans = 1;


-- Задания 15-16 по 0,5 баллов каждый
-- 15. Привести пример использования оператора ROLLUP, который формирует промежуточные итоги для каждого указанного элемента и общий итог, по своей индивидуальной БД, разработанной в лаб.4, и описанной в лаб. 5.4 (При группировке по нескольким критериям ROLLUP будет создавать суммирующую строку для каждой из подгрупп)
-- 16. Привести пример использования оператора CUBE, который формирует результаты для всех возможных перекрестных вычислений (добавляет суммирующие строки для каждой комбинации групп), по своей индивидуальной БД, разработанной в лаб.4, и описанной в лаб. 5.4