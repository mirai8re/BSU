CREATE TABLE [dbo].[Products] (
    [ID]           INT           NULL,
    [ProductName]  NVARCHAR (30) NOT NULL,
    [Manufacturer] NVARCHAR (20) NOT NULL,
    [ProductCount] INT           NOT NULL,
    [Price]        MONEY         NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductName] ASC, [ProductCount] ASC)
);


GO

