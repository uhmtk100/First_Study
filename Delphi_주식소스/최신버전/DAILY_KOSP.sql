USE [STOCK_INFO]
GO

/****** Object:  Table [dbo].[DAILY_KOSP]    Script Date: 2019-01-20 ¿ÀÈÄ 11:44:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DAILY_KOSP](
	[DID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [varchar](10) NOT NULL,
	[DDATE] [varchar](8) NOT NULL,
	[STARTPRICE] [numeric](18, 0) NULL,
	[HIGHPRICE] [numeric](18, 0) NULL,
	[LOWPRICE] [numeric](18, 0) NULL,
	[ENDPRICE] [numeric](18, 0) NULL,
	[GURAE] [numeric](18, 0) NULL,
	[Day5] [numeric](18, 0) NULL,
	[DAY10] [numeric](18, 0) NULL,
	[DAY20] [numeric](18, 0) NULL,
	[DAY60] [numeric](18, 0) NULL,
	[DAY120] [numeric](18, 0) NULL,
	[DAY240] [numeric](18, 0) NULL,
	[STOK5] [numeric](18, 0) NULL,
	[STOK3] [numeric](18, 0) NULL,
	[STOD3] [numeric](18, 0) NULL,
	[STOK20] [numeric](18, 0) NULL,
	[STOK12] [numeric](18, 0) NULL,
	[STOD12] [numeric](18, 0) NULL,
	[AVGDAY5] [numeric](18, 0) NULL,
	[AVGDAY10] [numeric](18, 0) NULL,
	[SMAX] [numeric](18, 0) NULL,
	[SMIN] [numeric](18, 0) NULL,
	[VSTDEV] [numeric](18, 2) NULL,
	[PREV20DAY5] [numeric](18, 0) NULL,
	[DAY20UP] [numeric](18, 0) NULL,
	[DAYGAP] [numeric](18, 0) NULL,
	[DAY10SUM] [numeric](18, 0) NULL,
	[DAY10COUNT] [numeric](18, 0) NULL,
	[GURAESTDEV] [numeric](18, 0) NULL,
	[DAY20SUM] [numeric](18, 0) NULL,
	[DAY20COUNT] [numeric](18, 1) NULL,
	[DAY60SUM] [numeric](18, 0) NULL,
	[DAY60COUNT] [numeric](18, 0) NULL,
	[DAY40SUM] [numeric](18, 0) NULL,
	[DAY40COUNT] [numeric](18, 0) NULL,
	[MAX240] [numeric](18, 0) NULL,
	[MIN240] [numeric](18, 0) NULL,
	[GURAE20] [numeric](18, 0) NULL,
	[GURAE40] [numeric](18, 0) NULL,
	[PREUPDOWN1] [numeric](18, 2) NULL,
	[PREUPDOWN2] [numeric](18, 2) NULL,
	[SOSOK] [int] NULL,
	[GOLD] [int] NULL,
	[GURAEWEIGHT] [numeric](18, 0) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


