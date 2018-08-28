
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/16/2013 17:28:31
-- Generated from EDMX file: C:\Development\Web MVC\ToDoMVC\ToDoMVC\Models\ToDo.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DevinDow];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_List_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [FK_List_User];
GO
IF OBJECT_ID(N'[dbo].[FK_ListItem_List]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListItems] DROP CONSTRAINT [FK_ListItem_List];
GO
IF OBJECT_ID(N'[dbo].[FK_ListItem_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListItems] DROP CONSTRAINT [FK_ListItem_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Lists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lists];
GO
IF OBJECT_ID(N'[dbo].[ListItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ListItems];
GO
IF OBJECT_ID(N'[dbo].[TimeFrames]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TimeFrames];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Lists'
CREATE TABLE [dbo].[Lists] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [Name] char(16)  NOT NULL,
    [ListOrder] int  NOT NULL,
    [UseTimeFrames] bit  NOT NULL
);
GO

-- Creating table 'ListItems'
CREATE TABLE [dbo].[ListItems] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ListID] int  NOT NULL,
    [Text] nvarchar(50)  NOT NULL,
    [Priority] int  NOT NULL
);
GO

-- Creating table 'TimeFrames'
CREATE TABLE [dbo].[TimeFrames] (
    [ID] int  NOT NULL,
    [Name] char(16)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] char(16)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Lists'
ALTER TABLE [dbo].[Lists]
ADD CONSTRAINT [PK_Lists]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ListItems'
ALTER TABLE [dbo].[ListItems]
ADD CONSTRAINT [PK_ListItems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TimeFrames'
ALTER TABLE [dbo].[TimeFrames]
ADD CONSTRAINT [PK_TimeFrames]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserID] in table 'Lists'
ALTER TABLE [dbo].[Lists]
ADD CONSTRAINT [FK_List_User]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_List_User'
CREATE INDEX [IX_FK_List_User]
ON [dbo].[Lists]
    ([UserID]);
GO

-- Creating foreign key on [ListID] in table 'ListItems'
ALTER TABLE [dbo].[ListItems]
ADD CONSTRAINT [FK_ListItem_List]
    FOREIGN KEY ([ListID])
    REFERENCES [dbo].[Lists]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ListItem_List'
CREATE INDEX [IX_FK_ListItem_List]
ON [dbo].[ListItems]
    ([ListID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------