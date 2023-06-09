USE [master]
GO
/****** Object:  Database [OldCarShowroomNetwork]    Script Date: 6/12/2023 10:25:40 AM ******/
CREATE DATABASE [OldCarShowroomNetwork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OldCarShowroomNetwork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THE2UANG\MSSQL\DATA\OldCarShowroomNetwork.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OldCarShowroomNetwork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THE2UANG\MSSQL\DATA\OldCarShowroomNetwork_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OldCarShowroomNetwork] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OldCarShowroomNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OldCarShowroomNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OldCarShowroomNetwork] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OldCarShowroomNetwork] SET QUERY_STORE = ON
GO
ALTER DATABASE [OldCarShowroomNetwork] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OldCarShowroomNetwork]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Username] [varchar](128) NOT NULL,
	[CarID] [int] NOT NULL,
	[PickupHour] [datetime] NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[ShowroomID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[CarID] ASC,
	[PickupHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModelYears]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModelYears](
	[CarModelYearID] [int] IDENTITY(1,1) NOT NULL,
	[CarModelYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarModelYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarNames]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarNames](
	[CarNameID] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](50) NULL,
	[ManufactoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[Manufactory] [int] NULL,
	[CarName] [int] NULL,
	[Version] [nvarchar](150) NULL,
	[CarModelYear] [int] NULL,
	[Origin] [bit] NULL,
	[NumberOfKilometersTraveled] [int] NULL,
	[Vehicles] [int] NULL,
	[Price] [bigint] NULL,
	[Color] [int] NULL,
	[ColorInside] [int] NULL,
	[NumberOfDoors] [tinyint] NULL,
	[NumberOfSeats] [tinyint] NULL,
	[Gear] [bit] NULL,
	[Drive] [int] NULL,
	[Fuel] [int] NULL,
	[Notification] [bit] NULL,
	[Note] [nvarchar](2000) NULL,
	[FuelIntakeSystem] [nvarchar](1000) NULL,
	[FuelConsumption] [int] NULL,
	[Description] [nvarchar](1000) NULL,
	[Username] [varchar](128) NULL,
	[Status] [bit] NULL,
	[ShowroomID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[administrative_unit_id] [int] NULL,
	[administrative_region_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[district_id] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[city_id] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drives]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drives](
	[DriveID] [int] IDENTITY(1,1) NOT NULL,
	[DriveName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DriveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuels]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuels](
	[FuelID] [int] IDENTITY(1,1) NOT NULL,
	[FuelName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FuelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageCars]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageCars](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](1000) NULL,
	[ImageMain] [bit] NULL,
	[CarID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageShowrooms]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageShowrooms](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](1000) NULL,
	[ImgMain] [bit] NULL,
	[ShowroomID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactorys]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactorys](
	[ManufactoryID] [int] IDENTITY(1,1) NOT NULL,
	[ManufactoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufactoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showrooms]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showrooms](
	[ShowroomID] [int] IDENTITY(1,1) NOT NULL,
	[ShowroomName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](20) NOT NULL,
	[Website] [varchar](1000) NULL,
	[CityID] [nvarchar](20) NULL,
	[DistrictID] [nvarchar](20) NULL,
	[Wards] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowroomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](128) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehiclesID] [int] IDENTITY(1,1) NOT NULL,
	[VehiclesName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehiclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ward]    Script Date: 6/12/2023 10:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ward](
	[ward_id] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[district_id] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [CreationDateTime]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ShowroomID])
REFERENCES [dbo].[Showrooms] ([ShowroomID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[CarNames]  WITH CHECK ADD FOREIGN KEY([ManufactoryID])
REFERENCES [dbo].[Manufactorys] ([ManufactoryID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([CarModelYear])
REFERENCES [dbo].[CarModelYears] ([CarModelYearID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([CarName])
REFERENCES [dbo].[CarNames] ([CarNameID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Color])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([ColorInside])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Drive])
REFERENCES [dbo].[Drives] ([DriveID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Fuel])
REFERENCES [dbo].[Fuels] ([FuelID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Manufactory])
REFERENCES [dbo].[Manufactorys] ([ManufactoryID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([Vehicles])
REFERENCES [dbo].[Vehicles] ([VehiclesID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Showrooms] FOREIGN KEY([ShowroomID])
REFERENCES [dbo].[Showrooms] ([ShowroomID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Showrooms]
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD  CONSTRAINT [FK_DISTRICT_RE_CITY] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [FK_DISTRICT_RE_CITY]
GO
ALTER TABLE [dbo].[ImageCars]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[ImageShowrooms]  WITH CHECK ADD FOREIGN KEY([ShowroomID])
REFERENCES [dbo].[Showrooms] ([ShowroomID])
GO
ALTER TABLE [dbo].[Showrooms]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[Showrooms]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[district] ([district_id])
GO
ALTER TABLE [dbo].[Showrooms]  WITH CHECK ADD FOREIGN KEY([Wards])
REFERENCES [dbo].[ward] ([ward_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[ward]  WITH CHECK ADD  CONSTRAINT [FK_WARD_RE_DISTRICT] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([district_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ward] CHECK CONSTRAINT [FK_WARD_RE_DISTRICT]
GO
USE [master]
GO
ALTER DATABASE [OldCarShowroomNetwork] SET  READ_WRITE 
GO
