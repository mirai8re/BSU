USE LAB7

-- 1. Даны числа A и B. Найти и вывести их произведение.
DECLARE @A AS INT, @B INT, @C INT
SET @A = 2
SET @B = 3
SET @C = @A*@B PRINT @C

-- 2. В таблице «Ученики» найти разницу между средними баллами лицеистов и
-- гимназистов.
DECLARE @lyceum FLOAT, @gymnasium FLOAT, @difference FLOAT
SET @lyceum = (SELECT AVG(ball) FROM tableLAB7 WHERE ush='lyceum')
SET @gymnasium = (SELECT AVG(ball) FROM tableLAB7 WHERE ush='gymnasium')
SET @difference = ABS(@lyceum - @gymnasium) PRINT @difference
-- 3. В таблице «Ученики» проверить на четность количество строк.
DECLARE @number as INT
 SET @number = (SELECT COUNT(*) FROM tableLAB7)
 IF @number%2 = 0 
 PRINT CAST(@number AS VARCHAR(3)) + ' is even number'
 ELSE PRINT CAST(@number AS VARCHAR(3)) +' is odd number'
-- 4. Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @a4 INT = RAND()*10000, @D INT, @SUM INT,@A1  INT, @B1 INT, @C1 INT
PRINT (@a4)
SET @A1 = @a4/1000 
PRINT (@A1)
SET @B1 = @a4/100-@A1*10
PRINT (@b1)
SET @C1 = @a4/10-@A1*100-@B1*10
PRINT (@c1)
SET @D = @a4/1-@A1*1000-@B1*100-@C1*10
PRINT (@D)
SET @SUM= @A1+@B1+@C1+@D 
PRINT (@SUM)

-- 5. Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @am  INT = RAND()*100, @bm INT=RAND()*100, @cm INT=RAND()*100, @min INT
PRINT (@am)
PRINT (@bm)
PRINT (@cm)
IF @am<@bm AND @am<@cm
SET @min = @am
IF  @bm<@am AND @bm<@cm
SET @min = @am
ELSE 
SET @min = @cm
PRINT (@min)
-- 6. Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @A INT = RAND()*100
IF @A%11=0
PRINT CAST (@A AS VARCHAR(3)) + ' division by 11' 
ELSE PRINT CAST (@A AS VARCHAR(3)) + ' not divisible by 11' 
-- 7. Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то
-- вывести «Да», если не является – вывести «Нет».
DECLARE @N INT = RAND()*1000
PRINT(@N)
 WHILE @N%3=0
    SET @N = @N%3
 IF @N =1 
    PRINT 'YES'
ELSE PRINT 'NO'
-- 8. Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @A  INT = RAND()*1000, @B INT = RAND()*1000, @LCM INT, @N INT 
PRINT 'A: ' + CAST(@A AS VARCHAR(4))
PRINT 'B: ' + CAST(@B AS VARCHAR(4))
SET @N = @A*@B
WHILE @A!=@B
BEGIN 
    IF @A>@B 
        SET @A= @A-@B 
    ELSE SET @B= @B-@A
END
SET @LCM = @N/@A
PRINT 'LCM: ' + CAST(@LCM AS VARCHAR)

-- 9. Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до
-- B включительно.
DECLARE @A  INT = RAND()*10, @B INT = RAND()*10,  @SUM INT = 0
PRINT(@A)
PRINT(@B)
WHILE @A <= @B
BEGIN
    SET @SUM = @SUM + @A*@A
    SET @A = @A +1
END
PRINT 'SUM = ' + CAST(@SUM AS VARCHAR)

-- 10. Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1,
-- но делится на 7.
DECLARE @N INT = 7, @TRUE INT = 0
WHILE @TRUE =0
BEGIN
SET @N=@N+7
IF (@N%2=1) AND (@N%3=1) AND (@N%4=1) AND (@N%5=1) AND (@N%6=1) AND (@N%7=0) 
        SET @TRUE = 1       
END
PRINT (@N) 
-- 11. Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @N INT , @NAME CHAR(13) = 'Mironova'
SET @N = LEN(@NAME)
WHILE @N > 0 
    BEGIN
        PRINT @NAME
        SET @N = @N-1
    END

