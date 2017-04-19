/*CREATE DATABASE COMP3065DM
GO
*/

USE [COMP3065DM]
GO

/****** Object:  Table [dbo].[SalesFact]    Script Date: 2017-04-17 3:09:20 PM ******/
DROP TABLE [dbo].[SalesFact]
GO

/****** Object:  Table [dbo].[SalesFact]    Script Date: 2017-04-17 3:09:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalesFact](
	[SalesAmount] [money] NULL,
	[SalesDate] [datetime] NOT NULL,
	[ProdcutSubcategoryID] [int] NULL,
	[ProductID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[CustomerID] [int] NULL,
	[TerritoryID] [int] NULL,
	[StoreID] [int] NULL,
	[OnlineOrderFlag] [bit] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimTerritory]    Script Date: 2017-04-17 3:10:25 PM ******/
DROP TABLE [dbo].[DimTerritory]
GO

/****** Object:  Table [dbo].[DimTerritory]    Script Date: 2017-04-17 3:10:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimTerritory](
	[TerritoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SalesYTD] [money] NULL,
	[SalesLastYear] [money] NULL,
 CONSTRAINT [PK_DimTerritory] PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

DROP TABLE [dbo].[DimStore]
GO

/****** Object:  Table [dbo].[DimStore]    Script Date: 2017-04-17 3:10:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimStore](
	[StoreID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SalesPersonID] [int] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimSalesPerson]    Script Date: 2017-04-17 3:11:25 PM ******/
DROP TABLE [dbo].[DimSalesPerson]
GO

/****** Object:  Table [dbo].[DimSalesPerson]    Script Date: 2017-04-17 3:11:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSalesPerson](
	[SalesPersonID] [int] NOT NULL,
	[TerritoryID] [int] NULL,
	[SalesYTD] [money] NULL,
	[SalesLastYear] [money] NULL,
	[Bonus] [money] NULL,
 CONSTRAINT [PK_DImSalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimProductSubCategory]    Script Date: 2017-04-17 3:12:20 PM ******/
DROP TABLE [dbo].[DimProductSubCategory]
GO

/****** Object:  Table [dbo].[DimProductSubCategory]    Script Date: 2017-04-17 3:12:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProductSubCategory](
	[ProductSubcategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 2017-04-17 3:12:41 PM ******/
DROP TABLE [dbo].[DimProduct]
GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 2017-04-17 3:12:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimPerson]    Script Date: 2017-04-17 3:13:05 PM ******/
DROP TABLE [dbo].[DimPerson]
GO

/****** Object:  Table [dbo].[DimPerson]    Script Date: 2017-04-17 3:13:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPerson](
	[PersonID] [int] NOT NULL,
	[PersonType] [nchar](2) NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimPerson] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 2017-04-17 3:13:24 PM ******/
DROP TABLE [dbo].[DimCustomer]
GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 2017-04-17 3:13:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO