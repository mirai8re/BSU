--1 Создайте в вашей рабочей БД Таблицу Tabl_Kontinent$ следующего вида.
-- Определите структуру, введите данные
CREATE TABLE Tabl_Kontinent$ (
  Nazvanie VARCHAR(50),
  Stolica VARCHAR(50),
  PL INT,
  KolNas INT,
  Kontinent VARCHAR(50)
);

INSERT INTO Tabl_Kontinent$
  (Nazvanie, Stolica, PL, KolNas, Kontinent)
VALUES
  ('Австрия', 'Вена', 83858, 8741753, 'Европа'),
  ('Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
  ('Албания', 'Тирана', 28748, 2866026, 'Европа'),
('Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
('Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
('Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
('Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
('Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
('Бахрейн', 'Манама', 701, 1397000, 'Азия'),
('Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
('Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
('Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
('Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
('Болгария', 'София', 110910, 7153784, 'Европа'),
('Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
('Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
('Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
('Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
('Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
('Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
('Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
('Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
('Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
('Вьетнам', 'Ханой', 329560, 91713300, 'Азия');

--Задание 2. Вывести максимальную площадь стран
SELECT MAX(PL) AS max_pl
FROM Tabl_Kontinent$;

--Задание 3. Вывести наименьшее население стран в Африке
SELECT MIN(KolNas)
FROM  Tabl_Kontinent$
WHERE (Kontinent = 'Африка')

--Задание 4. Вывести суммарное население стран Северной и Южной Америки
SELECT SUM(KolNas) AS total_population
FROM Tabl_Kontinent$
WHERE Kontinent = 'Северная Америка' OR Kontinent = 'Южная Америка';

--Задание 5. Вывести среднее население стран, кроме европейских. Результат округлить до
-- двух знаков.
SELECT ROUND(AVG(CAST(KolNas AS float)), 2) AS average_population
FROM Tabl_Kontinent$
WHERE Kontinent != 'Европа';
-- 6. Вывести количество стран, название которых начинается с буквы «С»
-- Используйте строковую функцию
-- LEFT(строка, число) возвращает с начала строки определенное количество символов
SELECT COUNT(*) AS country_count
FROM Tabl_Kontinent$
WHERE LEFT(Nazvanie, 1) = 'C';

--Задание 7. Вывести количество континентов, где есть страны
SELECT COUNT(DISTINCT Kontinent) AS count_continents
FROM Tabl_Kontinent$
WHERE KolNas IS NOT NULL;


-- Задание 8. Вывести разницу населения между странами с наибольшим и
-- наименьшим количеством граждан:
SELECT MAX(KolNas)-MIN(KolNas) as razn
FROM Tabl_Kontinent$
-- Задание 9. Вывести количество стран на каждом континенте. Результат отсортировать по
-- количеству стран по убыванию
SELECT
Kontinent, COUNT(Nazvanie) AS Kol_Stran 
FROM Tabl_Kontinent$
GROUP BY Kontinent
ORDER BY Kol_Stran  DESC

-- Задание 10. Вывести количество стран по первым буквам в названии. Результат
-- отсортировать в алфавитном порядке
SELECT
LEFT(Nazvanie, 1) AS PerV_BV, COUNT(Nazvanie) AS Kol_Stran
FROM Tabl_Kontinent$
GROUP BY
LEFT(Nazvanie,1) ORDER BY PerV_BV

--Задание 11. Вывести список континентов, где плотность населения больше, чем 100 чел.
-- на кв. км
SELECT
Kontinent, AVG(CAST(KolNas AS float)/ PL ) AS SR_PLOTN
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING AVG(CAST(KolNas AS FLOAT )/PL)>100

--Задание 12. Ожидается, что через 25 лет население Европы и Азии вырастет на 20%,
-- Северной Америки и Африки на 50%, а остальных частей мира – на 70%. Вывести список
-- континентов с прогнозируемым населением
-- Использовать числовую функцию: FLOOR(число) возвращает наибольшее целое число, меньшее
-- или равное заданного числа
SELECT Kontinent, CASE WHEN Kontinent IN ('Европа', 'Азия') THEN FLOOR(SUM(KolNas)*1.2)
WHEN Kontinent IN ('Северная Америка', 'Африка' ) THEN FLOOR(SUM(KolNas)*1.5)
ELSE  FLOOR(SUM(KolNas)*1.7)
END
AS SUM_NAS
FROM Tabl_Kontinent$
GROUP BY Kontinent


-- Задание 13. Вывести список континентов, где разница по населению между наибольшими и
-- наименьшими странами не более в 1000 раз
SELECT Kontinent
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING MAX(KolNas) <= 1000 * MIN(KolNas)


--Задание 14. Вывести количество стран, у которых нет столицы (не введена в базу)
SELECT
COUNT(*) AS KOLNAS
FROM Tabl_Kontinent$
WHERE Stolica IS NULL

--Задание 15. Вывести количество символов в самых длинных и коротких названиях стран и столиц
-- Использовать строковую функцию LEN(строка) возвращает количество символов в заданной
-- строке
SELECT
MAX(LEN(Nazvanie)) AS LONG_NAZ,
MAX(LEN(Stolica)) AS LONG_CAPITAL, 
MIN(LEN(Nazvanie)) AS SHORT_NAZ, 
MIN(LEN(Stolica)) AS SHORT_CAPITAL
FROM Tabl_Kontinent$

-- Задание 16. Вывести список континентов, у которых средняя плотность среди стран с площадью
-- более 1 млн. кв. км больше, чем 10 чел. на кв. км. Результат отсортировать по плотности по
-- убыванию.
SELECT Kontinent, AVG(CAST(KolNas AS FLOAT)/ PL) AS PLOTN
FROM Tabl_Kontinent$
WHERE PL>1000000
GROUP BY Kontinent 
HAVING AVG(CAST(KolNas AS FLOAT)/ PL) >10
ORDER BY PLOTN DESC

--Самостоятельная работа.

-- 17. Вывести минимальную площадь стран.
SELECT MIN(PL) AS MIN_PL
FROM Tabl_Kontinent$

--18. Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT MAX(KolNas)
FROM  Tabl_Kontinent$
WHERE (Kontinent = 'Южная Америка' AND Kontinent = 'Северная Америка')

--19. Вывести среднее население стран. Результат округлить до одного знака.
SELECT ROUND(AVG(CAST(KolNas AS float)), 1) AS average_population
FROM Tabl_Kontinent$

-- 20. Вывести количество стран, у которых название заканчивается на «ан», кроме стран,
-- у которых название заканчивается на «стан».
SELECT COUNT(*)
FROM Tabl_Kontinent$
WHERE Nazvanie LIKE '%ан' AND NOT Nazvanie LIKE '%стан'

-- 21. Вывести количество континентов, где есть страны, название которых начинается с
-- буквы «Р».
SELECT COUNT(*) AS continent_count
FROM Tabl_Kontinent$
WHERE LEFT(Kontinent, 1) = 'Р';
-- 22. Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей
-- площадью?
SELECT (MAX(PL) / MIN(PL)) as differrence
FROM Tabl_Kontinent$
WHERE PL>0
-- 23. Вывести количество стран с населением больше, чем 100 млн. чел. на каждом
-- континенте. Результат отсортировать по количеству стран по возрастанию.
SELECT Kontinent, COUNT(Nazvanie) as kol
FROM Tabl_Kontinent$
WHERE KolNas>100000000
GROUP BY Kontinent
ORDER BY [kol] ASC;
-- 24. Вывести количество стран по количеству букв в названии. Результат отсортировать
-- по убыванию.
SELECT LEN(Nazvanie) AS LETTERS, COUNT(*) AS kol
FROM Tabl_Kontinent$
GROUP BY LEN(Nazvanie)
ORDER BY LETTERS DESC 
-- 25. Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список
-- континентов с прогнозируемым населением:
SELECT
Kontinent,  FLOOR(SUM(KolNas)*1.1) 
AS SUM_NAS
FROM Tabl_Kontinent$
GROUP BY Kontinent
-- 26. Вывести список континентов, где разница по площади между наибольшими и
-- наименьшими странами не более в 10000 раз:
SELECT   Kontinent
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING MAX(PL) <= 1000*MIN(PL)
-- 27. Вывести среднюю длину названий Африканских стран.
SELECT AVG(LEN(Nazvanie))
FROM Tabl_Kontinent$
WHERE Kontinent = 'Африка'
-- 28. Вывести список континентов, у которых средняя плотность среди стран с
-- населением более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT Kontinent, AVG(CAST(KolNas AS FLOAT)/PL) AS plotn
FROM Tabl_Kontinent$
WHERE (KolNas > 1000000)
GROUP BY Kontinent
HAVING AVG(CAST(KolNas AS FLOAT)/PL) > 30



