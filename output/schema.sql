USE [master]
GO
/****** Object:  Database [user2]    Script Date: 03.10.2023 14:44:37 ******/
CREATE DATABASE [user2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'user2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user2_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [user2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user2] SET ARITHABORT OFF 
GO
ALTER DATABASE [user2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user2] SET  MULTI_USER 
GO
ALTER DATABASE [user2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user2] SET QUERY_STORE = OFF
GO
USE [user2]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activityEventId] [int] NOT NULL,
	[activityName] [nvarchar](256) NOT NULL,
	[activityDays] [int] NOT NULL,
	[activityTimeStart] [time](7) NOT NULL,
	[activityModeratorId] [int] NOT NULL,
	[activityJury1Id] [int] NULL,
	[activityJury2Id] [int] NULL,
	[activityJury3Id] [int] NULL,
	[activityJury4Id] [int] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[administratorEmail] [nvarchar](128) NOT NULL,
	[administratorBirthday] [datetime] NULL,
	[administratorCountryId] [int] NULL,
	[administratorPhone] [varchar](20) NOT NULL,
	[administratorPassword] [nvarchar](40) NOT NULL,
	[administratorPhoto] [nvarchar](128) NULL,
	[administratorGenderId] [int] NOT NULL,
	[administratorFIO] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Administ__3213E83FF044308D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [nvarchar](128) NOT NULL,
	[countryNameTranslit] [nvarchar](128) NULL,
	[countryCode] [nvarchar](128) NULL,
	[countryCode2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directions]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[directionName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Directions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventName] [nvarchar](200) NOT NULL,
	[eventDate] [date] NOT NULL,
	[eventDays] [int] NULL,
	[eventWinnerId] [int] NULL,
	[eventCountryId] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventDirection]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventDirection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventDirectionName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventDirection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[genderName] [nvarchar](20) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jury]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jury](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[juryFIO] [nvarchar](128) NOT NULL,
	[juryGenderId] [int] NOT NULL,
	[juryEmail] [nvarchar](80) NOT NULL,
	[juryBirthday] [date] NULL,
	[juryCountryId] [int] NULL,
	[juryPhone] [varchar](20) NOT NULL,
	[juryDirectionId] [int] NOT NULL,
	[juryPassword] [nvarchar](50) NOT NULL,
	[juryPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Jury] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memberFIO] [nvarchar](128) NOT NULL,
	[memberEmail] [nvarchar](80) NOT NULL,
	[memberBirthday] [date] NULL,
	[memberCountryId] [int] NULL,
	[memberPhone] [varchar](50) NOT NULL,
	[memberPhoto] [nvarchar](50) NULL,
	[memberGenderId] [int] NOT NULL,
	[memberPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moderator]    Script Date: 03.10.2023 14:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moderator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[moderatorFIO] [nvarchar](128) NOT NULL,
	[moderatorGenderId] [int] NOT NULL,
	[moderatorEmail] [nvarchar](128) NOT NULL,
	[moderatorBirthday] [date] NULL,
	[moderatorCountryId] [int] NULL,
	[moderatorPhone] [varchar](20) NOT NULL,
	[moderatorDirectionId] [int] NOT NULL,
	[moderatorEventDirectionId] [int] NOT NULL,
	[moderatorPassword] [nvarchar](50) NOT NULL,
	[moderatorPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Moderator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Event] FOREIGN KEY([activityEventId])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Event]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Jury] FOREIGN KEY([activityJury1Id])
REFERENCES [dbo].[Jury] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Jury]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Jury1] FOREIGN KEY([activityJury2Id])
REFERENCES [dbo].[Jury] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Jury1]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Jury2] FOREIGN KEY([activityJury3Id])
REFERENCES [dbo].[Jury] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Jury2]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Jury3] FOREIGN KEY([activityJury4Id])
REFERENCES [dbo].[Jury] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Jury3]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Moderator] FOREIGN KEY([activityModeratorId])
REFERENCES [dbo].[Moderator] ([id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Moderator]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Country] FOREIGN KEY([administratorCountryId])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Country]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Gender] FOREIGN KEY([administratorGenderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Gender]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Country] FOREIGN KEY([eventCountryId])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Country]
GO
ALTER TABLE [dbo].[Jury]  WITH CHECK ADD  CONSTRAINT [FK_Jury_Country] FOREIGN KEY([juryCountryId])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Jury] CHECK CONSTRAINT [FK_Jury_Country]
GO
ALTER TABLE [dbo].[Jury]  WITH CHECK ADD  CONSTRAINT [FK_Jury_Directions] FOREIGN KEY([juryDirectionId])
REFERENCES [dbo].[Directions] ([id])
GO
ALTER TABLE [dbo].[Jury] CHECK CONSTRAINT [FK_Jury_Directions]
GO
ALTER TABLE [dbo].[Jury]  WITH CHECK ADD  CONSTRAINT [FK_Jury_Gender] FOREIGN KEY([juryGenderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Jury] CHECK CONSTRAINT [FK_Jury_Gender]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Country] FOREIGN KEY([memberCountryId])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Country]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Gender] FOREIGN KEY([memberGenderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Gender]
GO
ALTER TABLE [dbo].[Moderator]  WITH CHECK ADD  CONSTRAINT [FK_Moderator_Country] FOREIGN KEY([moderatorCountryId])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Moderator] CHECK CONSTRAINT [FK_Moderator_Country]
GO
ALTER TABLE [dbo].[Moderator]  WITH CHECK ADD  CONSTRAINT [FK_Moderator_Directions] FOREIGN KEY([moderatorDirectionId])
REFERENCES [dbo].[Directions] ([id])
GO
ALTER TABLE [dbo].[Moderator] CHECK CONSTRAINT [FK_Moderator_Directions]
GO
ALTER TABLE [dbo].[Moderator]  WITH CHECK ADD  CONSTRAINT [FK_Moderator_EventDirection] FOREIGN KEY([moderatorEventDirectionId])
REFERENCES [dbo].[EventDirection] ([id])
GO
ALTER TABLE [dbo].[Moderator] CHECK CONSTRAINT [FK_Moderator_EventDirection]
GO
ALTER TABLE [dbo].[Moderator]  WITH CHECK ADD  CONSTRAINT [FK_Moderator_Gender] FOREIGN KEY([moderatorGenderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Moderator] CHECK CONSTRAINT [FK_Moderator_Gender]
GO
USE [master]
GO
ALTER DATABASE [user2] SET  READ_WRITE 
GO
