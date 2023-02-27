USE master;
GO

IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'Ucheb_7_Mironova'
    )
    CREATE DATABASE [Ucheb_7_Mironova];
GO

IF SERVERPROPERTY('ProductVersion') > '12'
   ALTER DATABASE [Ucheb_7_Mironova] SET QUERY_STORE = ON;
GO

