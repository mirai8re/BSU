--task 2.1
USE master
CREATE DATABASE TestBD1
use TestBD1
CREATE TABLE Client(
    ID int,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)

-- task 2.3
USE TestBD1
CREATE TABLE Client_PR_K1(
    ID INT PRIMARY KEY,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)

USE TestBD1
CREATE TABLE Client_PR_K_T(
    ID int,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    PRIMARY KEY(ID)
)

USE TestBD1
CREATE TABLE Order_L(
    Order_my INT,
    Product INT,
    Amount INT,
    Price Money,
    PRIMARY KEY(Order_my, Product)

)

-- task 2.4
use TestBD1
CREATE TABLE Client_PK_K_ID(
    ID int PRIMARY KEY IDENTITY,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)

-- task 2.5
USE TestBD1
CREATE TABLE Client_PR_K_ID_UN(
    ID int PRIMARY KEY IDENTITY,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30) UNIQUE ,
    Phone VARCHAR(20) UNIQUE
)


USE TestBD1
CREATE TABLE Client_PR_K_ID_UN1(
    ID int PRIMARY KEY IDENTITY,
    Age int,
    NName NVARCHAR(20),
    Fio NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone) 
)
-- task 2.7
USE TestBD1
CREATE TABLE Client_PR_K_ID_UN_DEF(
    ID int PRIMARY KEY IDENTITY,
    Age int default 18,
    NName NVARCHAR(20) NOT NULL,
    Fio NVARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone) )

    CREATE TABLE Client_PR_K_ID_UN_DEF_CHECK(
    ID int PRIMARY KEY IDENTITY,
    Age int default 18 CHECK(Age>0 and Age<100),
    NName NVARCHAR(20) NOT NULL,
    Fio NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) CHECK (Email!=''),
    Phone VARCHAR(20) CHECK (Phone!=''),
    UNIQUE(Email, Phone) )
    
-- task 2.8
    USE TestBD1
    CREATE TABLE Client_org(
        ID INT CONSTRAINT PK_Client_ID PRIMARY KEY IDENTITY,
        Age INT
        CONSTRAINT DF_Client_Age DEFAULT 18
        CONSTRAINT CK_Client_Age CHECK (Age>0 and Age<100),
        NName NVARCHAR(20) NOT NULL,
        Fio NVARCHAR(20) NOT NULL,
        Email VARCHAR(30) CONSTRAINT UQ_Client_Email UNIQUE,
        Phone VARCHAR(20) CONSTRAINT UQ_Client_Phone UNIQUE
    )

    USE TestBD1
    CREATE TABLE Client_org1(
        ID INT  IDENTITY,
        Age INT CONSTRAINT DF_Client_Age1 default 18,
        NName NVARCHAR(20) NOT NULL,
        Fio NVARCHAR(20) NOT NULL,
        Email VARCHAR(30),
        Phone VARCHAR(20),
        CONSTRAINT CK_Client_Age1 CHECK (Age>0 and Age<100),
        CONSTRAINT PK_Client_ID1 PRIMARY KEY(ID),
        CONSTRAINT UQ_Client_Email1 UNIQUE(Email),
        CONSTRAINT UQ_Client_Phone1 UNIQUE(Phone)
    )

-- task 2.9 

USE TestBD1
CREATE TABLE Client_FK_K(
    ID INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18,
    NName NVARCHAR(20) NOT NULL,
    Fio NVARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone)
)
USE TestBD1
CREATE TABLE Order_FK_K(
    ID INT PRIMARY KEY IDENTITY,
    CLientID INT REFERENCES Client_FK_K(ID),
    CreatedA DATE
)