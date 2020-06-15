CREATE DATABASE [MS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MS.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MS_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MS] SET COMPATIBILITY_LEVEL = 120
GO
ALTER DATABASE [MS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MS] SET  READ_WRITE 
GO
ALTER DATABASE [MS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MS] SET  MULTI_USER 
GO
ALTER DATABASE [MS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MS]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [MS] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
