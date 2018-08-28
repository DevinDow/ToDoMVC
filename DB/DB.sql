
--Create database

USE [master]
GO
IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE name = N'ToDo')
BEGIN
CREATE DATABASE [ToDo] COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'ToDo', @new_cmptlevel=110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
	EXEC [ToDo].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO
ALTER DATABASE [ToDo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ToDo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ToDo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ToDo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ToDo] SET ARITHABORT OFF
GO
ALTER DATABASE [ToDo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ToDo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ToDo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ToDo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ToDo] SET CURSOR_DEFAULT GLOBAL
GO
ALTER DATABASE [ToDo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ToDo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ToDo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ToDo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ToDo] SET DISABLE_BROKER
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ToDo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ToDo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ToDo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ToDo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ToDo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ToDo] SET READ_WRITE
GO
ALTER DATABASE [ToDo] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ToDo] SET MULTI_USER
GO
ALTER DATABASE [ToDo] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ToDo] SET DB_CHAINING OFF
GO

USE [ToDo]
GO

--Table dbo.ListItems

USE [ToDo]
GO

--Create table and its columns
CREATE TABLE [dbo].[ListItems] (
	[ID] [int] NOT NULL IDENTITY (1, 1),
	[ListID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Priority] [int] NOT NULL);
GO

SET IDENTITY_INSERT [dbo].[ListItems] ON
GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (3, 2, 1, N'2010X Taxes!', 2)

GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (7, 2, 1, N'test', 2)

GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (8, 3, 1, N'activity', 1)

GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (9, 4, 1, N'pri', 2)

GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (11, 3, 1, N'activity1', 1)

GO
INSERT INTO [dbo].[ListItems] ([ID], [ListID], [UserID], [Text], [Priority])
	VALUES (12, 3, 1, N'aa', 3)

GO
SET IDENTITY_INSERT [dbo].[ListItems] OFF
GO

--Table dbo.Lists

USE [ToDo]
GO

--Create table and its columns
CREATE TABLE [dbo].[Lists] (
	[ID] [int] NOT NULL IDENTITY (1, 1),
	[Name] [char](16) NOT NULL,
	[ListOrder] [int] NOT NULL,
	[UserID] [int] NOT NULL);
GO

SET IDENTITY_INSERT [dbo].[Lists] ON
GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (2, N'Tasks           ', 1, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (3, N'Activities      ', 2, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (4, N'Priorities      ', 3, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (5, N'Goals           ', 4, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (6, N'Desires         ', 5, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (7, N'Passions        ', 6, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (8, N'Joys            ', 7, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (9, N'Values          ', 8, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (10, N'Links           ', 99, 1)

GO
INSERT INTO [dbo].[Lists] ([ID], [Name], [ListOrder], [UserID])
	VALUES (11, N'Notes           ', 100, 1)

GO
SET IDENTITY_INSERT [dbo].[Lists] OFF
GO

--Table dbo.TimeFrames

USE [ToDo]
GO

--Create table and its columns
CREATE TABLE [dbo].[TimeFrames] (
	[ID] [int] NOT NULL,
	[Name] [char](16) NOT NULL);
GO

--Table dbo.Users

USE [ToDo]
GO

--Create table and its columns
CREATE TABLE [dbo].[Users] (
	[ID] [int] NOT NULL IDENTITY (1, 1),
	[Name] [char](16) NOT NULL);
GO

SET IDENTITY_INSERT [dbo].[Users] ON
GO
INSERT INTO [dbo].[Users] ([ID], [Name])
	VALUES (1, N'Devin           ')

GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

--Indexes of table dbo.ListItems
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_FK_ListItem_List] ON [dbo].[ListItems]  ([ListID]) 
GO

CREATE NONCLUSTERED INDEX [IX_FK_ListItem_User] ON [dbo].[ListItems]  ([UserID]) 
GO

ALTER TABLE [dbo].[ListItems] ADD CONSTRAINT [PK_ListItems] PRIMARY KEY CLUSTERED ([ID]) 
GO

--Indexes of table dbo.Lists
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_FK_List_User] ON [dbo].[Lists]  ([UserID]) 
GO

ALTER TABLE [dbo].[Lists] ADD CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED ([ID]) 
GO

--Indexes of table dbo.TimeFrames
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TimeFrames] ADD CONSTRAINT [PK_TimeFrames] PRIMARY KEY CLUSTERED ([ID]) 
GO

--Indexes of table dbo.Users
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID]) 
GO

--Foreign Keys

USE [ToDo]
GO
ALTER TABLE [dbo].[ListItems] WITH CHECK ADD CONSTRAINT [FK_ListItem_List] 
	FOREIGN KEY ([ListID]) REFERENCES [dbo].[Lists] ([ID])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[ListItems] CHECK CONSTRAINT [FK_ListItem_List]
GO
ALTER TABLE [dbo].[ListItems] WITH CHECK ADD CONSTRAINT [FK_ListItem_User] 
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[ListItems] CHECK CONSTRAINT [FK_ListItem_User]
GO
ALTER TABLE [dbo].[Lists] WITH CHECK ADD CONSTRAINT [FK_List_User] 
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[Lists] CHECK CONSTRAINT [FK_List_User]
GO
