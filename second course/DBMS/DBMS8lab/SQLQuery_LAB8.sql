CREATE DATABASE LAB8
USE LAB8
-- 1. Таблица факультет (Fakultet) ( поля: Аббревиатура, название факультета)
Create table Fakultet
(
ABfak nvarchar(10),
NFak nvarchar(30)
)
INsert into Fakultet
Values 
(N'ГН', N'Гуманитарные Науки'),
(N'ЕН', N'Естественные Науки'),
(N'ИТ', N'Информационные Технологии'),
(N'ФМ', N'Физико Математический')

-- 2. Таблица кафедра (Kafedra)
Create table Kafedra(
ShifrKaf nvarchar(10),
NKaf nvarchar(30),
AbFaK_Kaf nvarchar(10))
Insert into Kafedra 
Values 
(N'вм',N'Высшая Математика',N'ен'),
(N'ис',N'Информационные системы',N'ит'),
(N'мм',N'Математическое Моделиование',N'фм'),
(N'оф',N'Общая Физика',N'ен'),
(N'пм',N'Прикладная Математика',N'ит'),
(N'эф',N'Экспериментальная Физика',N'фм')

-- 3. Таблица Сотрудник (Sotrudnik) (поля: табельный номер, шифр, ФИО, должность,
-- зарплата, таб.номер руководителя)
Create table Sotrudnik(
TablNom int,
SifKaf_Sotr nvarchar(10),
FIO nvarchar(30),
Dolgn nvarchar(20),
Zarplata money,
TabNom_ruk int )
Insert into Sotrudnik 
Values
(101, N'пи', N'Прохоров', N'зав.кафедрой',N'3500.00', 101),
(102, N'пи', N'Семенов', N'преподаватель', N'2500.00', 101),
(105, N'пи', N'Петров', N'преподаватель', N'2500.00',101),
(153, N'пи', N'Сидорова', N'инженер', N'1500.00', 102),
(201, N'ис', N'Андееев', N'зав.кафедрой', N'3500.00',201),
(202, N'ис', N'Борисов', N'преподаватель', N'2500.00', 201 ),
(241, N'ис', N'Глухов', N'инженер', N'1500.00', 202),
(242, N'ис', N'Чернов', N'инженер', N'1500.00', 202),
(301, N'мм', N'Басов', N'зав.кафедрой', N'3500.00', 401),
(302, N'мм', N'Сергееева', N'преподаватель', N'2500.00', 301),
(401, N'оф', N'Волков', N'зав.кафедой', N'3500.00', 401),
(402, N'оф', N'Зайцев', N'преподаватель', N'2500.00', 401),
(403, N'оф', N'Смирнов', N'преподаватель', N'1500.00', 401),
(435, N'оф', N'Лисик', N'инженер', N'2000.00', 402),
(501, N'вм', N'Кузнецов', N'зав.кафедрой', N'3500.00', 501),
(502, N'вм', N'Романцев', N'преподаватель', N'2500.00', 501),
(503, N'вм', N'Соловьев', N'преподаватель', N'2500.00', 501),
(601, N'эф', N'Зверев', N'зав.кафедрой', N'3500.00', 601),
(602, N'эф', N'Сорокина', N'преподаватель', N'2500.00', 601),
(614, N'эф', N'Григорьев', N'инженер', N'2000.00', 602)

-- 4. Таблица Специальность (Spezialn) (поля: номер специальности, направление,
-- шифр)
Create table Spezialn(
NSpez varchar(10),
NaprSpez nvarchar(40),
Shifr_Spez nvarchar(10))
Insert into Spezialn
Values
(N'01.03.04', N'Прикладная Математика', N'мм'),
(N'09.03.02', N'Информационные системы и технологии', N'ис'),
(N'14.03.02', N'Ядерная физика и тенологии', N'иф'),
(N'38.03.05', N'Бизнес информатика', N'ис'),
(N'09.09.03', N'Прикладная информатика', N'пи')
-- 5. Таблица Предмет (Predmet) (поля: код, количество часов, предмет, исполнитель-
-- кафедра)
Create table Predmet(
kod_pred int,
Kol int,
Predmet nvarchar(20),
Ispolnitel_Kaf nvarchar(10))
Insert into Predmet
Values
(101,320, N'Математика', N'вм'),
(102,160, N'Информатика', N'пи'),
(103, 160, N'Физика' , N'оф'),
(202, 120, N'База данных' , N'ис'),
(204, 160, N'Электоника' , N'эф'),
(205, 80, N'Программирование' , N'пи'),
(209, 80, N'Моделирование' , N'мм')

-- 6. Таблица Заявка (Zakaz) (поля: номер заявки (специальности), код)
Create table Zakaz (
N_Z varchar(10),
Kod_Z int)
Insert into Zakaz
Values 
(N'01.03.04', 101),
(N'01.03.04', 205),
(N'01.03.04',209 ),
(N'09.03.02', 101),
(N'09.03.02', 102),
(N'09.03.02', 103),
(N'09.03.02', 202),
('09.03.02', 205),
(N'09.03.02', 209),
(N'09.03.02', 101),
(N'09.03.02', 102),
(N'09.03.02', 103),
(N'09.03.02', 205),
(N'09.03.02', 202),
(N'14.03.02', 101),
(N'14.03.02', 102),
(N'14.03.02', 103),
(N'14.03.02', 204),
(N'38.03.05', 101),
(N'38.03.05', 103),
(N'38.03.05', 202),
(N'38.03.05', 209)

-- 7. Таблица Зав.Кафедрой (ZavKaf) (поля таб.номер, стаж)
Create table ZavKaf(
TabNom_K int,
St_K int)
Insert into ZavKaf
Values 
(101, 15),
(201, 18),
(301, 20),
(401, 10),
(501, 18),
(601, 8)
-- 8. Таблица Инженер (Ingener) (поля: таб.номер, спецмальность)
Create table Ingener(
TabNom_IN int, 
Spez nvarchar(20))
Insert into Ingener
values
(154, N'электроник'),
(241, N'электроник'),
(242, N'программист'),
(435, N'электроник'),
(614, N'программист')
-- 9. Таблица Преподаватель (Prepodavatel) (поля: таб.номер, звание, степень)
create table Prepodavatel(
TabNom_Pr int, 
Zvanie nvarchar(20),
Stepen nvarchar(10) Null)
Insert into Prepodavatel
Values (101, N'профессор', N'д.т.н.'),
(102, N'доцент', N'к.ф.-м.н.'),
(105, N'доцент', N'к.т.н.'),
(201, N'профессор', N'д.ф.-м.н.'),
(202, N'доцент', N'к.ф.-м.н.'),
(301, N'профессор', N'д.т.н.'),
(302, N'доцент', N'к.т.н'),
(401, N'профессор', N'д.т.н.'),
(402, N'доцент', N'к.т.н.'),
(403, N'ассистент', Null),
(501, N'профессор', N'д.ф.-м.н.'),
(502, N'профессор', N'д.ф.-м.н.'),
(503, N'доцент', N'к.ф.-м.н.'),
(601, N'профессор', N'д.ф.-м.н.')
-- 10. Таблица Студент (Student) (поля: рег.номер, номер специализации, ФИО студента)
create table Student(
Reg_Nom int,
Nom_SpeZ_St varchar(10),
Fio_stud nvarchar(20))
Insert into Student
Values (10101,N'09.03.03',N'Николаева'),
(10102,N'09.03.03',N'Иванов'),
(10103,N'09.03.03',N'Крюков'),
(20101,N'09.03.02',N'Андреев'),
(20102,N'09.03.02',N'Федоров'),
(30101,N'14.03.02',N'Бондаренко'),
(30102,N'14.03.02',N'Цветков'),
(30103,N'14.03.02',N'Петров'),
(50101,N'01.03.04',N'Сергеев'),
(50102,N'01.03.04',N'Кудрявцев'),
(80101,N'38.03.05',N'Макаров'),
(80102,N'38.03.05',N'Яковлев')
-- 11. Экзамен (Ozenka) (поля: дата, код, рег.номер, таб.номер, аудитория, оценка)
Create table Ozenka(
data date,
Kod int, 
ReGNom int, 
Tab_Nom int,
Auditoria nvarchar(10),
Ozenk_a int)
Insert into Ozenka 
Values (N'2022-06-05',102 , 10101, 102, N'т505', 4),
(N'2022-06-05', 102, 10102,102 , N'т505', 4),
(N'2022-06-05', 202, 20101, 202, N'т506', 4),
(N'2022-06-05',202 , 20102,202 , N'т506', 3),
(N'2022-06-07',102 ,30101 ,105 , N'ф419',3 ),
(N'2022-06-07',102 , 30102, 101, N'т506',4 ),
(N'2022-06-07', 102, 80101, 1002, N'м425', 5),
(N'2022-06-09', 205, 80102, 402, N'м424',4 ),
(N'2022-06-09', 209, 20101, 302, N'ф333', 3),
(N'2022-06-10', 101,10102 ,501 , N'т506', 4),
(N'2022-06-10', 204, 30102, 601, N'ф349', 5 ),
(N'2022-06-10', 209, 80101, 301, N'э105', 5),
(N'2022-06-10', 209, 80102, 301, N'э105', 4),
(N'2022-06-12', 101, 80101, 502, N'с324', 4),
(N'2022-06-15', 101, 30101, 503, N'ф417', 4),
(N'2022-06-15', 101, 50101, 501, N'ф201', 5),
(N'2022-06-15', 101, 50102, 501, N'ф201', 3),
(N'2022-06-15', 103, 10101, 403, N'ф414', 4),
(N'2022-06-15', 102, 10101, 102, N'т505', 5)
-- Выполнить задания:
-- 1. Выбрать факультет и кафедры, используя неявное соединение. Результат
-- отсортировать по алфавиту
SELECT
F.NFak AS FAKULTET, k.NKaf AS KAFEDRA
FROM Kafedra K, Fakultet F
WHERE F.ABfak = K.AbFaK_Kaf
ORDER BY FAKULTET, KAFEDRA
-- 2. Выбрать факультет и кафедры, используя явное соединение. Результат
-- отсортировать по алфавиту
SELECT F.Nfak AS FAKULTET,
K.Nkaf AS KAFEDRA
FROM Fakultet F
INNER JOIN Kafedra K ON 
F.ABfak = K.AbFaK_Kaf
ORDER BY 
Fakultet, Kafedra 
-- 3. Выбрать все факультеты и их кафедры, если существуют. Результат
-- отсортировать по алфавиту
SELECT F.Nfak AS FAKULTET,
K.Nkaf AS KAFEDRA
FROM Fakultet F
LEFT OUTER JOIN Kafedra K ON 
F.ABfak = K.AbFaK_Kaf
ORDER BY 
Fakultet, Kafedra 
-- 4. Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о
-- студентах
SELECT S.Fio_stud,
P.NaprSpez,
K.NKaf AS Kafedra
FROM Student S INNER JOIN Spezialn P ON S.Nom_SpeZ_St = P.NSpez
INNER JOIN Kafedra K ON P.Shifr_Spez = K.ShifrKaf
-- 5. Вывести для каждого сотрудника фамилию, должность, зарплату и
-- фамилию его непосредственного руководителя
SELECT S.FIO,
S.Dolgn, S.Zarplata, P.FIO AS RUK
FROM Sotrudnik S INNER JOIN Sotrudnik P ON S.TablNom = P.TabNom_ruk
-- 6. Вывести список студентов, сдавших хотя бы один экзамен. По правилам
-- соединения, студенты, не сдававшие экзамены, в выборке представлены не
-- будут
SELECT S.Fio_stud
FROM Student S INNER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud
-- 7. Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии
-- студентов, а также количество сданных экзаменов и средний балл для
-- каждого студента
SELECT S.Fio_stud,
COUNT(O.Ozenk_a) AS [Number of exams],
AVG(O.Ozenk_a) AS [Average ball]
FROM Student S INNER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud
-- 8. Вывести список заведующих кафедрами и их зарплаты, и стаж работы
SELECT S.FIO,
S.Zarplata,
Z.St_K
FROM Sotrudnik S INNER JOIN ZavKaf Z ON S.TablNom = Z.TabNom_K
-- 9. Вывести список кандидатов и докторов физико-математических наук
SELECT S.FIO,
P.Stepen 
FROM Sotrudnik S INNER JOIN Prepodavatel P ON S.TablNom = P.TabNom_Pr
WHERE P.Stepen IN (N'к.ф-м.н.', N'д.ф.-м.н.')

-- 10. Вывести название дисциплины, фамилию, должность и степень
-- преподавателя, дату и место проведения экзаменов в хронологическом
-- порядке
SELECT DISTINCT
PR.Predmet AS DISCIPLINE,
S.FIO,
S.Dolgn,
P.Stepen,
O.data,
O.Auditoria
FROM Ozenka O INNER JOIN Predmet PR ON O.Kod = PR.kod_pred
		      INNER JOIN Sotrudnik S ON O.Tab_Nom = S.TablNom
			  INNER JOIN Prepodavatel P ON O.Tab_Nom = P.TabNom_Pr 
ORDER BY O.data
-- 11. Вывести фамилию преподавателей и количество их экзаменов
SELECT S.FIO,
COUNT(O.data) AS [COUNT OF EXAMS]
FROM Ozenka O INNER JOIN Sotrudnik S ON O.Tab_Nom = S.TablNom
GROUP BY S.FIO
-- 12. Вывести список студентов, не сдавших ни одного экзамена

SELECT S.Fio_stud
FROM Student S LEFT OUTER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
WHERE o.ReGNom IS NULL
-- II. Самостоятельная (домашняя) работа
-- 1. Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о
-- студентах, которые обучаются на данном факультете (например, «ит»).
SELECT S.Fio_stud,
P.NaprSpez,
K.NKaf AS Kafedra
FROM Student S INNER JOIN Spezialn P ON  S.Nom_SpeZ_St = P.NSpez
			   INNER JOIN Kafedra K ON K.ShifrKaf = P.Shifr_Spez
WHERE K.AbFaK_Kaf = N'ит'
-- 2. Вывести в запросе для каждого сотрудника номер и фамилию его
-- непосредственного руководителя. Для заведующих кафедрами поле руководителя
-- оставить пустым.
SELECT P.FIO,
P.TablNom,
(CASE WHEN S.Fio = P.FIO THEN NULL
	 ELSE S.FIO
	 END) AS RUK
FROM Sotrudnik S INNER JOIN Sotrudnik P ON P.TabNom_ruk = S.TablNom
-- 3. Вывести список студентов, сдавших минимум два экзамена.
SELECT S.Fio_stud,
COUNT(O.Ozenk_a) AS [Numder of exams]
FROM Student S INNER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud
HAVING COUNT(O.Ozenk_a) >= 2

-- 4. Вывести список инженеров с зарплатой, меньшей 2000 руб.
SELECT FIO,
Zarplata,
Dolgn
FROM Sotrudnik
WHERE Dolgn = N'инженер' AND Zarplata < 2000
-- 5. Вывести список студентов, сдавших экзамены в заданной аудитории.
SELECT DISTINCT S.Fio_stud,
O.Auditoria
FROM Student S INNER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
WHERE O.Auditoria = N'т506'
-- 6. Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии
-- студентов, а также количество сданных экзаменов и средний балл для каждого
-- студента только для тех студентов, у которых средний балл не меньше заданного
-- (например, 4).
SELECT S.Fio_stud,
COUNT(O.Ozenk_a) AS [Number of exams],
AVG(O.Ozenk_a) AS [Average grade]
FROM Student S INNER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud
HAVING AVG(O.Ozenk_a) >= 4
-- 7. Вывести список заведующих кафедрами и их зарплаты, и степень.
SELECT S.FIO,
S.Zarplata, P.Stepen
FROM Sotrudnik S INNER JOIN ZavKaf Z ON Z.TabNom_K = S.TablNom 
			     INNER JOIN Prepodavatel P ON Z.TabNom_K = P.TabNom_Pr

-- 8. Вывести список профессоров.

SELECT S.FIO, S.Dolgn, P.Zvanie
FROM Sotrudnik S INNER JOIN Prepodavatel P ON S.TablNom = P.TabNom_Pr
WHERE P.Zvanie = N'профессор'
-- 9. Вывести название дисциплины, фамилию, должность и степень
-- преподавателя, дату и место проведения экзаменов в хронологическом порядке в
-- заданном интервале даты.
SELECT DISTINCT
PR.Predmet AS PREDMET,
S.FIO,
S.Dolgn,
P.Stepen,
O.data,
O.Auditoria
FROM Ozenka O INNER JOIN Predmet PR ON O.Kod = PR.kod_pred
		      INNER JOIN Sotrudnik S ON O.Tab_Nom = S.TablNom
			  INNER JOIN Prepodavatel P ON O.Tab_Nom = P.TabNom_Pr 
WHERE O.data BETWEEN N'2022-06-05' AND N'2022-06-10'
ORDER BY O.data
-- 10. Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT S.Fio,
COUNT(O.Ozenk_a) AS [Number of exams]
FROM Sotrudnik S INNER JOIN Ozenka O ON S.TablNom = O.Tab_Nom
GROUP BY S.FIO
HAVING COUNT(O.Ozenk_a) >=3
-- 11. Вывести список студентов, не сдавших ни одного экзамена в указанной дате.

SELECT Student.Fio_stud
FROM Student
LEFT JOIN Ozenka ON Student.Reg_Nom = Ozenka.ReGNom AND Ozenka.data = '2022-06-05'
WHERE Ozenka.data IS NULL;

