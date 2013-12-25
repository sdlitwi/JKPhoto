USE [JKPhoto]
GO

/****** Object:  Table [dbo].[Album]    Script Date: 12/25/2013 11:02:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Album](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK__Album__3213E83F95934D58] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [DF_Album_deleted]  DEFAULT ((0)) FOR [deleted]
GO

