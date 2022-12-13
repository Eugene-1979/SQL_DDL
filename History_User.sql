USE [master]
GO
/****** Object:  Database [HistoryUser]    Script Date: 14.12.2022 0:01:33 ******/
CREATE DATABASE [HistoryUser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HistoryUser', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HistoryUser.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HistoryUser_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HistoryUser_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HistoryUser] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HistoryUser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HistoryUser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HistoryUser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HistoryUser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HistoryUser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HistoryUser] SET ARITHABORT OFF 
GO
ALTER DATABASE [HistoryUser] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HistoryUser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HistoryUser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HistoryUser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HistoryUser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HistoryUser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HistoryUser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HistoryUser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HistoryUser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HistoryUser] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HistoryUser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HistoryUser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HistoryUser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HistoryUser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HistoryUser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HistoryUser] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HistoryUser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HistoryUser] SET RECOVERY FULL 
GO
ALTER DATABASE [HistoryUser] SET  MULTI_USER 
GO
ALTER DATABASE [HistoryUser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HistoryUser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HistoryUser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HistoryUser] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HistoryUser] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HistoryUser] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HistoryUser', N'ON'
GO
ALTER DATABASE [HistoryUser] SET QUERY_STORE = OFF
GO
USE [HistoryUser]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 14.12.2022 0:01:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description](
	[Id_Description] [nchar](10) NOT NULL,
	[Person_id] [int] NOT NULL,
	[Site_id] [int] NOT NULL,
	[login] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[timeStard] [time](7) NOT NULL,
	[timeEnd] [timestamp] NOT NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Id_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 14.12.2022 0:01:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id_Person] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LasName] [nchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 14.12.2022 0:01:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[Id_Site] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[Id_Site] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_DescriptionM_Site1] FOREIGN KEY([Site_id])
REFERENCES [dbo].[Site] ([Id_Site])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_DescriptionM_Site1]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Person1_DescriptionM] FOREIGN KEY([Person_id])
REFERENCES [dbo].[Person] ([Id_Person])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Person1_DescriptionM]
GO
USE [master]
GO
ALTER DATABASE [HistoryUser] SET  READ_WRITE 
GO
