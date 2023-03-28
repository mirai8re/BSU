
-- 1. Напишите запрос, который выводит количество учеников по предметам по
--столбцам:
USE LAB7
SELECT 'Quantity' AS [Number of stedents per subject],
math,
physics,
chemistry
FROM(
    SELECT
    predmet, fio
    FROM tableLAB7
)
AS SOURCE_TABLE
PIVOT(
    COUNT(fio)
    FOR predmet IN (math, physics, chemistry)
) AS PIVOT_TABLE

--2. Напишите запрос для вывода количества учеников для каждой школы по
--каждому предмету (школы должны быть указаны в строках, предметы в столбцах): SELECT
USE LAB7
SELECT 
    ush,
    math,
    physics,
    chemistry
FROM(
    SELECT
    ush, predmet, fio
    FROM tableLAB7
) 
AS SOURCE_TABLE
PIVOT(
    COUNT(fio)
    FOR predmet IN (math, physics, chemistry)
)
AS PIVOT_TABLE

--3. Напишите запрос, который выводит фамилию учеников и предметы вместе со
--школами в один столбец
SELECT 
fio,
[school or subject]
FROM tableLab7
UNPIVOT([school or subject] for value IN (ush, predmet)) unpvt

--Самостоятельная работа:
--4. Напишите запрос, который выводит средний балл учеников по школам в столбцы.
SELECT 'AVERAGE' AS [AVERAGE SCORE PER SCHOOL],
lyceum,
school,
gymnasium
FROM(
    SELECT 
    ush, ball
    FROM tableLab7
)
AS SOURCE_TABLE 
PIVOT(
    AVG(ball)
    FOR ush IN (lyceum,
school,
gymnasium)
) AS PIVOT_TABLE


--5. Напишите запрос, который выводит средний балл учеников по школам в столбцы и
--по предметам в строки.
SELECT 
predmet,
lyceum,
school,
gymnasium
FROM (
    SELECT 
    ush, predmet, ball
    FROM tableLab7
)
AS SOURCE_TABLE
PIVOT (
    AVG(ball)
    FOR ush IN (
        lyceum,
        school,
        gymnasium)
)AS PIVOT_TABLE

--6. Напишите запрос, который выводит названия предметов, фамилии учеников и
--школы в один столбец
SELECT 
CONCAT(predmet, ', ', fio, ', ', ush) AS ALL_INFORMATON
FROM tableLab7




--7
CREATE TABLE teat_table_pivot(
    fio VARCHAR(50) NULL,
    god int NULL,
    summa FLOAT NULL
)
--
SELECT fio, [2011], [2012], [2013], [2014], [2015]
FROM dbo.teat_table_pivot
PIVOT (sum(summa) for god in ([2011], [2012], [2013], [2014], [2015])) AS test_pivot



