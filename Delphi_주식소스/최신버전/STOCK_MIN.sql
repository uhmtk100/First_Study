USE [STOCK_INFO]
GO

/****** Object:  Table [dbo].[STOCK_MIN]    Script Date: 2019-01-20 ¿ÀÈÄ 11:45:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STOCK_MIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CCODE] [nvarchar](6) NULL,
	[DDATE] [nvarchar](8) NULL,
	[ALLTIME] [nvarchar](12) NULL,
	[STARTPRICE] [int] NULL,
	[HIGHPRICE] [int] NULL,
	[LOWPRICE] [int] NULL,
	[ENDPRICE] [int] NULL,
	[GURAE] [int] NULL,
	[SOSOK] [int] NULL,
	[UPDOWNPRICE] [int] NULL
) ON [PRIMARY]

GO


