USE [master]
GO
/****** Object:  Database [MatchMakingProject]    Script Date: 6/22/2023 12:33:19 AM ******/
CREATE DATABASE [MatchMakingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MatchMakingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MatchMakingProject.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MatchMakingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MatchMakingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MatchMakingProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MatchMakingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MatchMakingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MatchMakingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MatchMakingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MatchMakingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MatchMakingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [MatchMakingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MatchMakingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MatchMakingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MatchMakingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MatchMakingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MatchMakingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MatchMakingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MatchMakingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MatchMakingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MatchMakingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MatchMakingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MatchMakingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MatchMakingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MatchMakingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MatchMakingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MatchMakingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MatchMakingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MatchMakingProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MatchMakingProject] SET  MULTI_USER 
GO
ALTER DATABASE [MatchMakingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MatchMakingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MatchMakingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MatchMakingProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MatchMakingProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MatchMakingProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MatchMakingProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [MatchMakingProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MatchMakingProject]
GO
/****** Object:  UserDefinedFunction [dbo].[CheckUserLogin]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CheckUserLogin] (@username VARCHAR(100), @password VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @user_id INT;
    
    SELECT @user_id = user_id
    FROM dbo.UserLogin
    WHERE username = @username AND password = @password;
    
    RETURN @user_id;
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetCityId]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCityId] (@cityName VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @cityId INT;
    
    SELECT @cityId = city_id
    FROM City
    WHERE city_name = @cityName;
    
    RETURN @cityId;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetCountryId]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCountryId] (@countryName VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @countryId INT;
    
    SELECT @countryId = country_id
    FROM Country
    WHERE country_name = @countryName;
    
    RETURN @countryId;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetReligionId]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetReligionId] (@religionName VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @religionId INT;
    
    SELECT @religionId = religion_id
    FROM Religion
    WHERE religion_name = @religionName;
    
    RETURN @religionId;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetSectId]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetSectId] (@sectName VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @sectId INT;
    
    SELECT @sectId = s_id
    FROM Sect
    WHERE sect_name = @sectName;
    
    RETURN @sectId;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetStateId]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetStateId] (@stateName VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @stateId INT;
    
    SELECT @stateId = state_id
    FROM State
    WHERE state_name = @stateName;
    
    RETURN @stateId;
END;
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/22/2023 12:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](100) NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](100) NULL,
	[country_id] [int] NULL,
	[state_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[age] [int] NOT NULL,
	[gender] [char](1) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_Phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[loc_id] [int] IDENTITY(1,1) NOT NULL,
	[country_id] [int] NULL,
	[city_id] [int] NULL,
	[state_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[loc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_LocationView]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LocationView] AS
SELECT l.loc_id, c.country_name, s.state_name, ci.city_name, u.user_id
FROM Location l
JOIN Country c ON l.country_id = c.country_id
JOIN State s ON l.state_id = s.state_id
JOIN City ci ON l.city_id = ci.city_id
JOIN [User] u ON l.user_id = u.user_id;

GO
/****** Object:  Table [dbo].[User_Photos]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Photos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[photo] [varbinary](max) NOT NULL,
	[Upload] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[User_Photos_View]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_Photos_View]
AS
SELECT user_id, photo
FROM dbo.User_Photos;
GO
/****** Object:  Table [dbo].[User_Profession]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Profession](
	[profession_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[job_title] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[occupation] [varchar](50) NOT NULL,
	[organization] [varchar](50) NOT NULL,
	[start_date] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[profession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_UserProfessionView]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserProfessionView] AS
SELECT up.profession_id, up.user_id, up.job_title, up.description, up.occupation, up.organization, up.start_date
FROM [dbo].[User_Profession] up;
GO
/****** Object:  Table [dbo].[Match_req]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match_req](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[sender_id] [int] NOT NULL,
	[received_on] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MatchRequestView]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MatchRequestView]
AS
SELECT *
FROM match_req;
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[user_id] [int] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_UserLogin_Username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[userlogin_count_view]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[userlogin_count_view] AS
SELECT COUNT(*) AS login_count FROM userlogin;
GO
/****** Object:  View [dbo].[vw_countries]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_countries] AS
SELECT country_name
FROM country;
GO
/****** Object:  Table [dbo].[religion]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[religion](
	[religion_id] [int] NOT NULL,
	[religion_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[religion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Religion]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Religion] AS
SELECT religion_name
FROM [religion];
GO
/****** Object:  View [dbo].[vw_State]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_State] AS
SELECT s.state_name, c.country_name
FROM State s
JOIN Country c ON s.country_id = c.country_id;
GO
/****** Object:  View [dbo].[vw_City]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_City] AS
SELECT s.state_name, c.city_name
FROM City c
JOIN State s ON s.state_id = c.state_id;
GO
/****** Object:  Table [dbo].[Sect]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sect](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[sect_name] [varchar](100) NULL,
	[religion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_sect]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_sect]
as
select s.sect_name, r.religion_name
from sect s
join religion r on r.religion_id = s.religion_id;
GO
/****** Object:  View [dbo].[vw_UserView]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserView] AS
SELECT user_id, name, email, phone, age, gender
FROM [User];
GO
/****** Object:  Table [dbo].[user_religion]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_religion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[religion_id] [int] NOT NULL,
	[sect_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_UserReligionView]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserReligionView] AS
SELECT u.user_id, u.name, r.religion_name, s.sect_name
FROM [User] u
JOIN user_religion ur ON u.user_id = ur.user_id
JOIN religion r ON ur.religion_id = r.religion_id
JOIN Sect s ON ur.sect_id = s.s_id;

GO
/****** Object:  Table [dbo].[Education]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[eduid] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[level] [varchar](100) NOT NULL,
	[major] [varchar](100) NOT NULL,
	[institution] [varchar](100) NOT NULL,
	[graduationyear] [int] NOT NULL,
	[details] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[eduid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobbies]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobbies](
	[hobbiesid] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[hobbyname] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[hobbiesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interests]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interests](
	[prefid] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[smoking] [varchar](100) NULL,
	[drinking] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[prefid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchFailed]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchFailed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id1] [int] NULL,
	[user_id2] [int] NULL,
	[failure_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partner_preferences]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partner_preferences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[min_age] [int] NOT NULL,
	[max_age] [int] NOT NULL,
	[min_height] [decimal](3, 2) NOT NULL,
	[max_height] [decimal](3, 2) NOT NULL,
	[religion_id] [int] NOT NULL,
	[sect_id] [int] NOT NULL,
	[preferred_language] [varchar](255) NOT NULL,
	[education_level] [varchar](50) NOT NULL,
	[occupation] [varchar](50) NOT NULL,
	[income_range] [decimal](10, 2) NOT NULL,
	[smoking_status] [varchar](50) NOT NULL,
	[drinking_status] [varchar](50) NOT NULL,
	[desired_family_type] [varchar](50) NOT NULL,
	[desired_marital_status] [varchar](50) NOT NULL,
	[desired_children] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileMatch]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileMatch](
	[match_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id1] [int] NULL,
	[user_id2] [int] NULL,
	[match_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionType]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionType](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[price] [decimal](10, 2) NULL,
	[description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[wallet_id] [int] NOT NULL,
	[payment_amount] [decimal](10, 2) NOT NULL,
	[payment_details] [varchar](100) NULL,
	[transaction_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_physical_attributes]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_physical_attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[height] [decimal](2, 1) NULL,
	[weight] [decimal](5, 2) NULL,
	[eye_color] [varchar](50) NULL,
	[hair_color] [varchar](50) NULL,
	[complexion] [varchar](50) NULL,
	[blood_group] [varchar](3) NULL,
	[body_type] [varchar](50) NULL,
	[disability] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Subscription]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Subscription](
	[subid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
	[status] [varchar](100) NULL,
	[subtype] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Wallet]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Wallet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_at] [datetime] NULL,
	[card_number] [varchar](50) NULL,
	[card_holder_name] [varchar](50) NULL,
	[card_expiry_date] [varchar](10) NULL,
	[card_cvv] [varchar](3) NULL,
	[bank_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Match_req] ADD  DEFAULT (getdate()) FOR [received_on]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([state_id])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[Education]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Hobbies]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Interests]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([state_id])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [fk_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [fk_user_id]
GO
ALTER TABLE [dbo].[Match_req]  WITH CHECK ADD  CONSTRAINT [fk_notifications_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Match_req] CHECK CONSTRAINT [fk_notifications_users]
GO
ALTER TABLE [dbo].[Match_req]  WITH CHECK ADD  CONSTRAINT [fk_notifications_users_2] FOREIGN KEY([sender_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Match_req] CHECK CONSTRAINT [fk_notifications_users_2]
GO
ALTER TABLE [dbo].[MatchFailed]  WITH CHECK ADD FOREIGN KEY([user_id1])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[MatchFailed]  WITH CHECK ADD FOREIGN KEY([user_id2])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[partner_preferences]  WITH CHECK ADD FOREIGN KEY([religion_id])
REFERENCES [dbo].[religion] ([religion_id])
GO
ALTER TABLE [dbo].[partner_preferences]  WITH CHECK ADD FOREIGN KEY([sect_id])
REFERENCES [dbo].[Sect] ([s_id])
GO
ALTER TABLE [dbo].[partner_preferences]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[ProfileMatch]  WITH CHECK ADD FOREIGN KEY([user_id1])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[ProfileMatch]  WITH CHECK ADD FOREIGN KEY([user_id2])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Sect]  WITH CHECK ADD FOREIGN KEY([religion_id])
REFERENCES [dbo].[religion] ([religion_id])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Wallet] FOREIGN KEY([wallet_id])
REFERENCES [dbo].[User_Wallet] ([id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Wallet]
GO
ALTER TABLE [dbo].[User_Photos]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_physical_attributes]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Profession]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[user_religion]  WITH CHECK ADD FOREIGN KEY([religion_id])
REFERENCES [dbo].[religion] ([religion_id])
GO
ALTER TABLE [dbo].[user_religion]  WITH CHECK ADD FOREIGN KEY([sect_id])
REFERENCES [dbo].[Sect] ([s_id])
GO
ALTER TABLE [dbo].[User_Subscription]  WITH CHECK ADD FOREIGN KEY([subtype])
REFERENCES [dbo].[SubscriptionType] ([typeid])
GO
ALTER TABLE [dbo].[User_Subscription]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Wallet]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [CHK_Phone] CHECK  ((len(CONVERT([varchar](11),[phone]))=(11)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [CHK_Phone]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMatchRequest]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMatchRequest]
    @id INT,
    @sender_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Match_req]
    WHERE [user_id] = @id AND [sender_id] = @sender_id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMatchFailed]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMatchFailed]
    @user_id1 INT,
    @user_id2 INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[MatchFailed] ([user_id1], [user_id2], [failure_date])
    VALUES (@user_id1, @user_id2, GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[InsertMatchRequest]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMatchRequest]
    @userId INT,
    @senderId INT
AS
BEGIN
    INSERT INTO Match_req (user_id, sender_id)
    VALUES (@userId, @senderId);
    
    PRINT 'Match request inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProfileMatch]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProfileMatch]
    @user_id1 INT,
    @user_id2 INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[ProfileMatch] ([user_id1], [user_id2], [match_date])
    VALUES (@user_id1, @user_id2, GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUserLogin]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserLogin]
    @username VARCHAR(100),
    @password VARCHAR(100),
    @user_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the values into the UserLogin table
    INSERT INTO [dbo].[UserLogin] ([username], [password])
    VALUES (@username, @password);

    -- Get the generated user_id
    SET @user_id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEducation]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEducation]
    @userId INT,
    @level VARCHAR(100),
    @major VARCHAR(100),
    @institution VARCHAR(100),
    @graduationYear INT,
    @details VARCHAR(MAX)
AS
BEGIN
    INSERT INTO [Education] (user_id, [level], major, institution, graduationyear, [Details])
    VALUES (@userId, @level, @major, @institution, @graduationYear, @details);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPartnerPreferences]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPartnerPreferences]
    @user_id INT,
    @min_age INT,
    @max_age INT,
    @min_height DECIMAL(3, 2),
    @max_height DECIMAL(3, 2),
    @religion_name VARCHAR(20),
    @sect_name VARCHAR(20),
    @preferred_language VARCHAR(255),
    @education_level VARCHAR(50),
    @occupation VARCHAR(50),
    @income_range DECIMAL(10, 2),
    @smoking_status VARCHAR(50),
    @drinking_status VARCHAR(50),
    @desired_family_type VARCHAR(50),
    @desired_marital_status VARCHAR(50),
    @desired_children VARCHAR(50)
AS
BEGIN

    DECLARE @religion_id INT;
    DECLARE @sect_id INT;

    SELECT @religion_id = dbo.GetReligionId(@religion_name);

    -- Retrieve sect_id
    SELECT @sect_id = dbo.GetSectId(@sect_name);

    INSERT INTO partner_preferences (
        user_id,
        min_age,
        max_age,
        min_height,
        max_height,
        religion_id,
        sect_id,
        preferred_language,
        education_level,
        occupation,
        income_range,
        smoking_status,
        drinking_status,
        desired_family_type,
        desired_marital_status,
        desired_children
    )
    VALUES (
        @user_id,
        @min_age,
        @max_age,
        @min_height,
        @max_height,
        @religion_id,
        @sect_id,
        @preferred_language,
        @education_level,
        @occupation,
        @income_range,
        @smoking_status,
        @drinking_status,
        @desired_family_type,
        @desired_marital_status,
        @desired_children
    );
END;


GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTransaction]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTransaction]
    @user_id INT,
    @wallet_id INT,
    @payment_amount DECIMAL(10, 2),
    @payment_details VARCHAR(100),
    @transaction_date DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @transaction_id INT;

        -- Insert the transaction record
        INSERT INTO [dbo].[Transaction] ([user_id], [wallet_id], [payment_amount], [payment_details], [transaction_date])
        VALUES (@user_id, @wallet_id, @payment_amount, @payment_details, @transaction_date);

        -- Get the generated transaction ID
        SET @transaction_id = SCOPE_IDENTITY();

        -- Perform additional operations related to the transaction if needed

        -- Commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Error occurred, rollback the transaction
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUser]
    @name VARCHAR(100),
    @email VARCHAR(100),
    @phone VARCHAR(20),
    @age INT,
    @gender CHAR(1),
    @countryName VARCHAR(100),
    @stateName VARCHAR(100),
    @cityName VARCHAR(100),
    @religionName VARCHAR(50),
    @sectName VARCHAR(100),
    @photo VARBINARY(MAX),
    @userId INT OUTPUT
AS
BEGIN
    DECLARE @countryId INT;
    DECLARE @stateId INT;
    DECLARE @cityId INT;
    DECLARE @religionId INT;
    DECLARE @sectId INT;

    -- Retrieve country_id
    SELECT @countryId = [dbo].GetCountryId(@countryName);

    -- Retrieve state_id
    SELECT @stateId = dbo.GetStateId(@stateName);

    -- Retrieve city_id
    SELECT @cityId = dbo.GetCityId(@cityName);

    -- Retrieve religion_id
    SELECT @religionId = dbo.GetReligionId(@religionName);

    -- Retrieve sect_id
    SELECT @sectId = dbo.GetSectId(@sectName);

    -- Insert into User table
    INSERT INTO [User] (name, email, phone, age, gender)
    VALUES (@name, @email, @phone, @age, @gender);

    -- Get the newly inserted user_id
    SET @userId = SCOPE_IDENTITY();

    -- Insert into Location table
    INSERT INTO Location (user_id, country_id, state_id, city_id)
    VALUES (@userId, @countryId, @stateId, @cityId);

    -- Insert into user_religion table
    INSERT INTO user_religion (user_id, religion_id, sect_id)
    VALUES (@userId, @religionId, @sectId);

    -- Insert into User_Photos table
    INSERT INTO User_Photos (user_id, photo, Upload)
    VALUES (@userId, @photo, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUserLogin]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUserLogin]
    @userId INT,
    @username VARCHAR(100),
    @password VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO UserLogin (user_id, username, password)
    VALUES (@userId, @username, @password);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUserProfession]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUserProfession]
    @user_id INT,
    @job_title VARCHAR(100),
    @start_date VARCHAR(20),
    @description VARCHAR(MAX),
    @occupation VARCHAR(50),
    @organization VARCHAR(50)
AS
BEGIN
    INSERT INTO [User_Profession] (user_id, job_title, start_date, description, occupation, organization)
    VALUES (@user_id, @job_title, @start_date, @description, @occupation, @organization);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUserWallet]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUserWallet]
    @user_id INT,
    @card_number VARCHAR(50),
    @card_holder_name VARCHAR(50),
    @card_expiry_date VARCHAR(10),
    @card_cvv VARCHAR(3),
    @bank_name VARCHAR(50)
AS
BEGIN
    INSERT INTO [dbo].[User_Wallet] ([user_id], [created_at], [card_number], [card_holder_name], [card_expiry_date], [card_cvv], [bank_name])
    VALUES (@user_id, GETDATE(), @card_number, @card_holder_name, @card_expiry_date, @card_cvv, @bank_name);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_user_login]    Script Date: 6/22/2023 12:33:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure
CREATE PROCEDURE [dbo].[sp_user_login]
    @username VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
   

    INSERT INTO userlogin (username, password)
    VALUES (@username, @password);

    
END;
GO
USE [master]
GO
ALTER DATABASE [MatchMakingProject] SET  READ_WRITE 
GO
