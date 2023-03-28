-- task1 
USE TestDB;
IF OBJECT_ID('dbo.client_alt','U') is not NULL
DROP TABLE dbo.client_alt;
CREATE TABLE Client__alt(
    ID INT PRIMARY KEY,
    Age INT,
    NName NVARCHAR(20),
    FIO NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
    );


-- task 2
USE TestDB;
ALTER TABLE Client__alt
ADD Address NVARCHAR(50) NOT NULL DEFAULT 'no';

-- task 3(drop a column from the table)
USE TestDB;
ALTER TABLE Client__alt
DROP COLUMN Address;

-- task 4(drop a column from the table)
USE TestDB;
ALTER TABLE Client__alt
DROP COLUMN Phone;

-- task 5 add a new column to the table

ALTER TABLE dbo.Client__alt
    ADD Phone VARCHAR(20) NOT NULL;

-- task 6 (changing the type of a column )
USE TestDB
ALTER TABLE dbo.Client__alt
ALTER COLUMN NName NVARCHAR(200);

-- task 7.1 (adding the constrait CHECK)

USE TestDB
ALTER TABLE dbo.Client__alt WITH NOCHECK
    ADD CHECK (Age > 21)



-- task 7.2 (adding the FK)
USE TestDB
IF OBJECT_ID('dbo.client_alt', 'U') is not NULL
DROP TABLE dbo.Client__alt;
CREATE TABLE Client_alt(
    ID INT PRIMARY KEY IDENTITY,
    Age INT NOT NULL, 
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(20),
    Phone VARCHAR(20)
);
IF OBJECT_ID('dbo.Order', 'U') IS NOT NULL
DROP table dbo.OrderMy;
CREATE TABLE Order__my(
    ID INT IDENTITY,
    ClientID INT,
    CreatedA date
);
-- adding the contrait FK of Client to Order
ALTER TABLE Order__my
add FOREIGN KEY (ClientID) REFERENCES Client_alt(ID);
-- adding PK for the column ID
ALTER TABLE Order__my
add PRIMARY KEY(ID)

-- task 7.3 (removing the FK constrait)
USE TestDB
ALTER TABLE Order__my
DROP PK__Order__m__3214EC27C3FB069


-- task 7.4
USE TestDB
-- adding PK  with the nameconstrain
ALTER TABLE dbo.Order__my
ADD CONSTRAINT PK_MOrder_ID PRIMARY KEY(ID);
ALTER TABLE dbo.Order__my
ADD CONSTRAINT FK_MOrder_To_Client_alt
FOREIGN KEY (ClientID) REFERENCES Client__alt(ID);
-- adding the constrain
ALTER TABLE dbo.client_alt
add CONSTRAINT CK_Client_alt_age2 CHECK (age>0);


--task 7.5
USE TestDB
EXEC sp_help Order__my

-- task 8 
use TestDB
EXEC sp_rename 'Client_alt', 'Client'