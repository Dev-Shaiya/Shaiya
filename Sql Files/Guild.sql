USE [PS_GameData]
GO
/****** Creation Guild Fixed by sandolkakos: Shaiya-UGO Server - www.universalgamesonline.com.br  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guilds](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[GuildName] [varchar](30) COLLATE Chinese_PRC_Stroke_CI_AS NOT NULL,
	[MasterUserID] [varchar](18) COLLATE Chinese_PRC_Stroke_CI_AS NOT NULL,
	[MasterCharID] [int] NOT NULL,
	[MasterName] [varchar](30) COLLATE Chinese_PRC_Stroke_CI_AS NOT NULL,
	[Country] [tinyint] NOT NULL,
	[TotalCount] [smallint] NOT NULL,
	[GuildPoint] [int] NOT NULL,
	[Del] [tinyint] NOT NULL CONSTRAINT [DF_Guilds_Del]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_Guilds] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF