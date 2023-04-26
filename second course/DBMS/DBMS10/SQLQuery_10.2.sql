

SELECT TOP (1000) [full name]
      ,[date]
      ,[speciality]
      ,[year of admission]
  FROM [Ucheb_7_Mironova].[dbo].[Student]



--   2. Самостоятельная работа
-- 1. Вывести список студентов, отсортированный по количеству символов в
-- ФИО.
USE Ucheb_7_Mironova
SELECT [full name], LEN([full name]) AS Characters
FROM Student
ORDER BY Characters 
-- 2. Вывести список студентов, убрать лишние пробелы в ФИО.
SELECT TRIM([full name]) AS WITHOUT_SPACE, 
[date], speciality,  [year of admission]
FROM Student
-- 3. Найти позиции «ов» в ФИО каждого студентов. Вывести ФИО и номер
-- позиции.
SELECT [full name], CHARINDEX(N'ов', [full name]) AS POSITION
FROM Student
-- 4. Вывести ФИО и последние две буквы специализации для каждого
-- студента.
SELECT [full name], RIGHT(speciality, 2) AS LAST2CHAR
FROM Student
-- 5. Вывести список студентов, ФИО в формате Фамилия и Инициалы.
USE Ucheb_7_Mironova
SELECT [full name], SUBSTRING([full name], 0, CHARINDEX(' ', [full name])) + ' ' +
(SELECT (LEFT(SUBSTRING([full name] , CHARINDEX(' ', [full name]) + 1, LEN([full name])), 1))) + '.'
 + (SELECT (LEFT(SUBSTRING([full name], (CHARINDEX(' ', [full name]) + 1) + 
 (CHARINDEX(' ', SUBSTRING([full name] , CHARINDEX(' ', [full name]) + 1, LEN([full name])) )), LEN([full name])), 1))) + '.'
AS names
FROM Student
-- 6. Вывести список специализаций в правильном и обратном виде. Убрать
-- дубликаты.
SELECT DISTINCT [speciality], REVERSE(speciality) AS REVERSE
FROM Student
-- 7. Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPLICATE('MIRONOVA ', 20)
-- 8. Вывести абсолютное значение функций с точностью
-- два знака после десятичной запятой.
SELECT ROUND(ABS(SQUARE(SIN(PI()/2))-COS(3*PI()/2)), 2) 
-- 9. Вывести количество дней до конца семестра.
SELECT DATEDIFF(DAY, GETDATE(), '2023-06-01')

-- 10. Вывести количество месяцев от вашего рождения
SELECT DATEDIFF(MONTH,'2002-07-27', GETDATE())
-- 12. Вывести список специализаций без повторений. Для каждой
-- специализации вывести «длинный» или «короткий», в зависимости от
-- количества символов.
SELECT DISTINCT speciality,
    CASE WHEN LEN(speciality) > 6 THEN 'LONG'
    ELSE 'SHORT'
    END
FROM Student