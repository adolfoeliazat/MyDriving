/****** Object:  Table [dbo].[dimUser]    Script Date: 3/21/2016 8:40:49 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimUser](
	[userId] [nvarchar](100) NOT NULL,
	[vin] [nvarchar](20) NOT NULL,
	[driverType] [nvarchar](10) NULL,
 CONSTRAINT [PK_dimUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[vin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[dimUserTemp]    Script Date: 3/21/2016 8:40:49 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimUserTemp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimUserTemp](
	[userId] [nvarchar](100) NOT NULL,
	[vin] [nvarchar](20) NULL
)
END

/****** Object:  Table [dbo].[dimVinLookup]    Script Date: 3/21/2016 8:40:50 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimVinLookup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimVinLookup](
	[vinNum] [nvarchar](20) NOT NULL,
	[make] [nvarchar](200) NULL,
	[model] [nvarchar](200) NULL,
	[carYear] [int] NULL,
	[carType] [nvarchar](200) NULL,
 CONSTRAINT [PK_dimVinLookup] PRIMARY KEY CLUSTERED 
(
	[vinNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'"NO DATA', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'2HKRM4H39DH614569', N'Honda', N'Honda', 2013, N'SUV')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'3N1CE2CP8E0000000', N'Nissan', N'Unknown', 2014, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'5NPE24AF6GH261799', N'Unknown', N'Unknown', 2016, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'5TDZK22CX90000000', N'Toyota', N'Unknown', 2009, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'ERROR', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'JHLRM4H70CC002017', N'Honda', N'Honda', 2012, N'SUV')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'JN1DV6AP7B0000000', N'Nissan', N'Unknown', 2011, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'JN8AS5MV2B0000000', N'Nissan', N'Unknown', 2011, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'KM8SRDHF3F0000000', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'SIMULATORANDROID1', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'SIMULATORIPHONE12', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'SIMULATORWINPHONE', N'Unknown', N'Unknown', 2028, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'Unknown', N'Unknown', N'Unknown', 1995, N'Unknown')
INSERT INTO [dbo].[dimVinLookup] ([vinNum], [make], [model], [carYear], [carType]) VALUES (N'WBA3B9G59E0000000', N'BMW', N'Unknown', 2014, N'Unknown')
END

/****** Object:  Table [dbo].[factMLOutputData]    Script Date: 3/21/2016 8:40:50 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factMLOutputData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factMLOutputData](
	[tripId] [nvarchar](200) NOT NULL,
	[userId] [nvarchar](100) NOT NULL,
	[tripstarttime] [datetime] NOT NULL,
	[driverType] [nvarchar](10) NOT NULL
)
END

/****** Object:  Table [dbo].[factTripData]    Script Date: 3/21/2016 8:40:50 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factTripData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factTripData](
	[TripId] [nvarchar](200) NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[vin] [nvarchar](20) NULL,
	[tripStartTime] [datetime] NULL,
	[driverType] [nvarchar](10) NULL,
	[AverageSpeed] [float] NULL,
	[Hard_Accel] [int] NULL,
	[Hard_Brakes] [int] NULL,
	[DroveWithMILOn] [bit] NULL,
	[LengthOfTrip] [int] NULL,
	[cLatitude] [float] NULL,
	[cLongitude] [float] NULL,
 CONSTRAINT [PK_factTripData] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[factTripDataTemp]    Script Date: 3/21/2016 8:40:50 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factTripDataTemp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factTripDataTemp](
	[TripId] [nvarchar](200) NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[vin] [nvarchar](20) NULL,
	[tripStartTime] [nvarchar](50) NULL,
	[AverageSpeed] [float] NULL,
	[Hard_Accel] [int] NULL,
	[Hard_Brakes] [int] NULL,
	[DroveWithMILOn] [bit] NULL,
	[LengthOfTrip] [int] NULL,
	[cLat] [float] NULL,
	[cLon] [float] NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dimUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[dimUser]'))
ALTER TABLE [dbo].[dimUser]  WITH CHECK ADD  CONSTRAINT [FK_dimUser] FOREIGN KEY([vin])
REFERENCES [dbo].[dimVinLookup] ([vinNum])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dimUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[dimUser]'))
ALTER TABLE [dbo].[dimUser] CHECK CONSTRAINT [FK_dimUser]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_facTripData]') AND parent_object_id = OBJECT_ID(N'[dbo].[factTripData]'))
ALTER TABLE [dbo].[factTripData]  WITH CHECK ADD  CONSTRAINT [FK_facTripData] FOREIGN KEY([UserId], [vin])
REFERENCES [dbo].[dimUser] ([userId], [vin])
ON DELETE CASCADE

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_facTripData]') AND parent_object_id = OBJECT_ID(N'[dbo].[factTripData]'))
ALTER TABLE [dbo].[factTripData] CHECK CONSTRAINT [FK_facTripData]
