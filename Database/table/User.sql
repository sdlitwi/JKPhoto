USE [DB_65430_dbphotojk]
GO

ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_isAdmin]
GO

ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_deleted]
GO

ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_datecreated]
GO

/****** Object:  Table [dbo].[User]    Script Date: 8/23/2014 2:40:09 PM ******/
DROP TABLE [dbo].[User]
GO

/****** Object:  Table [dbo].[User]    Script Date: 8/23/2014 2:40:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](500) NOT NULL,
	[datecreated] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_datecreated]  DEFAULT (getdate()) FOR [datecreated]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_deleted]  DEFAULT ((0)) FOR [deleted]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isAdmin]  DEFAULT ((0)) FOR [role]
GO

