USE [DB_65430_dbphotojk]
GO

ALTER TABLE [dbo].[UserAlbum] DROP CONSTRAINT [FK_UserAlbum_User]
GO

ALTER TABLE [dbo].[UserAlbum] DROP CONSTRAINT [FK_UserAlbum_Album]
GO

/****** Object:  Table [dbo].[UserAlbum]    Script Date: 8/23/2014 2:40:55 PM ******/
DROP TABLE [dbo].[UserAlbum]
GO

/****** Object:  Table [dbo].[UserAlbum]    Script Date: 8/23/2014 2:40:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserAlbum](
	[userId] [int] NOT NULL,
	[albumId] [int] NOT NULL,
 CONSTRAINT [PK_UserAlbum] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[albumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserAlbum]  WITH CHECK ADD  CONSTRAINT [FK_UserAlbum_Album] FOREIGN KEY([albumId])
REFERENCES [dbo].[Album] ([id])
GO

ALTER TABLE [dbo].[UserAlbum] CHECK CONSTRAINT [FK_UserAlbum_Album]
GO

ALTER TABLE [dbo].[UserAlbum]  WITH CHECK ADD  CONSTRAINT [FK_UserAlbum_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO

ALTER TABLE [dbo].[UserAlbum] CHECK CONSTRAINT [FK_UserAlbum_User]
GO

