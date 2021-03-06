USE [Hotel]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 30/05/2013 23:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Postcode] [nvarchar](20) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Wired] [bit] NOT NULL,
	[Wireless] [bit] NOT NULL,
	[LastRatingDate] [datetime] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 30/05/2013 23:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[DownloadMbps] [decimal](8, 1) NOT NULL,
	[UploadMbps] [decimal](8, 1) NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([Id], [Name], [Address], [City], [Postcode], [Country], [Wired], [Wireless], [LastRatingDate]) VALUES (1, N'Premier Inn', N'12 Something', N'Slough', N'SL1 1SL', N'UK', 0, 1, CAST(0x0000A1CD0115ADF0 AS DateTime))
INSERT [dbo].[Hotel] ([Id], [Name], [Address], [City], [Postcode], [Country], [Wired], [Wireless], [LastRatingDate]) VALUES (2, N'The Ritz', N'Piccadilly', N'London', N'W1', N'UK', 1, 1, NULL)
INSERT [dbo].[Hotel] ([Id], [Name], [Address], [City], [Postcode], [Country], [Wired], [Wireless], [LastRatingDate]) VALUES (3, N'Claridges', N'Regents Park', N'London', N'W2', N'UK', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [HotelId], [Quality], [DownloadMbps], [UploadMbps], [Date]) VALUES (1, 1, 1, CAST(0.1 AS Decimal(8, 1)), CAST(0.0 AS Decimal(8, 1)), CAST(0x07000000000028370B0000 AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Rating] OFF
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Hotel]
GO
