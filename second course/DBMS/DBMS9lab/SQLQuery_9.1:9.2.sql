CREATE DATABASE LAB9
USE LAB9
--1 Создайте в вашей рабочей БД Таблицу Tabl_Kontinents следующего вида.
-- Определите структуру, введите данные
CREATE TABLE Tabl_Kontinents(
  Nazvanie NVARCHAR(50),
  Stolica NVARCHAR(50),
  PL INT,
  KolNas INT,
  Kontinent NVARCHAR(50)
);


INSERT INTO Tabl_Kontinents
  (Nazvanie, Stolica, PL, KolNas, Kontinent)
VALUES
  (N'Австрия', N'Вена', 83858, 8741753, N'Европа'),
  (N'Азербайджан', N'Баку', 86600, 9705600, N'Азия'),
  (N'Албания', N'Тирана', 28748, 2866026, N'Европа'),
(N'Алжир', N'Алжир', 2381740, 39813722, N'Африка'),
(N'Ангола', N'Луанда', 1246700, 25831000, N'Африка'),
(N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка'),
(N'Афганистан', N'Кабул', 647500, 29822848, N'Азия'),
(N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия'),
(N'Бахрейн', N'Манама', 701, 1397000, N'Азия'),
(N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка'),
(N'Белоруссия', N'Минск', 207595, 9498400, N'Европа'),
(N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа'),
(N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка'),
(N'Болгария', N'София', 110910, 7153784, N'Европа'),
(N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка'),
(N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка'),
(N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка'),
(N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка'),
(N'Бутан', N'Тхимпху', 47000, 784000, N'Азия'),
(N'Великобритания', N'Лондон', 244820, 65341183, N'Европа'),
(N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа'),
(N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка'),
(N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия'),
(N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия');



-- Задание 2.1.6 Самостоятельная работа
-- 1. Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
USE LAB9
SELECT *
FROM Tabl_Kontinents
WHERE PL<500
UNION
SELECT *
FROM Tabl_Kontinents
WHERE PL>5000000

-- 2. Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с населением меньше 100 млн. чел.:
USE LAB9
SELECT *
FROM Tabl_Kontinents
WHERE PL>100000
EXCEPT
SELECT *
FROM Tabl_Kontinents
WHERE KolNas<100000000
-- 3. Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100 тыс. чел.
USE LAB9
SELECT *
FROM Tabl_Kontinents
WHERE PL<500
INTERSECT
SELECT *
FROM Tabl_Kontinents
WHERE KolNas < 100000




-- 3. Самостоятельная работа.
-- 1. Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
USE LAB9
SELECT  Nazvanie, Stolica, PL, KolNas, Kontinent,
ROUND(CAST(PL AS float)*100/
(   SELECT SUM(PL)
    FROM Tabl_Kontinents
), 3) 
FROM Tabl_Kontinents

-- 2. Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
USE LAB9 
SELECT *
FROM Tabl_Kontinents
WHERE (KolNas/PL)> (SELECT(AVG(KolNas/PL)) FROM Tabl_Kontinents)
-- 3. С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent 
FROM(
  SELECT Nazvanie, Stolica, PL, KolNas, Kontinent 
  FROM Tabl_Kontinents
  WHERE Nazvanie = N'Европа')  A
WHERE (KolNas<5000000)

-- 4. Вывести список стран и процентное соотношение их площади к суммарной площади той части мира, где они находятся.
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent, ROUND(CAST(PL AS float)*100/(
  SELECT SUM(PL) FROM Tabl_Kontinents TC2
  WHERE TC1.Kontinent=TC2.Kontinent
), 3) 
FROM Tabl_Kontinents TC1 
-- 5. Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
SELECT * 
FROM Tabl_Kontinents TC1
WHERE(PL>(
  SELECT AVG(PL)
  FROM Tabl_Kontinents TC2
  WHERE TC1.Kontinent=TC2.Kontinent
))
-- 6. Вывести список стран мира, которые находятся в тех частях света, средняя плотность населения которых превышает общемировую.
SELECT * 
FROM Tabl_Kontinents
WHERE Kontinent IN (
  SELECT Kontinent
  FROM Tabl_Kontinents
  GROUP BY Kontinent HAVING AVG(KolNas/PL)> (
    SELECT AVG(KolNas/PL) FROM Tabl_Kontinents
  )
)
-- 7. Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT *
FROM Tabl_Kontinents WHERE Kontinent= N'Южная Америка' AND (KolNas> ALL(
  SELECT KolNas
  FROM Tabl_Kontinents
  WHERE Kontinent = N'Африка'
))
-- 8. Вывести список африканских стран, в которых живет больше людей, чем хотя бы в одной южноамериканской стране.
SELECT * 
FROM Tabl_Kontinents WHERE Kontinent = N'Африка' AND KolNas> ANY(
  SELECT KolNas 
  FROM Tabl_Kontinents
  WHERE Kontinent = N'Южная Америка'
)
-- 9. Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
SELECT * 
FROM Tabl_Kontinents WHERE Kontinent = N'Африка' AND EXISTS (
  SELECT * 
  FROM Tabl_Kontinents WHERE Kontinent=N'Африка'AND KolNas>2000000
)
-- 10. Вывести список стран той части света, где находится страна «Фиджи».// Ангола
SELECT * 
FROM Tabl_Kontinents
WHERE Kontinent = (
  SELECT Kontinent
  FROM Tabl_Kontinents WHERE Nazvanie = N'Ангола'
)
-- 11. Вывести список стран, население которых не превышает население страны «Фиджи».// Ангола 
SELECT * 
FROM Tabl_Kontinents
WHERE KolNas !> (
  SELECT KolNas
  FROM Tabl_Kontinents WHERE Nazvanie = N'Ангола'
)
-- 12. Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT t1.Nazvanie AS 'Страна с наибольшим населением среди стран с наименьшей площадью на каждом континенте',
       t1.Kontinent
FROM Tabl_Kontinents t1
JOIN (
    SELECT Kontinent, MIN(PL) AS 'Минимальная площадь'
    FROM Tabl_Kontinents
    GROUP BY Kontinent
) t2 ON t1.Kontinent = t2.Kontinent AND t1.PL = t2.[Минимальная площадь]
WHERE t1.KolNas = (
    SELECT MAX(KolNas)
    FROM Tabl_Kontinents
    WHERE Kontinent = t1.Kontinent AND PL = t2.[Минимальная площадь]
)





