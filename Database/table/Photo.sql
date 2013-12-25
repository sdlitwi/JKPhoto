USE [JKPhoto]
GO

/****** Object:  Table [dbo].[Photo]    Script Date: 12/25/2013 11:02:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[albumID] [int] NOT NULL,
	[fileName] [nvarchar](50) NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF_Photo_width]  DEFAULT ((0)) FOR [width]
GO

ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF_Photo_height]  DEFAULT ((0)) FOR [height]
GO

ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF_Photo_deleted]  DEFAULT ((0)) FOR [deleted]
GO

ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Album] FOREIGN KEY([albumID])
REFERENCES [dbo].[Album] ([id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Album]
GO

