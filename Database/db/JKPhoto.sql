USE [master]
GO

/****** Object:  Database [JKPhoto]    Script Date: 12/25/2013 11:00:30 AM ******/
CREATE DATABASE [JKPhoto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JKPhoto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JKPhoto.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JKPhoto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JKPhoto_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [JKPhoto] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JKPhoto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [JKPhoto] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [JKPhoto] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [JKPhoto] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [JKPhoto] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [JKPhoto] SET ARITHABORT OFF 
GO

ALTER DATABASE [JKPhoto] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [JKPhoto] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [JKPhoto] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [JKPhoto] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [JKPhoto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [JKPhoto] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [JKPhoto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [JKPhoto] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [JKPhoto] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [JKPhoto] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [JKPhoto] SET  ENABLE_BROKER 
GO

ALTER DATABASE [JKPhoto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [JKPhoto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [JKPhoto] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [JKPhoto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [JKPhoto] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [JKPhoto] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [JKPhoto] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [JKPhoto] SET RECOVERY FULL 
GO

ALTER DATABASE [JKPhoto] SET  MULTI_USER 
GO

ALTER DATABASE [JKPhoto] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [JKPhoto] SET DB_CHAINING OFF 
GO

ALTER DATABASE [JKPhoto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [JKPhoto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [JKPhoto] SET  READ_WRITE 
GO

