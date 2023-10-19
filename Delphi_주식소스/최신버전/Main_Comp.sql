USE [STOCK_INFO]
GO

/****** Object:  Table [dbo].[Main_Comp]    Script Date: 2019-01-20 ¿ÀÈÄ 11:45:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Main_Comp](
	[sID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [nvarchar](10) NULL,
	[company] [nvarchar](50) NULL,
	[curPrice] [numeric](18, 0) NULL,
	[prePrice] [float] NULL,
	[upDown] [float] NULL,
	[orgPrice] [numeric](18, 0) NULL,
	[TotalStock] [numeric](18, 0) NULL,
	[DealAmount] [numeric](18, 0) NULL,
	[SaleAmount] [numeric](18, 0) NULL,
	[DebtTotal] [numeric](18, 0) NULL,
	[SalesProfit] [numeric](18, 0) NULL,
	[StockProfit] [numeric](18, 0) NULL,
	[ForeignRate] [float] NULL,
	[PER] [numeric](18, 2) NULL,
	[ROE] [numeric](18, 2) NULL,
	[ROA] [numeric](18, 2) NULL,
	[PBR] [numeric](18, 2) NULL,
	[RESERVE_RATIO] [numeric](18, 2) NULL,
	[sosok] [int] NULL,
	[Up_Date] [date] NULL,
	[PSR] [float] NULL,
	[DEBTRATIO] [float] NULL
) ON [PRIMARY]

GO


