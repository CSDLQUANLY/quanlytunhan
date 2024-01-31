USE [master]
GO
/****** Object:  Database [quan_ly_tu_nhan]    Script Date: 31/01/2024 11:25:42 CH ******/
CREATE DATABASE [quan_ly_tu_nhan]
 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quan_ly_tu_nhan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ARITHABORT OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET  MULTI_USER 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quan_ly_tu_nhan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quan_ly_tu_nhan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quan_ly_tu_nhan] SET QUERY_STORE = ON
GO
ALTER DATABASE [quan_ly_tu_nhan] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quan_ly_tu_nhan]
GO
/****** Object:  Table [dbo].[Crime]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime](
	[crime_id] [varchar](50) NOT NULL,
	[crime_name] [varchar](50) NOT NULL,
	[crime_level] [varchar](10) NULL,
 CONSTRAINT [PK_Crime] PRIMARY KEY CLUSTERED 
(
	[crime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crime_with_Sentence]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime_with_Sentence](
	[crime_id] [varchar](50) NOT NULL,
	[sentence_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Crime_with_Sentence] PRIMARY KEY CLUSTERED 
(
	[crime_id] ASC,
	[sentence_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prison]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prison](
	[prison_id] [varchar](50) NOT NULL,
	[prison_name] [varchar](30) NOT NULL,
	[prison_address] [varchar](50) NULL,
	[prison_capacity] [int] NULL,
	[chief_warden_name] [varchar](40) NULL,
 CONSTRAINT [PK_Prison] PRIMARY KEY CLUSTERED 
(
	[prison_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prison_staff]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prison_staff](
	[prison_staff_id] [varchar](50) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NULL,
	[date_of_birth] [date] NULL,
	[gender] [varchar](10) NULL,
	[position] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Prison_staff] PRIMARY KEY CLUSTERED 
(
	[prison_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prison_with_Prison_staff]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prison_with_Prison_staff](
	[prison_id] [varchar](50) NOT NULL,
	[prison_staff_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prison_with_Prison_staff] PRIMARY KEY CLUSTERED 
(
	[prison_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner](
	[prisoner_id] [varchar](50) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NULL,
	[date_of_birth] [date] NOT NULL,
	[gender] [varchar](4) NULL,
	[cell_room] [varchar](50) NULL,
	[start_day] [date] NULL,
	[end_day] [date] NULL,
 CONSTRAINT [PK_Prisoner] PRIMARY KEY CLUSTERED 
(
	[prisoner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner_with_Crime]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner_with_Crime](
	[prisoner_id] [varchar](50) NOT NULL,
	[crime_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prisoner_with_Crime] PRIMARY KEY CLUSTERED 
(
	[crime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner_with_Prison]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner_with_Prison](
	[prisoner_id] [varchar](50) NOT NULL,
	[prison_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prisoner_with_Prison] PRIMARY KEY CLUSTERED 
(
	[prisoner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relative_of_prisoner]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relative_of_prisoner](
	[prisoner_id] [varchar](50) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NULL,
	[date_of_birth] [date] NULL,
	[gender] [varchar](10) NULL,
	[relationship_with_prisoner] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Relative_of_prisoner] PRIMARY KEY CLUSTERED 
(
	[prisoner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sentence]    Script Date: 31/01/2024 11:25:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sentence](
	[sentence_id] [varchar](50) NOT NULL,
	[sentence_type] [varchar](50) NOT NULL,
	[sentence_time] [varchar](50) NULL,
 CONSTRAINT [PK_Sentence] PRIMARY KEY CLUSTERED 
(
	[sentence_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Crime]  WITH NOCHECK ADD  CONSTRAINT [FK_Crime_Crime] FOREIGN KEY([crime_id])
REFERENCES [dbo].[Crime] ([crime_id])
GO
ALTER TABLE [dbo].[Crime] CHECK CONSTRAINT [FK_Crime_Crime]
GO
ALTER TABLE [dbo].[Crime_with_Sentence]  WITH CHECK ADD  CONSTRAINT [FK_Crime_with_Sentence_Crime_with_Sentence] FOREIGN KEY([crime_id])
REFERENCES [dbo].[Crime] ([crime_id])
GO
ALTER TABLE [dbo].[Crime_with_Sentence] CHECK CONSTRAINT [FK_Crime_with_Sentence_Crime_with_Sentence]
GO
ALTER TABLE [dbo].[Crime_with_Sentence]  WITH CHECK ADD  CONSTRAINT [FK_Crime_with_Sentence_Sentence] FOREIGN KEY([sentence_id])
REFERENCES [dbo].[Sentence] ([sentence_id])
GO
ALTER TABLE [dbo].[Crime_with_Sentence] CHECK CONSTRAINT [FK_Crime_with_Sentence_Sentence]
GO
ALTER TABLE [dbo].[Prison_with_Prison_staff]  WITH CHECK ADD  CONSTRAINT [FK_Prison_with_Prison_staff_Prison] FOREIGN KEY([prison_id])
REFERENCES [dbo].[Prison] ([prison_id])
GO
ALTER TABLE [dbo].[Prison_with_Prison_staff] CHECK CONSTRAINT [FK_Prison_with_Prison_staff_Prison]
GO
ALTER TABLE [dbo].[Prison_with_Prison_staff]  WITH CHECK ADD  CONSTRAINT [FK_Prison_with_Prison_staff_Prison_with_Prison_staff] FOREIGN KEY([prison_staff_id])
REFERENCES [dbo].[Prison_staff] ([prison_staff_id])
GO
ALTER TABLE [dbo].[Prison_with_Prison_staff] CHECK CONSTRAINT [FK_Prison_with_Prison_staff_Prison_with_Prison_staff]
GO
ALTER TABLE [dbo].[Prisoner_with_Crime]  WITH CHECK ADD  CONSTRAINT [FK_Prisoner_with_Crime_Crime] FOREIGN KEY([crime_id])
REFERENCES [dbo].[Crime] ([crime_id])
GO
ALTER TABLE [dbo].[Prisoner_with_Crime] CHECK CONSTRAINT [FK_Prisoner_with_Crime_Crime]
GO
ALTER TABLE [dbo].[Prisoner_with_Crime]  WITH CHECK ADD  CONSTRAINT [FK_Prisoner_with_Crime_Prison] FOREIGN KEY([prisoner_id])
REFERENCES [dbo].[Prison] ([prison_id])
GO
ALTER TABLE [dbo].[Prisoner_with_Crime] CHECK CONSTRAINT [FK_Prisoner_with_Crime_Prison]
GO
ALTER TABLE [dbo].[Prisoner_with_Prison]  WITH CHECK ADD  CONSTRAINT [FK_Prisoner_with_Prison_Prison] FOREIGN KEY([prison_id])
REFERENCES [dbo].[Prison] ([prison_id])
GO
ALTER TABLE [dbo].[Prisoner_with_Prison] CHECK CONSTRAINT [FK_Prisoner_with_Prison_Prison]
GO
ALTER TABLE [dbo].[Prisoner_with_Prison]  WITH CHECK ADD  CONSTRAINT [FK_Prisoner_with_Prison_Prisoner] FOREIGN KEY([prisoner_id])
REFERENCES [dbo].[Prisoner] ([prisoner_id])
GO
ALTER TABLE [dbo].[Prisoner_with_Prison] CHECK CONSTRAINT [FK_Prisoner_with_Prison_Prisoner]
GO
ALTER TABLE [dbo].[Relative_of_prisoner]  WITH CHECK ADD  CONSTRAINT [FK_Relative_of_prisoner_Prisoner] FOREIGN KEY([prisoner_id])
REFERENCES [dbo].[Prisoner] ([prisoner_id])
GO
ALTER TABLE [dbo].[Relative_of_prisoner] CHECK CONSTRAINT [FK_Relative_of_prisoner_Prisoner]
GO
USE [master]
GO
ALTER DATABASE [quan_ly_tu_nhan] SET  READ_WRITE 
GO
