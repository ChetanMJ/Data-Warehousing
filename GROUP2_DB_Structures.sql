USE [GROUP_02_DB]
GO
/****** Object:  Table [dbo].[Dim_Amenities]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Amenities](
	[Amenity_Key] [smallint] NOT NULL,
	[TV] [char](1) NOT NULL,
	[Internet] [char](1) NOT NULL,
	[WiFi] [char](1) NOT NULL,
	[Free_Parking] [char](1) NOT NULL,
	[Kitchen] [char](1) NOT NULL,
	[Ait_Conditioning] [char](1) NOT NULL,
 CONSTRAINT [PK_Dim_Amenities] PRIMARY KEY CLUSTERED 
(
	[Amenity_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_Key] [numeric](18, 0) NOT NULL,
	[Date] [date] NOT NULL,
	[Day_Of_Month] [smallint] NOT NULL,
	[Day_Of_Week] [smallint] NOT NULL,
	[Month] [smallint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Week_Of_Year] [smallint] NOT NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[Date_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Host]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Host](
	[Host_Key] [numeric](18, 0) NOT NULL,
	[Host_ID] [int] NOT NULL,
	[Host_Name] [varchar](50) NOT NULL,
	[Host_Location] [varchar](50) NULL,
	[Host_Neighbourhood] [varchar](50) NULL,
	[Host_url] [varchar](100) NULL,
	[Host_About] [varchar](200) NULL,
	[Host_Response_Rate] [varchar](10) NULL,
	[Host_Acceptance_Rate] [varchar](10) NULL,
	[Host_is_Superhost] [char](1) NOT NULL,
	[Host_Identity_Verified] [char](1) NOT NULL,
	[Host_Total_Listings_Count] [int] NOT NULL,
	[Active_Ind] [char](1) NOT NULL,
	[Eff_Start_Date] [date] NOT NULL,
	[Eff_End_Date] [date] NULL,
 CONSTRAINT [PK_Dim_Host] PRIMARY KEY CLUSTERED 
(
	[Host_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_List]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_List](
	[List_Key] [numeric](18, 0) NOT NULL,
	[List_ID] [numeric](18, 0) NOT NULL,
	[List_Name] [varchar](50) NULL,
	[Summary] [varchar](max) NULL,
	[Street] [varchar](50) NULL,
	[Square_Feet] [int] NULL,
	[Active_Ind] [char](1) NOT NULL,
	[Eff_Start_Date] [date] NOT NULL,
	[Eff_End_Date] [date] NULL,
 CONSTRAINT [PK_Dim_List] PRIMARY KEY CLUSTERED 
(
	[List_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Location](
	[Location_Key] [smallint] NOT NULL,
	[Neighbourhood_Group] [varchar](50) NULL,
	[Neighbourhood] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Location] PRIMARY KEY CLUSTERED 
(
	[Location_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Property_Type]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Property_Type](
	[Property_Type_Key] [smallint] NOT NULL,
	[Property_Type] [varchar](50) NOT NULL,
	[Room_Type] [varchar](50) NOT NULL,
	[Accomodates] [smallint] NOT NULL,
	[Bedrooms] [smallint] NOT NULL,
	[Bathrooms] [smallint] NOT NULL,
 CONSTRAINT [PK_Dim_Property_Type] PRIMARY KEY CLUSTERED 
(
	[Property_Type_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Review]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Review](
	[Review_Key] [numeric](18, 0) NOT NULL,
	[Ratings_Score] [smallint] NOT NULL,
	[Cleanliness_Score] [smallint] NOT NULL,
	[Checkin_Score] [smallint] NOT NULL,
	[Communication_Score] [smallint] NOT NULL,
	[Location_Score] [smallint] NOT NULL,
	[Value_Score] [smallint] NOT NULL,
 CONSTRAINT [PK_Dim_Review] PRIMARY KEY CLUSTERED 
(
	[Review_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Bookings]    Script Date: 9/25/2020 8:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Bookings](
	[List_Key] [numeric](18, 0) NOT NULL,
	[Host_Key] [numeric](18, 0) NOT NULL,
	[Date_Key] [numeric](18, 0) NOT NULL,
	[Property_Type_Key] [smallint] NOT NULL,
	[Amenity_Key] [smallint] NOT NULL,
	[Location_Key] [smallint] NOT NULL,
	[Number_Of_Days] [smallint] NOT NULL,
	[Total_Price] [float] NOT NULL,
	[Cleaning_Fee] [float] NOT NULL,
	[Security_Deposit] [float] NOT NULL,
	[Review_Key] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Fact_Bookings] PRIMARY KEY CLUSTERED 
(
	[List_Key] ASC,
	[Host_Key] ASC,
	[Date_Key] ASC,
	[Property_Type_Key] ASC,
	[Amenity_Key] ASC,
	[Location_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Amenities] FOREIGN KEY([Amenity_Key])
REFERENCES [dbo].[Dim_Amenities] ([Amenity_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Amenities]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Date] FOREIGN KEY([Date_Key])
REFERENCES [dbo].[Dim_Date] ([Date_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Host] FOREIGN KEY([Host_Key])
REFERENCES [dbo].[Dim_Host] ([Host_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Host]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_List] FOREIGN KEY([List_Key])
REFERENCES [dbo].[Dim_List] ([List_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_List]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Location] FOREIGN KEY([Location_Key])
REFERENCES [dbo].[Dim_Location] ([Location_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Property_Type] FOREIGN KEY([Property_Type_Key])
REFERENCES [dbo].[Dim_Property_Type] ([Property_Type_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Property_Type]
GO
ALTER TABLE [dbo].[Fact_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bookings_Dim_Review] FOREIGN KEY([Review_Key])
REFERENCES [dbo].[Dim_Review] ([Review_Key])
GO
ALTER TABLE [dbo].[Fact_Bookings] CHECK CONSTRAINT [FK_Fact_Bookings_Dim_Review]
GO
