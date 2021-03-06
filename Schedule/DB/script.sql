USE [master]
GO
/****** Object:  Database [Schedule]    Script Date: 18/05/2020 12:49:50 ******/
CREATE DATABASE [Schedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Schedule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017\MSSQL\DATA\Schedule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Schedule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017\MSSQL\DATA\Schedule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Schedule] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Schedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Schedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Schedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Schedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Schedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Schedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [Schedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Schedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Schedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Schedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Schedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Schedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Schedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Schedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Schedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Schedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Schedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Schedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Schedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Schedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Schedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Schedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Schedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Schedule] SET RECOVERY FULL 
GO
ALTER DATABASE [Schedule] SET  MULTI_USER 
GO
ALTER DATABASE [Schedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Schedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Schedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Schedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Schedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Schedule] SET QUERY_STORE = OFF
GO
USE [Schedule]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 18/05/2020 12:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Expiry] [int] NULL,
	[Description] [varchar](200) NULL,
	[Complete] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Error_Log]    Script Date: 18/05/2020 12:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Error_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorSource] [varchar](50) NULL,
	[FunctionName] [varchar](50) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Error_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([Id], [Title], [StartDate], [EndDate], [Expiry], [Description], [Complete]) VALUES (1, NULL, CAST(N'2020-05-20T07:00:00.000' AS DateTime), CAST(N'2020-05-24T07:00:00.000' AS DateTime), 4, NULL, 0)
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Error_Log] ON 

INSERT [dbo].[Tbl_Error_Log] ([Id], [ErrorSource], [FunctionName], [ErrorMessage], [CreatedDate]) VALUES (1, N'Service', N'CreateSchedule', N'Could not find stored procedure ''sp_Tbl_Mst_ScheduleInsert''.', CAST(N'2020-05-18T18:13:01.253' AS DateTime))
INSERT [dbo].[Tbl_Error_Log] ([Id], [ErrorSource], [FunctionName], [ErrorMessage], [CreatedDate]) VALUES (2, N'Service', N'CreateSchedule', N'Could not find stored procedure ''sp_Tbl_Mst_ScheduleInsert''.', CAST(N'2020-05-18T18:17:51.167' AS DateTime))
INSERT [dbo].[Tbl_Error_Log] ([Id], [ErrorSource], [FunctionName], [ErrorMessage], [CreatedDate]) VALUES (3, N'Service', N'CreateSchedule', N'Could not find stored procedure ''sp_Tbl_Mst_ScheduleInsert''.', CAST(N'2020-05-18T18:19:01.213' AS DateTime))
INSERT [dbo].[Tbl_Error_Log] ([Id], [ErrorSource], [FunctionName], [ErrorMessage], [CreatedDate]) VALUES (4, N'Service', N'UpdateSchedule', N'SqlDateTime overflow. Must be between 1/1/1753 12:00:00 AM and 12/31/9999 11:59:59 PM.', CAST(N'2020-05-18T18:29:51.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Error_Log] OFF
/****** Object:  StoredProcedure [dbo].[sp_Tbl_Error_LogInsert]    Script Date: 18/05/2020 12:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_Tbl_Error_LogInsert]   
    @ErrorSource varchar(50) = NULL,  
    @ErrorMessage varchar(MAX) = NULL,  
 @FunctionName varchar(50) = null  
    --@CreatedDate datetime = NULL  
AS   
 SET NOCOUNT ON   
 SET XACT_ABORT ON    
   
 BEGIN TRAN  
   
 INSERT INTO [dbo].[Tbl_Error_Log] ([ErrorSource],functionname, [ErrorMessage], [CreatedDate])  
 SELECT @ErrorSource,@FunctionName, @ErrorMessage ,Dateadd(HOUR,7, GETDATE())  
   
 -- Begin Return Select <- do not remove  
 SELECT [Id], [ErrorSource],functionname, [ErrorMessage], [CreatedDate]  
 FROM   [dbo].[Tbl_Error_Log]  
 WHERE  [Id] = SCOPE_IDENTITY()  
 -- End Return Select <- do not remove  
                 
 COMMIT  
GO
/****** Object:  StoredProcedure [dbo].[sp_Tbl_Mst_ScheduleDelete]    Script Date: 18/05/2020 12:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_Tbl_Mst_ScheduleDelete] 
    @Id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	delete Schedule 
	where Id = @Id

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[sp_Tbl_Mst_ScheduleInsert]    Script Date: 18/05/2020 12:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_Tbl_Mst_ScheduleInsert] 
    @Title varchar(200) = NULL,
    @StartDate datetime= NULL,
    @EndDate datetime = NULL,
    @Expiry int = 0,  
    @Description varchar(200) = NULL,
	@Complete int = 0
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO Schedule (title,startdate,enddate,expiry,[description],complete)
	SELECT @Title, @StartDate, @EndDate, (select DATEDIFF(d, @StartDate, @EndDate)),@Description,0
	
	-- Begin Return Select <- do not remove
	SELECT id, Title, startdate, enddate, expiry, [description], complete
	FROM   Schedule
	WHERE  [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[sp_Tbl_Mst_ScheduleSelect]    Script Date: 18/05/2020 12:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[sp_Tbl_Trx_BookSelect] ******/  
CREATE PROC [dbo].[sp_Tbl_Mst_ScheduleSelect]     
    @Id int = null
AS     
 SET NOCOUNT ON     
 SET XACT_ABORT ON      
    
 BEGIN TRAN    
    
 SELECT 
  a.Id, a.Title , a.StartDate , a.EndDate , a.Expiry, a.Description , a.Complete
   from Schedule a
 
   WHERE      
  (a.Id = @Id OR @Id IS NULL)
 COMMIT
GO
/****** Object:  StoredProcedure [dbo].[sp_Tbl_Mst_ScheduleUpdate]    Script Date: 18/05/2020 12:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_Tbl_Mst_ScheduleUpdate]
	@Id int = null,
    @Title varchar(200) = NULL,
    @StartDate datetime= NULL,
    @EndDate datetime = NULL,
    @Expiry int = 0,  
    @Description varchar(200) = NULL,
	@Complete int = 0
	
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE Schedule
	SET     
	title = @Title, 
	startdate = @StartDate, 
	enddate = @EndDate, 
    expiry = (select DATEDIFF(d, @StartDate, @EndDate)), 
	description = @Description, 
	complete = @Complete
	
	WHERE  [Id] = @Id
		
	-- Begin Return Select <- do not remove
	SELECT id,Title,startdate,enddate,expiry,description,complete
	FROM   Schedule
	WHERE  id = @Id	

	COMMIT
GO
USE [master]
GO
ALTER DATABASE [Schedule] SET  READ_WRITE 
GO
