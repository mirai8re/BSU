--3. оператор AS
SELECT
FirstName + ' '  + LastName AS FullName
FROM DimCustomer
--4. Выборка с добавлением
SELECT
FirstName + ' '  + LastName AS FullName
INTO DimFullName
FROM DimCustomer
SELECT* FROM DimFullName
--5.1 Отсортируйте таблицу  по столбцу 
SELECT*
FROM DimFullName
ORDER BY FullName
--6. сортировки также можно использовать сложно выражение на основе столбцов
SELECT FirstName, LastName, Title, BaseRate, VacationHours, SickLeaveHours
FROM DimEmployee
ORDER BY BaseRate*VacationHours*SickLeaveHours
