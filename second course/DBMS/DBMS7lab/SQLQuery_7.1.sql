--create database 
CREATE DATABASE LAB7
-- create table
USE LAB7
CREATE TABLE tableLAB7 (
    id INT PRIMARY KEY,
    fio VARCHAR(255) NOT NULL,
    predmet VARCHAR(30) NOT NULL,
    ush VARCHAR(30) NOT NULL,
    ball FLOAT NOT NULL
);
-- task1.1
USE LAB7 
SELECT predmet, ush, COUNT(fio) AS kol
FROM tableLAB7
GROUP BY predmet, ush

--task1.2 Запрос, 
--который выводит количество учеников по предметам по каждой школе,
-- и промежуточные итоги
USE LAB7 
SELECT predmet, ush, COUNT(fio) AS kol
FROM tableLAB7
GROUP BY predmet, ush WITH ROLLUP

--task2.1  Напишите запрос, который выводит количество учеников по предметам и по школам
SELECT
predmet, ush, COUNT(fio) AS kol
FROM tableLAB7
GROUP BY predmet, ush

--task2.2 Напишите запрос, который выводит количество учеников по предметам и по школам, и промежуточные итоги
SELECT predmet, ush, COUNT(fio) as kol
FROM tableLAB7
GROUP BY predmet, ush WITH CUBE
    
-- task3 Напишите запрос, который выводит количество учеников по предметам и по школам:
SELECT predmet, ush, COUNT(fio) AS kol
FROM tableLAB7
GROUP BY
GROUPING SETS(predmet, ush)

--task4 Напишите запрос, который выводит количество учеников по предметам по каждой школе и промежуточные итоги. NULL значения заменить на соответствующий текст
SELECT COALESCE(predmet, 'RESULT') AS predmet,
        COALESCE(ush, 'result') AS ush,
        COUNT(fio) as kol
FROM tableLAB7
GROUP BY ROLLUP(predmet, ush)
--task5  Напишите запрос, который выводит количество учеников по предметам и по школам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответствующий текст в зависимости от группировки:
SELECT 
    IIF(GROUPING(predmet)=1, 'RESULT', predmet) AS predmet,
    IIF(GROUPING(ush)=1, 'Result', ush) AS ush,
    COUNT(fio) AS kol
FROM tableLAB7
GROUP BY CUBE(predmet, ush)
--task6  Напишите запрос, который выводит количество учеников по предметам и по школам. В итоговых строках NULL значения заменить на соответствующий текст в зависимости от уровней группировки
 SELECT 
    CASE GROUPING_ID(predmet, ush)
        WHEN 1 THEN 'Results in subjects'
        WHEN 3 THEN 'Result'
        ELSE ''
    END AS Result,
    ISNULL(predmet, '') AS predmet,
    ISNULL(ush, '') AS ush,
    COUNT(fio) AS kol
FROM tableLAB7
GROUP BY ROLLUP(predmet, ush)


--III. Самостоятельная работа

--1. Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги.
SELECT 
  CASE 
    WHEN ush IS NULL THEN 'Total' 
    ELSE ush 
  END AS ush,
  CASE 
    WHEN predmet IS NULL THEN 'Total' 
    ELSE predmet 
  END AS predmet,
  MAX(ball) AS max_ball
FROM tableLAB7
GROUP BY ush, predmet WITH ROLLUP;

--2. Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.

SELECT 
  CASE 
    WHEN ush IS NULL THEN 'Total' 
    ELSE ush 
  END AS ush,
  CASE 
    WHEN predmet IS NULL THEN 'Total' 
    ELSE predmet 
  END AS predmet,
  MIN(ball) AS max_ball
FROM tableLAB7
GROUP BY ush, predmet WITH ROLLUP;

-- 3. Напишите запрос, который выводит средний балл учеников по школам и по предметам.
SELECT 
  CASE 
    WHEN ush IS NULL THEN 'Total' 
    ELSE ush 
  END AS ush,
  CASE 
    WHEN predmet IS NULL THEN 'Total' 
    ELSE predmet 
  END AS predmet,
  AVG(ball) AS max_ball
FROM tableLAB7
GROUP BY ush, predmet WITH ROLLUP;

--4. Напишите запрос, который выводит количество учеников по каждой школе по предметам и промежуточные итоги. NULL значения заменить на соответствующий текст.
USE LAB7
SELECT 
  CASE 
    WHEN ush IS NULL THEN 'Total' 
    ELSE ush 
  END AS ush,
  CASE 
    WHEN predmet IS NULL THEN 'Total' 
    ELSE predmet 
  END AS predmet,
  AVG(ball) AS max_ball
FROM tableLAB7
GROUP BY ush, predmet WITH ROLLUP;

--5. Напишите запрос, который выводит суммарный балл учеников по школам и по предметам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответствующий текст в зависимости от группировки.
USE LAB7
SELECT 
COALESCE(ush, 'Result') AS school,
COALESCE(predmet, 'RESULT') AS subject,
COALESCE(SUM(ball), 'N/A') AS total_score
FROM tableLAB7
GROUP BY ROLLUP(predmet, ush)
--6 Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зависимости от уровней группировки.
USE LAB7
SELECT
COALESCE(ush, 'Result') AS scholl,
COALESCE(predmet, 'RESULT') AS subject,
COALESCE(MAX(ball), 'N/A') AS max_ball
FROM tableLAB7
GROUP BY rollup(ush, predmet);



