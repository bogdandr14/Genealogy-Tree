USE [GenealogyTree]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Position_PositionId]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_People_PersonId]
GO
ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_Requests_Users_SenderId]
GO
ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_Requests_Users_ReceiverId]
GO
ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_Requests_People_ReceiverReferenceInSenderTreeId]
GO
ALTER TABLE [dbo].[Relatives] DROP CONSTRAINT [FK_Relatives_Users_RelativeUserId]
GO
ALTER TABLE [dbo].[Relatives] DROP CONSTRAINT [FK_Relatives_Users_PrimaryUserId]
GO
ALTER TABLE [dbo].[Relatives] DROP CONSTRAINT [FK_Relatives_People_RelativePersonInPrimaryTreeId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Trees_TreeId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Religions_ReligionId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Nationalities_NationalityId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Locations_LivingPlaceId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Locations_BirthPlaceId]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_People_Images_ImageId]
GO
ALTER TABLE [dbo].[ParentsChildren] DROP CONSTRAINT [FK_ParentsChildren_People_ParentId]
GO
ALTER TABLE [dbo].[ParentsChildren] DROP CONSTRAINT [FK_ParentsChildren_People_ChildId]
GO
ALTER TABLE [dbo].[Occupations] DROP CONSTRAINT [FK_Occupations_Users_UserId]
GO
ALTER TABLE [dbo].[Marriages] DROP CONSTRAINT [FK_Marriages_People_SecondPersonId]
GO
ALTER TABLE [dbo].[Marriages] DROP CONSTRAINT [FK_Marriages_People_FirstPersonId]
GO
ALTER TABLE [dbo].[Educations] DROP CONSTRAINT [FK_Educations_Users_UserId]
GO
ALTER TABLE [dbo].[Educations] DROP CONSTRAINT [FK_Educations_EducationLevels_EducationLevelId]
GO
ALTER TABLE [dbo].[Relatives] DROP CONSTRAINT [DF__Relatives__LastS__74AE54BC]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [DF__People__Gender__6754599E]
GO
ALTER TABLE [dbo].[ParentsChildren] DROP CONSTRAINT [DF__ParentsCh__Creat__75A278F5]
GO
ALTER TABLE [dbo].[Marriages] DROP CONSTRAINT [DF__Marriages__Creat__76969D2E]
GO
/****** Object:  Index [IX_Users_PositionId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Users_PositionId] ON [dbo].[Users]
GO
/****** Object:  Index [IX_Users_PersonId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Users_PersonId] ON [dbo].[Users]
GO
/****** Object:  Index [IX_Requests_SenderId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Requests_SenderId] ON [dbo].[Requests]
GO
/****** Object:  Index [IX_Requests_ReceiverReferenceInSenderTreeId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Requests_ReceiverReferenceInSenderTreeId] ON [dbo].[Requests]
GO
/****** Object:  Index [IX_Requests_ReceiverId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Requests_ReceiverId] ON [dbo].[Requests]
GO
/****** Object:  Index [IX_Relatives_RelativeUserId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Relatives_RelativeUserId] ON [dbo].[Relatives]
GO
/****** Object:  Index [IX_Relatives_RelativePersonInPrimaryTreeId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Relatives_RelativePersonInPrimaryTreeId] ON [dbo].[Relatives]
GO
/****** Object:  Index [IX_Relatives_PrimaryUserId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Relatives_PrimaryUserId] ON [dbo].[Relatives]
GO
/****** Object:  Index [IX_People_TreeId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_TreeId] ON [dbo].[People]
GO
/****** Object:  Index [IX_People_ReligionId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_ReligionId] ON [dbo].[People]
GO
/****** Object:  Index [IX_People_NationalityId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_NationalityId] ON [dbo].[People]
GO
/****** Object:  Index [IX_People_LivingPlaceId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_LivingPlaceId] ON [dbo].[People]
GO
/****** Object:  Index [IX_People_ImageId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_ImageId] ON [dbo].[People]
GO
/****** Object:  Index [IX_People_BirthPlaceId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_People_BirthPlaceId] ON [dbo].[People]
GO
/****** Object:  Index [IX_ParentsChildren_ParentId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_ParentsChildren_ParentId] ON [dbo].[ParentsChildren]
GO
/****** Object:  Index [IX_ParentsChildren_ChildId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_ParentsChildren_ChildId] ON [dbo].[ParentsChildren]
GO
/****** Object:  Index [IX_Occupations_UserId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Occupations_UserId] ON [dbo].[Occupations]
GO
/****** Object:  Index [IX_Marriages_SecondPersonId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Marriages_SecondPersonId] ON [dbo].[Marriages]
GO
/****** Object:  Index [IX_Marriages_FirstPersonId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Marriages_FirstPersonId] ON [dbo].[Marriages]
GO
/****** Object:  Index [IX_Educations_UserId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Educations_UserId] ON [dbo].[Educations]
GO
/****** Object:  Index [IX_Educations_EducationLevelId]    Script Date: 29/06/2022 07:02:10 ******/
DROP INDEX [IX_Educations_EducationLevelId] ON [dbo].[Educations]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Trees]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trees]') AND type in (N'U'))
DROP TABLE [dbo].[Trees]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requests]') AND type in (N'U'))
DROP TABLE [dbo].[Requests]
GO
/****** Object:  Table [dbo].[Religions]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Religions]') AND type in (N'U'))
DROP TABLE [dbo].[Religions]
GO
/****** Object:  Table [dbo].[Relatives]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relatives]') AND type in (N'U'))
DROP TABLE [dbo].[Relatives]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Position]') AND type in (N'U'))
DROP TABLE [dbo].[Position]
GO
/****** Object:  Table [dbo].[People]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[People]') AND type in (N'U'))
DROP TABLE [dbo].[People]
GO
/****** Object:  Table [dbo].[ParentsChildren]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ParentsChildren]') AND type in (N'U'))
DROP TABLE [dbo].[ParentsChildren]
GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Occupations]') AND type in (N'U'))
DROP TABLE [dbo].[Occupations]
GO
/****** Object:  Table [dbo].[Nationalities]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nationalities]') AND type in (N'U'))
DROP TABLE [dbo].[Nationalities]
GO
/****** Object:  Table [dbo].[Marriages]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marriages]') AND type in (N'U'))
DROP TABLE [dbo].[Marriages]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
DROP TABLE [dbo].[Images]
GO
/****** Object:  Table [dbo].[Educations]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Educations]') AND type in (N'U'))
DROP TABLE [dbo].[Educations]
GO
/****** Object:  Table [dbo].[EducationLevels]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EducationLevels]') AND type in (N'U'))
DROP TABLE [dbo].[EducationLevels]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/06/2022 07:02:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
USE [master]
GO
/****** Object:  Database [GenealogyTree]    Script Date: 29/06/2022 07:02:10 ******/
DROP DATABASE [GenealogyTree]
GO
/****** Object:  Database [GenealogyTree]    Script Date: 29/06/2022 07:02:10 ******/
CREATE DATABASE [GenealogyTree]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GenealogyTree', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS_DGB\MSSQL\DATA\GenealogyTree.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GenealogyTree_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS_DGB\MSSQL\DATA\GenealogyTree_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GenealogyTree] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GenealogyTree].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GenealogyTree] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GenealogyTree] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GenealogyTree] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GenealogyTree] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GenealogyTree] SET ARITHABORT OFF 
GO
ALTER DATABASE [GenealogyTree] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GenealogyTree] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GenealogyTree] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GenealogyTree] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GenealogyTree] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GenealogyTree] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GenealogyTree] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GenealogyTree] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GenealogyTree] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GenealogyTree] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GenealogyTree] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GenealogyTree] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GenealogyTree] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GenealogyTree] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GenealogyTree] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GenealogyTree] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GenealogyTree] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GenealogyTree] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GenealogyTree] SET  MULTI_USER 
GO
ALTER DATABASE [GenealogyTree] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GenealogyTree] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GenealogyTree] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GenealogyTree] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GenealogyTree] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GenealogyTree] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GenealogyTree] SET QUERY_STORE = OFF
GO
USE [GenealogyTree]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationLevels]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationLevels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_EducationLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Educations]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EducationInstituteName] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EducationLevelId] [int] NULL,
 CONSTRAINT [PK_Educations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[SizeInBytes] [bigint] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marriages]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marriages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[FirstPersonId] [int] NOT NULL,
	[SecondPersonId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_Marriages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationalities]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationalities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Nationalities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OccupationName] [nvarchar](max) NULL,
	[WorkingPlaceName] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Occupations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentsChildren]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentsChildren](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BloodRelatives] [bit] NOT NULL,
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_ParentsChildren] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[BirthDate] [datetime2](7) NULL,
	[DeathDate] [datetime2](7) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[TreeId] [uniqueidentifier] NOT NULL,
	[BirthPlaceId] [int] NULL,
	[LivingPlaceId] [int] NULL,
	[NationalityId] [int] NULL,
	[ReligionId] [int] NULL,
	[ImageId] [int] NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [real] NOT NULL,
	[Longitude] [real] NOT NULL,
	[UpdatedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relatives]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relatives](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrimaryUserId] [uniqueidentifier] NOT NULL,
	[RelativeUserId] [uniqueidentifier] NOT NULL,
	[RelativePersonInPrimaryTreeId] [int] NOT NULL,
	[LastSyncCheck] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Relatives] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religions]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Religions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReceiverResponded] [bit] NOT NULL,
	[Response] [bit] NOT NULL,
	[SenderId] [uniqueidentifier] NOT NULL,
	[ReceiverId] [uniqueidentifier] NOT NULL,
	[ReceiverReferenceInSenderTreeId] [int] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trees]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trees](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Trees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/06/2022 07:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PasswordSalt] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[About] [nvarchar](max) NULL,
	[NotifyBirthdays] [bit] NOT NULL,
	[NotifyUpdates] [bit] NOT NULL,
	[SharePersonalInfo] [bit] NOT NULL,
	[ShareLocation] [bit] NOT NULL,
	[PersonId] [int] NOT NULL,
	[PositionId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220116001549_newDatabase', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220202192121_addedPersonImage', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220323085206_updatedPreferences', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220402084510_removedGenderTable', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220420195453_addedUserPosition', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220602121132_addedCreationAndModificationTimeStamps', N'5.0.11')
GO
SET IDENTITY_INSERT [dbo].[EducationLevels] ON 

INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (1, N'KINDERGARTEN')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (2, N'PRIMARY')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (3, N'GYMNASIUM')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (4, N'HIGHSCOOL')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (5, N'POSTSECONDARY')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (6, N'FACULTY')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (7, N'MASTERS')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (8, N'DOCTORATE')
INSERT [dbo].[EducationLevels] ([Id], [Name]) VALUES (9, NULL)
SET IDENTITY_INSERT [dbo].[EducationLevels] OFF
GO
SET IDENTITY_INSERT [dbo].[Educations] ON 

INSERT [dbo].[Educations] ([Id], [EducationInstituteName], [StartDate], [EndDate], [UserId], [EducationLevelId]) VALUES (2, N'Spiru Haret', CAST(N'1972-09-12T13:02:00.0000000' AS DateTime2), CAST(N'1978-06-29T13:03:00.0000000' AS DateTime2), N'8a11db98-91f5-49ef-964e-3ec8fb20310e', 6)
SET IDENTITY_INSERT [dbo].[Educations] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (1, N'5a4ff366-cb50-4118-9224-885e16bcba9c.png', N'image/png', 224533)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (2, N'bdf9c416-189c-4d90-b658-8fdc242f21cb.png', N'image/png', 68451)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (3, N'68b93048-00c9-4158-b94e-d683003cca48.png', N'image/png', 65844)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (4, N'b17660a7-bea5-40da-bd50-46e586c5a9c9.png', N'image/png', 131307)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (5, N'd7017a00-6f87-4094-8635-e39fe11d24d8.png', N'image/png', 280122)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (6, N'6364aaee-121d-4d4e-ab62-102f05470691.png', N'image/png', 257745)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (7, N'd0b4833d-b783-4c3a-9d1a-6945b19e1886.png', N'image/png', 146241)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (8, N'f3ebe80f-3c67-464b-b607-327dac5d3bcc.png', N'image/png', 237463)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (9, N'91a1b830-26e1-4fdc-be0f-27438a8d57a2.png', N'image/png', 57544)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (10, N'ee590378-4a6f-4def-9c22-dcca1d562733.png', N'image/png', 174670)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (11, N'd1eb131b-f7d6-46dd-a80e-6d5a91dbfcc9.png', N'image/png', 38623)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (12, N'82d54b2b-d884-48ab-9861-a982c8a8c0e3.png', N'image/png', 27973)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (13, N'99442fcb-280f-400f-b8e7-1d7d9a93822a.png', N'image/png', 32314)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (14, N'0703aa61-8346-49d1-ba8a-878512ac7406.png', N'image/png', 47454)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (15, N'bedc596f-7fd7-4b9c-a10f-b2d515fc4170.png', N'image/png', 25425)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (16, N'4b810ce4-c08e-40e0-af49-a21a7e689527.png', N'image/png', 32697)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (17, N'cc64fc8f-f521-4d62-9d1c-8c60f7fd46a1.png', N'image/png', 25651)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (18, N'88ca9bcf-ec01-44ce-a925-a3464a0ff502.png', N'image/png', 99973)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (19, N'4c4db8ee-8896-471f-9a34-756f0a56aacc.png', N'image/png', 280122)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (20, N'1c6dd4a1-2098-488f-aac6-4c230ed42f0d.png', N'image/png', 147201)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (21, N'fa307539-dc1b-4d51-b2e0-2e7dad5725dd.png', N'image/png', 95539)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (22, N'b468c9b7-2ca0-4185-9f0b-02b46c15e3e8.png', N'image/png', 73483)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (23, N'97ed83b2-a337-4356-9cc2-f277bd939143.png', N'image/png', 253828)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (24, N'84b09c0a-0937-4f08-9ea0-96847e396f4a.png', N'image/png', 88839)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (25, N'960842f8-4db7-4c5d-9529-378196aab1f4.png', N'image/png', 237463)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (26, N'71a03a9b-4bf2-4e3c-b592-d5b712dfc884.png', N'image/png', 161100)
INSERT [dbo].[Images] ([Id], [FileName], [MimeType], [SizeInBytes]) VALUES (27, N'6b27bbdc-d453-46f8-b7b0-dcc10ad7fcc9.png', N'image/png', 32712)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (1, N'Elveţia', NULL, N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (2, NULL, NULL, NULL)
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (3, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (4, N'România', N'Prahova', N'Castelul Foişor')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (5, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (6, N'England', N'East Riding', N'Sproatley')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (7, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (8, N'Meiryn', N'', N'Elvetia')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (9, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (10, N'Romania', N'Constanta', N'Constanta')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (11, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (12, N'Franta', N'', N'Paris')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (13, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (14, N'Elvetia', N'', N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (15, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (16, N'Elvetia', N'', N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (17, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (18, N'Grecia', N'', N'Atena')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (19, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (20, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (21, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (22, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (23, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (24, N'Romania', N'Ilfov', N'Bucuresti')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (25, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (26, N'Romania', N'Ilfov', N'Bucuresti')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (27, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (28, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (29, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (30, N'Franta', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (31, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (32, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (33, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (34, N'Romania', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (35, N'Portugalia', N'Lisabona', N'Estorii')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (36, N'Romania', N'Prahova', N'Sinaia')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (37, N'Elvetia', N'', N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (38, N'Grecia', N'', N'Atena')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (39, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (40, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (41, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (42, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (43, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (44, N'Danemarca', N'Hovedstaden', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (45, NULL, NULL, NULL)
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (46, NULL, NULL, NULL)
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (47, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (48, N'Romania', N'Prahova', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (49, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (50, N'Franta', N'', N'Paris')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (51, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (52, N'Elvetia', N'', N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (53, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (54, N'Elvetia', N'', N'Lausanne')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (55, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (56, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (57, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (58, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (59, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (60, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (61, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (62, N'Grecia', N'', N'Atena')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (63, NULL, NULL, NULL)
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (64, NULL, NULL, NULL)
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (65, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (66, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (67, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (68, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (69, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (70, N'Romania', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (71, N'', N'', N'')
INSERT [dbo].[Locations] ([Id], [State], [Country], [City]) VALUES (72, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Marriages] ON 

INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (2, CAST(N'1983-01-25T18:43:00.0000000' AS DateTime2), CAST(N'1991-11-26T20:45:00.0000000' AS DateTime2), 1, 3, CAST(N'2022-06-22T19:44:07.1571489' AS DateTime2), CAST(N'2022-06-22T19:45:14.4855158' AS DateTime2))
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (3, CAST(N'1948-10-31T20:50:00.0000000' AS DateTime2), NULL, 6, 2, CAST(N'2022-06-22T19:51:18.6662951' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (4, CAST(N'1998-07-06T20:17:00.0000000' AS DateTime2), NULL, 10, 1, CAST(N'2022-06-22T20:18:13.3682559' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (5, CAST(N'1998-04-29T03:58:00.0000000' AS DateTime2), CAST(N'2002-05-17T06:59:00.0000000' AS DateTime2), 15, 9, CAST(N'2022-06-23T06:58:54.9029011' AS DateTime2), CAST(N'2022-06-23T06:59:20.3840133' AS DateTime2))
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (6, CAST(N'1996-09-26T07:10:00.0000000' AS DateTime2), NULL, 17, 7, CAST(N'2022-06-23T07:10:20.7895108' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (8, CAST(N'1921-06-09T08:55:00.0000000' AS DateTime2), NULL, 22, 21, CAST(N'2022-06-23T07:40:04.4770319' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (9, CAST(N'1948-06-15T11:42:00.0000000' AS DateTime2), NULL, 25, 24, CAST(N'2022-06-23T10:44:08.8828520' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (10, CAST(N'1983-06-23T10:55:00.0000000' AS DateTime2), CAST(N'2003-02-27T11:55:00.0000000' AS DateTime2), 28, 23, CAST(N'2022-06-23T10:55:38.9801268' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (11, CAST(N'2017-05-11T12:57:00.0000000' AS DateTime2), NULL, 5, 4, CAST(N'2022-06-23T12:57:50.4970454' AS DateTime2), NULL)
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (12, CAST(N'1921-07-07T12:31:36.0000000' AS DateTime2), CAST(N'1929-11-20T14:16:00.0000000' AS DateTime2), 19, 18, CAST(N'2022-06-23T13:00:24.7749985' AS DateTime2), CAST(N'2022-06-23T13:00:52.7668108' AS DateTime2))
INSERT [dbo].[Marriages] ([Id], [StartDate], [EndDate], [FirstPersonId], [SecondPersonId], [CreatedOn], [ModifiedOn]) VALUES (13, CAST(N'2010-06-23T13:35:00.0000000' AS DateTime2), NULL, 36, 29, CAST(N'2022-06-23T13:35:33.2025733' AS DateTime2), CAST(N'2022-06-23T13:36:09.0079967' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Marriages] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationalities] ON 

INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (1, N'Swiss')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (2, N'Dutch')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (3, N'German')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (4, N'French')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (5, N'Belgian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (6, N'Scottish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (7, N'Welsh')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (8, N'Swedish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (9, N'Albanian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (10, N'Norwegian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (11, N'Northern_Irish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (12, N'Austrian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (13, N'Croatian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (14, N'Portuguese')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (15, N'Greek')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (16, N'Italian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (17, N'Lithuanian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (18, N'Serbian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (19, N'Slovenian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (20, N'Spanish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (21, N'Belarusian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (22, N'Bulgarian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (23, N'Czech')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (24, N'Hungarian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (25, N'Polish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (26, N'Romanian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (27, N'Russian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (28, N'Cypriot')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (29, N'Latvian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (30, N'Estonian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (31, N'Icelandic')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (32, N'Irish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (33, N'Danish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (34, N'Ukrainian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (35, N'Slovakian')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (36, N'Finnish')
INSERT [dbo].[Nationalities] ([Id], [Name]) VALUES (37, N'British')
SET IDENTITY_INSERT [dbo].[Nationalities] OFF
GO
SET IDENTITY_INSERT [dbo].[Occupations] ON 

INSERT [dbo].[Occupations] ([Id], [OccupationName], [WorkingPlaceName], [StartDate], [EndDate], [UserId]) VALUES (1, N'Diplomat', N'Ambasada Romaniei', CAST(N'2022-06-23T11:45:00.0000000' AS DateTime2), NULL, N'8a11db98-91f5-49ef-964e-3ec8fb20310e')
SET IDENTITY_INSERT [dbo].[Occupations] OFF
GO
SET IDENTITY_INSERT [dbo].[ParentsChildren] ON 

INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (1, 1, 1, 4, CAST(N'2022-06-22T19:43:12.6980912' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (2, 1, 3, 4, CAST(N'2022-06-22T19:43:16.2825010' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (3, 1, 2, 1, CAST(N'2022-06-22T19:44:45.2746881' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (4, 1, 6, 1, CAST(N'2022-06-22T19:50:43.4260049' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (5, 1, 6, 7, CAST(N'2022-06-22T19:55:18.0179463' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (6, 1, 2, 7, CAST(N'2022-06-22T19:55:20.9893330' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (7, 1, 2, 8, CAST(N'2022-06-22T19:59:41.3546876' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (8, 1, 6, 8, CAST(N'2022-06-22T19:59:59.3271310' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (9, 1, 6, 9, CAST(N'2022-06-22T20:02:56.4283579' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (10, 1, 2, 9, CAST(N'2022-06-22T20:02:59.8162982' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (11, 1, 4, 11, CAST(N'2022-06-23T06:29:27.8826119' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (12, 1, 5, 12, CAST(N'2022-06-23T06:32:25.9451091' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (13, 1, 4, 12, CAST(N'2022-06-23T06:32:30.2795562' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (14, 1, 5, 13, CAST(N'2022-06-23T06:34:40.7772022' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (15, 1, 4, 13, CAST(N'2022-06-23T06:34:45.9408508' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (18, 1, 3, 14, CAST(N'2022-06-23T06:45:20.6274157' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (19, 1, 9, 16, CAST(N'2022-06-23T07:04:52.8537829' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (20, 1, 15, 16, CAST(N'2022-06-23T07:05:07.8985004' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (21, 1, 18, 2, CAST(N'2022-06-23T07:18:29.7332029' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (22, 1, 19, 2, CAST(N'2022-06-23T07:26:42.9953607' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (23, 1, 20, 17, CAST(N'2022-06-23T07:30:38.6088294' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (24, 1, 21, 6, CAST(N'2022-06-23T07:36:25.1083988' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (25, 1, 22, 6, CAST(N'2022-06-23T07:40:15.9417913' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (26, 1, 24, 23, CAST(N'2022-06-23T10:40:38.1176563' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (27, 1, 25, 23, CAST(N'2022-06-23T10:44:23.0037771' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (28, 1, 25, 26, CAST(N'2022-06-23T10:48:26.0941657' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (29, 1, 24, 26, CAST(N'2022-06-23T10:48:28.5011743' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (30, 1, 25, 27, CAST(N'2022-06-23T10:50:26.9118038' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (31, 1, 24, 27, CAST(N'2022-06-23T10:50:30.2974468' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (32, 1, 28, 29, CAST(N'2022-06-23T10:59:47.5586800' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (33, 1, 23, 29, CAST(N'2022-06-23T11:08:31.0263924' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (34, 1, 23, 30, CAST(N'2022-06-23T11:10:48.0144724' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (35, 1, 28, 30, CAST(N'2022-06-23T11:10:50.3178153' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (36, 1, 25, 31, CAST(N'2022-06-23T11:13:26.5756485' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (37, 1, 24, 31, CAST(N'2022-06-23T11:13:29.0860783' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (38, 1, 33, 32, CAST(N'2022-06-23T12:39:05.2263729' AS DateTime2), NULL)
INSERT [dbo].[ParentsChildren] ([Id], [BloodRelatives], [ParentId], [ChildId], [CreatedOn], [ModifiedOn]) VALUES (39, 1, 35, 11, CAST(N'2022-06-23T13:02:46.0329393' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[ParentsChildren] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (1, N'Elena', N'Nixon', CAST(N'1950-11-15T18:05:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 1, 2, 1, 1, 1, N'f', CAST(N'2022-06-22T19:08:46.9482050' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (2, N'Mihai', N'I', CAST(N'1921-10-25T20:38:00.0000000' AS DateTime2), CAST(N'2017-12-05T20:23:00.0000000' AS DateTime2), CAST(N'2022-06-22T19:25:07.1933375' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 4, 3, 26, 1, 2, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (3, N'Robin', N'Medforth-Mills', CAST(N'1942-12-08T20:31:00.0000000' AS DateTime2), CAST(N'2002-02-02T20:32:00.0000000' AS DateTime2), CAST(N'2022-06-22T19:33:43.1670141' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 6, 5, 37, 1, 12, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (4, N'Nicholas', N'Medforth-Mills', CAST(N'1985-04-01T16:35:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T19:36:11.5588191' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 8, 7, 37, 1, 3, N'm', CAST(N'2022-06-23T08:19:38.4282014' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (5, N'Alina-Maria', N'Binder', CAST(N'1988-01-26T20:38:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T19:40:00.8380430' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 10, 9, 26, 1, 4, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (6, N'Anne', N'of Bourbon-Parma', CAST(N'1922-09-18T21:03:00.0000000' AS DateTime2), CAST(N'2016-08-01T19:48:00.0000000' AS DateTime2), CAST(N'2022-06-22T19:49:25.4658014' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 12, 11, 4, 1, 5, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (7, N'Margareta', N'de România', CAST(N'1948-03-26T20:53:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T19:54:17.1246584' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 14, 13, 26, 1, 6, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (8, N'Irina', N'Walker', CAST(N'1953-02-28T20:57:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T19:58:01.0875455' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 16, 15, 26, NULL, 7, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (9, N'Sofia', N'de Romania', CAST(N'1957-10-29T21:01:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T20:02:11.0270585' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 18, 17, 26, 1, 8, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (10, N'Alexander Philips', N'Nixon', CAST(N'1964-10-22T21:14:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-22T20:15:26.9152269' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 20, 19, 37, 1, 9, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (11, N'Iris Anna', N'Cirjan', CAST(N'2016-02-05T07:28:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T06:28:47.6891257' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 22, 21, 26, 1, 10, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (12, N'Maria Alexandra', N'Mills', CAST(N'2020-11-07T03:31:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T06:31:57.0323275' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 24, 23, 26, 1, NULL, N'f', CAST(N'2022-06-23T06:39:08.1626250' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (13, N'Mihai', N'Medforth-Mills', CAST(N'2022-04-15T03:34:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T06:34:35.2915675' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 26, 25, 26, 1, NULL, N'm', CAST(N'2022-06-23T12:58:29.0316658' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (14, N'Elisabeta', N'Medforth-Mills', CAST(N'1989-01-04T05:43:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T06:43:39.3065593' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 28, 27, 37, 1, 11, N'f', CAST(N'2022-06-23T06:47:55.2388234' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (15, N'Alain', N'Biarneix', CAST(N'1957-06-11T08:01:00.0000000' AS DateTime2), CAST(N'2021-08-18T07:02:00.0000000' AS DateTime2), CAST(N'2022-06-23T06:58:19.9831974' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 30, 29, 4, 1, NULL, N'm', CAST(N'2022-06-23T07:02:23.0275699' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (16, N'Elisabeta-Maria', N'Biarneix', CAST(N'1999-08-15T07:03:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T07:04:31.7442468' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 32, 31, 4, 1, NULL, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (17, N'Radu', N'Duda', CAST(N'1960-06-07T08:07:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T07:07:51.0547196' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 34, 33, 26, 1, 13, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (18, N'Carol', N'Caraiman', CAST(N'1893-10-15T08:32:00.0000000' AS DateTime2), CAST(N'1953-04-04T08:17:00.0000000' AS DateTime2), CAST(N'2022-06-23T07:17:46.9622158' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 36, 35, 26, 1, 14, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (19, N'Elena', N'a Romaniei', CAST(N'1896-05-15T08:37:00.0000000' AS DateTime2), CAST(N'1982-11-28T08:21:00.0000000' AS DateTime2), CAST(N'2022-06-23T07:23:47.5042690' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 38, 37, 15, 8, 15, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (20, N'Rene Corneliu', N'Duda', CAST(N'1935-01-03T08:29:00.0000000' AS DateTime2), CAST(N'1999-12-30T08:30:00.0000000' AS DateTime2), CAST(N'2022-06-23T07:30:29.7266553' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 40, 39, 26, 1, NULL, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (21, N'Rene', N'de Bourbon-Parma', CAST(N'1894-10-17T08:50:00.0000000' AS DateTime2), CAST(N'1962-07-30T08:35:00.0000000' AS DateTime2), CAST(N'2022-06-23T07:35:57.1866373' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 42, 41, 4, 1, 16, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (22, N'Margarethe', N'Helene', CAST(N'1895-09-17T08:53:00.0000000' AS DateTime2), CAST(N'1992-09-18T07:38:00.0000000' AS DateTime2), CAST(N'2022-06-23T07:38:59.5189587' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 44, 43, 33, 1, 17, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (23, N'Irina', N'Walker', CAST(N'1953-02-28T09:36:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 45, 46, 26, 1, 20, N'f', CAST(N'2022-06-23T11:08:22.9823064' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (24, N'Mihai ', N'I', CAST(N'1927-07-20T11:54:00.0000000' AS DateTime2), CAST(N'2017-11-05T11:39:00.0000000' AS DateTime2), CAST(N'2022-06-23T10:39:39.1199757' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 48, 47, 26, 1, 18, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (25, N'Ana', N'de Bourbon-Parma', CAST(N'1923-09-18T11:57:00.0000000' AS DateTime2), CAST(N'2016-08-01T10:41:00.0000000' AS DateTime2), CAST(N'2022-06-23T10:42:29.7130531' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 50, 49, 26, 1, 19, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (26, N'Margareta', N'a Romaniei', CAST(N'1949-03-26T09:46:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T10:47:22.2569410' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 52, 51, 26, 1, 21, N'f', CAST(N'2022-06-23T10:48:01.3536760' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (27, N'Elena', N'Nixon', CAST(N'1950-11-15T11:49:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T10:49:55.7477939' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 54, 53, 37, 1, 22, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (28, N'John', N'Kreuger', CAST(N'1945-08-03T11:52:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T10:53:38.7532995' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 56, 55, 37, 5, 23, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (29, N'Michael', N'Kreuger', CAST(N'1985-06-23T13:07:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T10:58:42.4390899' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 58, 57, 37, 19, 24, N'm', CAST(N'2022-06-23T13:07:31.6614657' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (30, N'Angelica', N'Kreuger', CAST(N'1986-12-29T12:09:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T11:10:29.7604625' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 60, 59, 37, 1, NULL, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (31, N'Sofia', N'de Romania', CAST(N'1957-10-29T12:12:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T11:13:13.0962248' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 62, 61, 26, 1, 25, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (32, N'Nicholas', N'Medforth-Mills', CAST(N'1985-04-01T11:29:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'b2c49a9a-3895-4896-8742-a805cc7fbf44', 63, 64, 1, 1, 26, N'm', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (33, N'Elena', N'Nixon', CAST(N'1951-06-20T13:37:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T12:37:44.1306840' AS DateTime2), N'b2c49a9a-3895-4896-8742-a805cc7fbf44', 66, 65, 26, 1, NULL, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (34, N'Irina', N'Walker', CAST(N'1955-07-28T13:38:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T12:38:27.4861864' AS DateTime2), N'b2c49a9a-3895-4896-8742-a805cc7fbf44', 68, 67, 26, NULL, NULL, N'f', NULL)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (35, N'Nicoleta', N'Cirjan', CAST(N'1986-09-24T13:02:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T13:01:33.0823295' AS DateTime2), N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', 70, 69, 26, 1, 27, N'f', CAST(N'2022-06-23T13:02:34.5956898' AS DateTime2))
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [BirthDate], [DeathDate], [CreatedOn], [TreeId], [BirthPlaceId], [LivingPlaceId], [NationalityId], [ReligionId], [ImageId], [Gender], [ModifiedOn]) VALUES (36, N'Tara Marie', N'Littlefield', CAST(N'1988-08-24T13:34:00.0000000' AS DateTime2), NULL, CAST(N'2022-06-23T13:35:08.4698327' AS DateTime2), N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', 72, 71, 29, 20, NULL, N'f', NULL)
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Latitude], [Longitude], [UpdatedOn]) VALUES (1, 44.24828, 23.9347477, CAST(N'2022-06-28T23:24:02.9428863' AS DateTime2))
INSERT [dbo].[Position] ([Id], [Latitude], [Longitude], [UpdatedOn]) VALUES (2, 0, 0, NULL)
INSERT [dbo].[Position] ([Id], [Latitude], [Longitude], [UpdatedOn]) VALUES (4, 44.42677, 26.10254, CAST(N'2022-06-24T00:17:15.2806730' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Relatives] ON 

INSERT [dbo].[Relatives] ([Id], [PrimaryUserId], [RelativeUserId], [RelativePersonInPrimaryTreeId], [LastSyncCheck]) VALUES (1, N'6b88792e-d424-4aa9-b43b-ed3c63b3d919', N'8a11db98-91f5-49ef-964e-3ec8fb20310e', 27, CAST(N'2022-06-23T12:19:46.9112519' AS DateTime2))
INSERT [dbo].[Relatives] ([Id], [PrimaryUserId], [RelativeUserId], [RelativePersonInPrimaryTreeId], [LastSyncCheck]) VALUES (2, N'8a11db98-91f5-49ef-964e-3ec8fb20310e', N'6b88792e-d424-4aa9-b43b-ed3c63b3d919', 8, CAST(N'2022-06-23T12:19:46.9517759' AS DateTime2))
INSERT [dbo].[Relatives] ([Id], [PrimaryUserId], [RelativeUserId], [RelativePersonInPrimaryTreeId], [LastSyncCheck]) VALUES (3, N'8d84368b-38b9-4e9f-b56d-81202895caf4', N'8a11db98-91f5-49ef-964e-3ec8fb20310e', 33, CAST(N'2022-06-23T12:46:22.9450036' AS DateTime2))
INSERT [dbo].[Relatives] ([Id], [PrimaryUserId], [RelativeUserId], [RelativePersonInPrimaryTreeId], [LastSyncCheck]) VALUES (4, N'8a11db98-91f5-49ef-964e-3ec8fb20310e', N'8d84368b-38b9-4e9f-b56d-81202895caf4', 4, CAST(N'2022-06-23T12:46:22.9558270' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Relatives] OFF
GO
SET IDENTITY_INSERT [dbo].[Religions] ON 

INSERT [dbo].[Religions] ([Id], [Name]) VALUES (1, N'CHRISTIANITY')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (2, N'ISLAM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (3, N'AGNOSTIC')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (4, N'ATHEIST')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (5, N'HINDUISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (6, N'BUDDHISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (7, N'CHINESE_TRADITIONAL')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (8, N'ETHNIC')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (9, N'AFRICAN_TRADITIONAL')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (10, N'SIKHISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (11, N'JUDAISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (12, N'BAHAI')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (13, N'SHINTO')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (14, N'CAO_DAI')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (15, N'ZOROASTRIANISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (16, N'TENRIKYO')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (17, N'ANIMISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (18, N'NEO-PAGANISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (19, N'UNITARIAN_UNIVERSALISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (20, N'RASTAFARI')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (21, N'OTHER')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (22, N'SPIRITISM')
INSERT [dbo].[Religions] ([Id], [Name]) VALUES (23, N'JAINISM')
SET IDENTITY_INSERT [dbo].[Religions] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [ReceiverResponded], [Response], [SenderId], [ReceiverId], [ReceiverReferenceInSenderTreeId]) VALUES (1, 1, 1, N'6b88792e-d424-4aa9-b43b-ed3c63b3d919', N'8a11db98-91f5-49ef-964e-3ec8fb20310e', 27)
INSERT [dbo].[Requests] ([Id], [ReceiverResponded], [Response], [SenderId], [ReceiverId], [ReceiverReferenceInSenderTreeId]) VALUES (2, 1, 1, N'8d84368b-38b9-4e9f-b56d-81202895caf4', N'8a11db98-91f5-49ef-964e-3ec8fb20310e', 33)
INSERT [dbo].[Requests] ([Id], [ReceiverResponded], [Response], [SenderId], [ReceiverId], [ReceiverReferenceInSenderTreeId]) VALUES (3, 0, 0, N'8d84368b-38b9-4e9f-b56d-81202895caf4', N'6b88792e-d424-4aa9-b43b-ed3c63b3d919', 34)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
INSERT [dbo].[Trees] ([Id], [Name], [LastUpdate]) VALUES (N'8ee3384b-4e75-430a-9cb7-8b84666e15b3', NULL, CAST(N'2022-06-23T10:37:43.7999618' AS DateTime2))
INSERT [dbo].[Trees] ([Id], [Name], [LastUpdate]) VALUES (N'ea9282b5-ec42-467d-9a29-a5e2c9aab8a5', NULL, CAST(N'2022-06-22T19:06:48.6477580' AS DateTime2))
INSERT [dbo].[Trees] ([Id], [Name], [LastUpdate]) VALUES (N'b2c49a9a-3895-4896-8742-a805cc7fbf44', NULL, CAST(N'2022-06-23T11:31:19.1590818' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [Email], [PhoneNumber], [About], [NotifyBirthdays], [NotifyUpdates], [SharePersonalInfo], [ShareLocation], [PersonId], [PositionId]) VALUES (N'8a11db98-91f5-49ef-964e-3ec8fb20310e', N'elenan', N'zshCdRbDCCn0SOc8TI1+X0A1VkiokC5U0ahTQ5BvUI8=', N'7Kizqg5sTCVhWDpK+cKJIA==', N'elenanixon@gmail.com', NULL, NULL, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [Email], [PhoneNumber], [About], [NotifyBirthdays], [NotifyUpdates], [SharePersonalInfo], [ShareLocation], [PersonId], [PositionId]) VALUES (N'8d84368b-38b9-4e9f-b56d-81202895caf4', N'nichol', N'8YaDF50VFcgHpJuun1AsefGgrIZKwHjgbbzsRqI9vfE=', N'vflxCV/9YdgkPQKkdFwkPg==', N'nicholas@gmail.com', NULL, NULL, 0, 0, 0, 0, 32, 2)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [Email], [PhoneNumber], [About], [NotifyBirthdays], [NotifyUpdates], [SharePersonalInfo], [ShareLocation], [PersonId], [PositionId]) VALUES (N'6b88792e-d424-4aa9-b43b-ed3c63b3d919', N'irinaw', N'Ctl06Q9tAPjTGkAlsrs87hSshkC2HCV+fHmw73nenBA=', N'XyqwZuOzi+w8tyNpQiQNxw==', N'irinaro@gmail.com', NULL, NULL, 1, 1, 0, 1, 23, 4)
GO
/****** Object:  Index [IX_Educations_EducationLevelId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Educations_EducationLevelId] ON [dbo].[Educations]
(
	[EducationLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Educations_UserId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Educations_UserId] ON [dbo].[Educations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marriages_FirstPersonId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Marriages_FirstPersonId] ON [dbo].[Marriages]
(
	[FirstPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marriages_SecondPersonId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Marriages_SecondPersonId] ON [dbo].[Marriages]
(
	[SecondPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Occupations_UserId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Occupations_UserId] ON [dbo].[Occupations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentsChildren_ChildId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_ParentsChildren_ChildId] ON [dbo].[ParentsChildren]
(
	[ChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentsChildren_ParentId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_ParentsChildren_ParentId] ON [dbo].[ParentsChildren]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_BirthPlaceId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_BirthPlaceId] ON [dbo].[People]
(
	[BirthPlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_ImageId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_ImageId] ON [dbo].[People]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_LivingPlaceId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_LivingPlaceId] ON [dbo].[People]
(
	[LivingPlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_NationalityId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_NationalityId] ON [dbo].[People]
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_ReligionId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_ReligionId] ON [dbo].[People]
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_TreeId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_People_TreeId] ON [dbo].[People]
(
	[TreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relatives_PrimaryUserId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Relatives_PrimaryUserId] ON [dbo].[Relatives]
(
	[PrimaryUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relatives_RelativePersonInPrimaryTreeId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Relatives_RelativePersonInPrimaryTreeId] ON [dbo].[Relatives]
(
	[RelativePersonInPrimaryTreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relatives_RelativeUserId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Relatives_RelativeUserId] ON [dbo].[Relatives]
(
	[RelativeUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requests_ReceiverId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Requests_ReceiverId] ON [dbo].[Requests]
(
	[ReceiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requests_ReceiverReferenceInSenderTreeId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Requests_ReceiverReferenceInSenderTreeId] ON [dbo].[Requests]
(
	[ReceiverReferenceInSenderTreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requests_SenderId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Requests_SenderId] ON [dbo].[Requests]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_PersonId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Users_PersonId] ON [dbo].[Users]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_PositionId]    Script Date: 29/06/2022 07:02:10 ******/
CREATE NONCLUSTERED INDEX [IX_Users_PositionId] ON [dbo].[Users]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marriages] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ParentsChildren] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedOn]
GO
ALTER TABLE [dbo].[People] ADD  DEFAULT (N'') FOR [Gender]
GO
ALTER TABLE [dbo].[Relatives] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [LastSyncCheck]
GO
ALTER TABLE [dbo].[Educations]  WITH CHECK ADD  CONSTRAINT [FK_Educations_EducationLevels_EducationLevelId] FOREIGN KEY([EducationLevelId])
REFERENCES [dbo].[EducationLevels] ([Id])
GO
ALTER TABLE [dbo].[Educations] CHECK CONSTRAINT [FK_Educations_EducationLevels_EducationLevelId]
GO
ALTER TABLE [dbo].[Educations]  WITH CHECK ADD  CONSTRAINT [FK_Educations_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Educations] CHECK CONSTRAINT [FK_Educations_Users_UserId]
GO
ALTER TABLE [dbo].[Marriages]  WITH CHECK ADD  CONSTRAINT [FK_Marriages_People_FirstPersonId] FOREIGN KEY([FirstPersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Marriages] CHECK CONSTRAINT [FK_Marriages_People_FirstPersonId]
GO
ALTER TABLE [dbo].[Marriages]  WITH CHECK ADD  CONSTRAINT [FK_Marriages_People_SecondPersonId] FOREIGN KEY([SecondPersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Marriages] CHECK CONSTRAINT [FK_Marriages_People_SecondPersonId]
GO
ALTER TABLE [dbo].[Occupations]  WITH CHECK ADD  CONSTRAINT [FK_Occupations_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Occupations] CHECK CONSTRAINT [FK_Occupations_Users_UserId]
GO
ALTER TABLE [dbo].[ParentsChildren]  WITH CHECK ADD  CONSTRAINT [FK_ParentsChildren_People_ChildId] FOREIGN KEY([ChildId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[ParentsChildren] CHECK CONSTRAINT [FK_ParentsChildren_People_ChildId]
GO
ALTER TABLE [dbo].[ParentsChildren]  WITH CHECK ADD  CONSTRAINT [FK_ParentsChildren_People_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[ParentsChildren] CHECK CONSTRAINT [FK_ParentsChildren_People_ParentId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Images_ImageId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Locations_BirthPlaceId] FOREIGN KEY([BirthPlaceId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Locations_BirthPlaceId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Locations_LivingPlaceId] FOREIGN KEY([LivingPlaceId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Locations_LivingPlaceId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Nationalities_NationalityId] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationalities] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Nationalities_NationalityId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Religions_ReligionId] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[Religions] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Religions_ReligionId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Trees_TreeId] FOREIGN KEY([TreeId])
REFERENCES [dbo].[Trees] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Trees_TreeId]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_People_RelativePersonInPrimaryTreeId] FOREIGN KEY([RelativePersonInPrimaryTreeId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_People_RelativePersonInPrimaryTreeId]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_Users_PrimaryUserId] FOREIGN KEY([PrimaryUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_Users_PrimaryUserId]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_Users_RelativeUserId] FOREIGN KEY([RelativeUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_Users_RelativeUserId]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_People_ReceiverReferenceInSenderTreeId] FOREIGN KEY([ReceiverReferenceInSenderTreeId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_People_ReceiverReferenceInSenderTreeId]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users_ReceiverId] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users_ReceiverId]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users_SenderId] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users_SenderId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_People_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_People_PersonId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Position_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Position_PositionId]
GO
USE [master]
GO
ALTER DATABASE [GenealogyTree] SET  READ_WRITE 
GO
