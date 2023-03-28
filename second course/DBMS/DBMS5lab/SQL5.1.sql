-- task1 
CREATE DATABASE Test 
ON(
    NAME = Test_data,
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/test.mdf',
    SIZE = 10 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5 MB)
LOG ON (
    NAME = 'Test_log',
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/test.ldf',
    SIZE = 5 MB,
    MAXSIZE = 100 MB,
    FILEGROWTH = 5%)


    -- task2
CREATE DATABASE Test1 
ON(
    NAME = Test1_data,
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/test1.mdf')
LOG ON (
    NAME = 'Test1_log',
    FILENAME = '/Users/anna/Desktop/BSU/second course/DBMS/test1.ldf')


-- task 3
    USE master
    CREATE DATABASE Ucheb_4;

-- task 4
    DROP DATABASE Ucheb_4; 

-- task 4
    USE master
    CREATE DATABASE Ucheb_4;
    EXEC sp_detach_db Ucheb_4;

-- task 5
CREATE DATABASE Ucheb_0
ON PRIMARY(FILENAME = '/var/opt/mssql/data/Ucheb_4.mdf')
FOR attach;

-- task 6
USE master
EXEC sp_helpdb Ucheb_7_Mironova

-- task 7 
use master
EXEC sp_renamedb Ucheb_0 , Ucheb_5;

--task 8
ALTER DATABASE Test MODIFY Name = TestDB

