Create database LAB11
USE LAB9
SELECT * 
FROM Tabl_Kontinents
-- Самостоятельная работа:
-- 1. Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
GO
CREATE VIEW D1
AS SELECT KolNas, PL, Nazvanie
FROM Tabl_Kontinents
WHERE KolNas>10000000 AND PL>500000 AND Nazvanie = N'Африка'
GO
SELECT KolNas, PL, Nazvanie
FROM D1
-- 2. Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте
-- его.
GO 
CREATE VIEW D2 
    (Kontinent, PL, KolNas)
AS 
SELECT Kontinent, AVG(PL), SUM(KolNas) / SUM(PL)
FROM Tabl_Kontinents
GROUP BY Kontinent;
GO
SELECT D2.Kontinent, D2.PL, D2.KolNas
FROM D2;
-- 3. Создайте представление, содержащее фамилии преподавателей, их
-- должность, звание, степень, место работы, количество их экзаменов, и используйте его.// колоичество экзаменов = оценка// посчитать год 
USE LAB8
GO
CREATE VIEW D3 (
    Surnname, JobTitle, Rank, Degree, PlaceOfWork, ExamsNumber
) 
AS SELECT
FIO, Dolgn, Zvanie, Stepen, NKaf, 
(SELECT COUNT(Kod) FROM Ozenka O WHERE O.Tab_Nom = P.TabNom_Pr)
FROM Sotrudnik C  INNER JOIN Prepodavatel P ON C.TablNom = P.TabNom_Pr
INNER JOIN Kafedra K ON C.SifKaf_Sotr = K.ShifrKaf
GO 
SELECT * FROM D3
-- 4. Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), заполните ее для текущего года, и используйте ее.

DECLARE @Month TABLE (
    MonthNumber INT,
    MonthName NVARCHAR(20),
    DaysInMonth INT
)
DECLARE @Year INT = YEAR(GETDATE()); -- получаем текущий год
INSERT INTO @Month (MonthNumber, MonthName, DaysInMonth)
VALUES 
    (1, N'Январь', 31),
    (2, N'Февраль', CASE WHEN (@Year % 4 = 0 AND @Year % 100 != 0) OR @Year % 400 = 0 THEN 29 ELSE 28 END),
    (3, N'Март', 31),
    (4, N'Апрель', 30),
    (5, N'Май', 31),
    (6, N'Июнь', 30),
    (7, N'Июль', 31),
    (8, N'Август', 31),
    (9, N'Сентябрь', 30),
    (10, N'Октябрь', 31),
    (11, N'Ноябрь', 30),
    (12, N'Декабрь', 31);
SELECT * FROM @Month
-- 5. Создайте табличную переменную, содержащую список стран, площадь которых в 100 раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
USE LAB9
DECLARE @Countries TABLE (
    CountryName NVARCHAR(50),
    CapitalName NVARCHAR(50),
    Area FLOAT,
    Population BIGINT,
    Continent NVARCHAR(50)
)
INSERT INTO @Countries 
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinents
WHERE CAST(PL AS real) * 100 < (SELECT AVG(PL) FROM Tabl_Kontinents )

SELECT* FROM @Countries 
-- 6. Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
USE LAB8
SELECT DATEPART(WEEK, data) AS [WEEK],
COUNT (DISTINCT Kod) AS [ExamsNumber],
COUNT (DISTINCT ReGNom) AS [StidentsNumber]
INTO #D6
FROM Ozenka
GROUP BY DATEPART(WEEK, data)
SELECT * FROM #D6
-- 7. Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте
-- ее.
USE LAB9
CREATE TABLE ##T7(
   ContinentsName NVARCHAR(50), 
   LargestArea FLOAT ,
   SmallestArea FLOAT
)
INSERT INTO 
##T7(ContinentsName, LargestArea, SmallestArea)
SELECT T.Kontinent, 
(SELECT MAX(Pl) FROM Tabl_Kontinents WHERE Kontinent = T.Kontinent),
(SELECT MIN(Pl) FROM Tabl_Kontinents WHERE Kontinent = T.Kontinent)
FROM Tabl_Kontinents T
SELECT * FROM ##T7

-- 8. С помощью обобщенных табличных выражений напишите запрос для вывода
-- списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и название факультета.
USE LAB8;
WITH CTE AS(SELECT F.ABfak AS FACULTY,
AVG(Zarplata) AS AverageSalary 
FROM Sotrudnik C  INNER JOIN Kafedra K ON C.SifKaf_Sotr = K.ShifrKaf
INNER JOIN Fakultet F ON K.AbFaK_Kaf = F.ABfak
GROUP BY F.ABfak
)
SELECT C.Fio, C.Zarplata, CTE.FACULTY, CTE.AverageSalary
FROM Sotrudnik C INNER JOIN Kafedra K ON C.SifKaf_Sotr = K.ShifrKaf
				 INNER JOIN CTE ON K.AbFaK_Kaf = CTE.FACULTY
WHERE C.Zarplata < CTE.AverageSalary

-- 9. Напишите команды для удаления всех созданных вами представлений.
SELECT *
FROM sys.views
WHERE name IN ('D1', 'D2', 'D3')
DROP VIEW D1, D2, D3
DROP VIEW IF EXISTS D1;
DROP VIEW IF EXISTS D2;
DROP VIEW IF EXISTS D3;
