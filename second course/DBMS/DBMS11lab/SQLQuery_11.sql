Create database LAB11
USE LAB9
SELECT * 
FROM Tabl_Kontinents
-- Самостоятельная работа:
-- 1. Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
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
-- USE LAB8
-- GO
-- CREATE VIEW D3 (
--     Surnname, JobTitle, Rank, Degree, PlaceOfWork, ExamsNumber
-- ) AS SELECT
-- FROM Sotrudnik S
-- INNER JOIN Prepodavatel P ON S.TablNom = P.TabNom_Pr
-- INNER JOIN 
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
    Area FLOAT
)
INSERT INTO @Countries 
SELECT Nazvanie
FROM Tabl_Kontinents
-- 6. Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
-- 7. Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте
-- ее.
-- 8. С помощью обобщенных табличных выражений напишите запрос для вывода
-- списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и название факультета.
-- 9. Напишите команды для удаления всех созданных вами представлений.