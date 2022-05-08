USE [PS_GameData]
GO

/****** Object:  Table [dbo].[Guilds]    Script Date: 09.12.2014 02:01:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Guilds](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[GuildName] [varchar](30) NOT NULL,
	[MasterUserID] [varchar](12) NOT NULL,
	[MasterCharID] [int] NOT NULL,
	[MasterName] [varchar](30) NOT NULL,
	[Country] [tinyint] NOT NULL,
	[TotalCount] [smallint] NOT NULL,
	[GuildPoint] [int] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_Guilds] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Guilds] ADD  CONSTRAINT [DF_Guilds_Del]  DEFAULT ((0)) FOR [Del]
GO