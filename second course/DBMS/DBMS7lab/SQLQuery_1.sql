CREATE TABLE dbo.test_table
(
id INT IDENTITY(1,1) NOT NULL,
manager VARCHAR(50) NULL,
otdel VARCHAR(50) NULL,
god INT NULL,
summa MONEY NULL
)

INSERT INTO test_table( manager, otdel, god, summa) VALUES ( 'Emloyee_6', 'Sales departament', 2014, 150), ( 'Emloyee_7', 'Sales departament', 2014, 300), ( 'Emloyee_1', 'Accounting', 2015, 230), ( 'Emloyee_2', 'Accounting', 2015, 200), ( 'Emloyee_3', 'Shopping departament', 2015, 200), ( 'Emloyee_4', 'Shopping departament', 2015, 300), ( 'Emloyee_5', 'Sales departament', 2015, 200), ( 'Emloyee_6', 'Shopping departament', 2015, 250), ( 'Emloyee_7', 'Shopping departament', 2015, 350)

--3.1 Получить сумму расхода на оплату труда по отделам и по годам, и сначала
--давайте попробуем написать запрос с группировкой без использования оператора
--ROLLUP.

SELECT otdel, god, SUM(summa) AS itog
FROM dbo.test_table
GROUP BY otdel, god
ORDER BY otdel, god

--3.2 общий расход по каждому отделу. Для этих целей мы можем использовать
--оператор ROLLUP.

SELECT otdel, god, SUM(summa) AS itog
FROM test_table
GROUP BY ROLLUP (otdel, god)

--3.3. Использовать rollup и с группировкой по одному полю, например:
--Группировка по отделам с общим итогом

SELECT otdel,  SUM(summa) AS Total
FROM dbo.test_table
GROUP BY ROLLUP(otdel)


-- Группировка по годам с общим итогом
SELECT god,  SUM(summa) AS Total
FROM dbo.test_table
GROUP BY ROLLUP(god)

--4.1. Напишем практически такой же SQL запрос как в 3.2, только вместо rollup укажем
--cube и посмотрим на полученный результат
SELECT otdel, god, SUM(summa) AS itog
FROM test_table
GROUP BY CUBE (otdel, god)

--GROUPING SETS – оператор Transact-SQL, который формирует результаты
--нескольких группировок в один набор данных
SELECT otdel, god, SUM(summa) AS itog
FROM test_table
GROUP BY 
GROUPING SETS(otdel, god)

--6. GROUPING – функция Transact-SQL, которая возвращает истину, если указанное
--выражение является статистическим, и ложь, если выражение нестатистическое.

SELECT otdel,
ISNULL (CAST(god AS VARCHAR(30)),
    CASE WHEN GROUPING(god)=1 AND GROUPING(otdel)= 0
        THEN 'Subtotal' ELSE 'Total' END) AS god,
    
    SUM(summa) as total,
    GROUPING(otdel) AS grouping_otdel,
    GROUPING(god) AS grouping_god
    
FROM test_table
GROUP BY 
ROLLUP(otdel, god)