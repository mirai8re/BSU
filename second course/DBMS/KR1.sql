--1. В тестовой БД на языке Т-SQL: создать таблицу CUSTOMERS, задать соответствующие SQl-ограничения и заполнить данными (1 балл)

CREATE TABLE CUSTOMERS(
    ID INT IDENTITY (1,1) NOT NULL,
    NAME VARCHAR(50) NULL, 
    AGE INT NULL,
    ADDRESS VARCHAR(50) NULL,
    SALARY MONEY NULL
)
INSERT INTO CUSTOMERS( NAME, AGE, ADDRESS, SALARY) VALUES 
( 'Maxim', 35, 'Moscow', 21000),
('AndreyEX', 38, 'Krasnodar', 555000), 
('Oleg', 33, 'Rostov', 34000), 
('Masha', 35, 'Moscow', 31500), 
('Ruslan', 34, 'Omsk', 43000), 
('Dima', 32, 'SP', 45000), 
('Roma', 34, 'SP', 10000) 
--2. Вывести первые 3 записи из таблицы CUSTOMERS
SELECT TOP 3 * FROM CUSTOMERS
--3. Вывести поля идентификатора, имени и зарплату из таблицы CUSTOMERS, где зарплата
--больше, чем 33000
SELECT ID, NAME, SALARY
FROM CUSTOMERS
WHERE SALARY > 33000
--4. Вывести поля ID, NAME и SALARY из таблицы CUSTOMER, у кого зарплата больше,
--чем 44000, а возраст составляет менее 35 лет
SELECT ID, NAME, SALARY
FROM CUSTOMERS
WHERE (SALARY>44000) AND (AGE<35)

--5. Найдем максимальное значение зарплаты среди тех записей, у которых id меньше или
--равен 4-м
SELECT MAX(SALARY)
FROM CUSTOMERS 
WHERE (ID<= 4)
-- 6. Отобразить все записи из таблицы клиентов, где SALARY начинается с 4.
SELECT *
FROM CUSTOMERS
WHERE(SALARY LIKE '4%')
-- 7. Произвести сортировку в порядке возрастания по NAME и SALARY
SELECT *
FROM CUSTOMERS
ORDER BY 
NAME ASC,
SALARY ASC
-- 8. Произвести сортировку в порядке убывания по NAME.
SELECT *
FROM CUSTOMERS
ORDER BY NAME DESC
-- 9. Вывести общую сумму заработной платы каждого клиента
SELECT SUM(SALARY) AS 'TOTAL'
FROM CUSTOMERS
-- 10. Вывести поля зарплата, устранив дублирующие записи--
SELECT DISTINCT SALARY 
FROM CUSTOMERS
-- 11. Добавьте в таблицу CUSTOMERS две записи, поле зарплата оставить пустым.
-- 8 |Dima | 32 | SP | |
-- 9| Roma | 34 | SP | |
INSERT INTO CUSTOMERS (NAME, AGE, ADDRESS, SALARY)
VALUES('Dima', 32, 'SP', ''), 
('Roma', 34,'SP', '')
-- Вывести записи таблицы CUSTOMER только содержащие зарплаты, не ноль
SELECT * 
from CUSTOMERS
WHERE(SALARY!=0)
-- 12. Введите дополнительный столбец Pol в таблицу CUSTOMER, который может принимать два значения М или Ж
ALTER TABLE CUSTOMERS ADD POL CHAR(1) NOT NULL DEFAULT 'М'
-- 13. Записи таблицы сгруппировать по возрасту и вывести поля AGE групп возраста, в которых записей было больше или равно 2
SELECT AGE, COUNT(*) AS TOTAL
FROM CUSTOMERS
GROUP BY AGE
HAVING (COUNT(*) >=2)
-- 14. Создать таблицу Специальность, задать соответствующие SQl-ограничения на уровне таблицы. Таблица Специальность c полями (Id Специальность, наименование)
-- Установить связи между таблицами CUSTOMERS, Специальность, вывести диаграмму
-- связей.

-- CREATE TABLE Специальность(
--     ID_Специальность INT NOT NULL PRIMARY KEY, 
--     Наименование VARCHAR(50) NOT NULL,
-- )

-- ALTER TABLE CUSTOMERS
-- ADD CONSTRAINT fk_Специальность_Id_Специальность
-- FOREIGN KEY (ID_Специальность)
-- REFERENCES Специальность(ID_Специальность)

-- CREATE TABLE  Spec(
--     ID_Spec INT NOT NULL PRIMARY KEY, 
--     Spec_name VARCHAR(50) NOT NULL,
-- )
-- -- ALTER TABLE CUSTOMERS ADD ID_Spec INT NOT NULL
-- -- ALTER TABLE CUSTOMERS ADD CONSTRAINT FK_Spec_ID_Spec
-- -- FOREIGN KEY(ID_Spec)
-- -- REFERENCES Spec(ID_Spec)
-- ALTER TABLE CUSTOMERS
-- ADD CONSTRAINT FK_Spec_ID_Spec FOREIGN KEY (Id_Spec) REFERENCES Специальность(Id_Специальность);
-- Создание таблицы Специальность
CREATE TABLE Специальность (
    Id_Специальность INT PRIMARY KEY,
    наименование VARCHAR(50) NOT NULL
);

-- Создание внешнего ключа на стороне таблицы CUSTOMERS не ебу
ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_Customer_Id_Spec
FOREIGN KEY (Id_Специальность)
REFERENCES Специальность (Id_Специальность);

ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_Customer_SpecialtyId
FOREIGN KEY (SpecialtyId)
REFERENCES Специальность (Id_Специальность);


-- Вывод диаграммы связей
EXEC sp_help 'CUSTOMERS';
