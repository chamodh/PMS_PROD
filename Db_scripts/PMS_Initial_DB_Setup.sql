USE [master]
GO

/****** Object:  Database [Production_Management_System]    Script Date: 7/1/2016 8:00:52 PM ******/
CREATE DATABASE [Production_Management_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Production_Management_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Production_Management_System.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Production_Management_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Production_Management_System_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Production_Management_System] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Production_Management_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Production_Management_System] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Production_Management_System] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Production_Management_System] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Production_Management_System] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Production_Management_System] SET ARITHABORT OFF 
GO

ALTER DATABASE [Production_Management_System] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [Production_Management_System] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Production_Management_System] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Production_Management_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Production_Management_System] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Production_Management_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Production_Management_System] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Production_Management_System] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Production_Management_System] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Production_Management_System] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Production_Management_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Production_Management_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Production_Management_System] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Production_Management_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Production_Management_System] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Production_Management_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Production_Management_System] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Production_Management_System] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Production_Management_System] SET  MULTI_USER 
GO

ALTER DATABASE [Production_Management_System] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Production_Management_System] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Production_Management_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Production_Management_System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Production_Management_System] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Production_Management_System] SET  READ_WRITE 
GO


