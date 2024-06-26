USE [master]
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
/****** Object:  Table [dbo].[Crime]    Script Date: 4/2/2024 7:56:13 AM ******/
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
/****** Object:  Table [dbo].[Prison]    Script Date: 4/2/2024 7:56:13 AM ******/
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
/****** Object:  Table [dbo].[Prison_staff]    Script Date: 4/2/2024 7:56:13 AM ******/
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
/****** Object:  Table [dbo].[Prison_with_Prison_staff]    Script Date: 4/2/2024 7:56:13 AM ******/
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
/****** Object:  Table [dbo].[Prisoner]    Script Date: 4/2/2024 7:56:13 AM ******/
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
	[work] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prisoner] PRIMARY KEY CLUSTERED 
(
	[prisoner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner_with_Crime]    Script Date: 4/2/2024 7:56:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner_with_Crime](
	[prisoner_id] [varchar](50) NOT NULL,
	[crime_id] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner_with_Prison]    Script Date: 4/2/2024 7:56:13 AM ******/
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
/****** Object:  Table [dbo].[Relative_of_prisoner]    Script Date: 4/2/2024 7:56:13 AM ******/
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
	[relationship_with_prisoner] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'01', N'Cuop giat tai san', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'02', N'Cuop giat tai san', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'03', N'Cuop giat tai san', N'3')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'04', N'Cuop giat tai san', N'4')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'05', N'Hiep dam', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'06', N'Hiep dam', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'07', N'Hiep dam', N'3')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'08', N'Giet nguoi (tinh than bi kich dong)', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'09', N'Giet nguoi (tinh than bi kich dong)', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'10', N'Giet nguoi', N'3')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'11', N'Giet nguoi', N'4')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'12', N'Giet nguoi (vuot qua gioi han phong ve chinh dang)', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'13', N'Giet nguoi (vuot qua gio han phong ve chinh dang)', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'14', N'Giet hoac vut bo con moi de', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'15', N'Giet hoac vut bo con moi de', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'16', N'Mua ban trai phep chat ma tuy', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'17', N'Mua ban trai phep chat ma tuy', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'18', N'Mua ban trai phep chat ma tuy', N'3')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'19', N'Mua ban trai phep chat ma tuy', N'4')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'20', N'Tang tru vu khi', N'1')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'21', N'Tang tru vu khi', N'2')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'22', N'Tang tru vu khi', N'3')
INSERT [dbo].[Crime] ([crime_id], [crime_name], [crime_level]) VALUES (N'23', N'Tang tru vu khi', N'4')
GO
INSERT [dbo].[Prison] ([prison_id], [prison_name], [prison_address], [prison_capacity], [chief_warden_name]) VALUES (N'1', N'Azure Dragon', N'Ha Noi city', 10000, N'Nguyen Van Hoan')
INSERT [dbo].[Prison] ([prison_id], [prison_name], [prison_address], [prison_capacity], [chief_warden_name]) VALUES (N'2', N'White Tiger', N'Bac Ninh city', 9000, N'Ngo Van Quang')
INSERT [dbo].[Prison] ([prison_id], [prison_name], [prison_address], [prison_capacity], [chief_warden_name]) VALUES (N'3', N'Vermilion Bird', N'Da Nang city', 8500, N'Pham Hoang Viet')
INSERT [dbo].[Prison] ([prison_id], [prison_name], [prison_address], [prison_capacity], [chief_warden_name]) VALUES (N'4', N'Black Tortoise', N'Ho Chi Minh city', 9500, N'Dang Quoc Nam')
GO
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'01', N'Le Xuan', N'An', CAST(N'1980-12-11' AS Date), N'Nam', N'Giam thi')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'02', N'Nguyen Mai', N'Anh', CAST(N'1985-09-02' AS Date), N'Nu', N'Pho giam thi')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'03', N'Le Ngoc', N'Anh', CAST(N'1983-03-30' AS Date), N'Nu', N'Truong phan trai')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'04', N'Phan Quoc', N'Bao', CAST(N'1981-03-02' AS Date), N'Nam', N'Pho truong phan trai')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'05', N'Vu Manh', N'Bao', CAST(N'1982-12-22' AS Date), N'Nam', N'Doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'06', N'Nguyen Thi', N'Bich', CAST(N'1986-12-19' AS Date), N'Nu', N'Pho doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'07', N'Nguyen Hung', N'Cuong', CAST(N'1987-04-02' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'08', N'Nguyen Duc', N'Dung', CAST(N'1984-02-17' AS Date), N'Nam', N'Quan nhan chuyen nghiep')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'09', N'Nguyen Thai', N'Duong', CAST(N'1989-09-01' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'10', N'Tran Xuan', N'Dat', CAST(N'1994-02-14' AS Date), N'Nam', N'Chien si cong an')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'11', N'Truong Quang', N'Dong', CAST(N'1995-09-02' AS Date), N'Nam', N'Cong nhan vien Quoc phong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'12', N'Nguyen Minh', N'Duc', CAST(N'1983-02-17' AS Date), N'Nam', N'Truong phan trai')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'13', N'Giang Duc', N'Hai', CAST(N'1979-01-07' AS Date), N'Nam', N'Pho truong phan trai')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'14', N'Tran Minh', N'Hieu', CAST(N'1982-12-16' AS Date), N'Nam', N'Doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'15', N'Do Duy', N'Huan', CAST(N'1984-11-08' AS Date), N'Nam', N'Pho doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'16', N'Bui Quang', N'Huy', CAST(N'1987-11-27' AS Date), N'Nam', N'Doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'17', N'Le Duc', N'Khanh', CAST(N'1988-08-23' AS Date), N'Nam', N'Pho doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'18', N'Le Trung', N'Kien', CAST(N'1979-09-06' AS Date), N'Nam', N'Doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'19', N'Hoang', N'Lam', CAST(N'1978-06-18' AS Date), N'Nam', N'Pho doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'20', N'Le Quang', N'Long', CAST(N'1983-05-09' AS Date), N'Nam', N'Doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'21', N'Truong Xuan', N'Loc', CAST(N'1984-04-07' AS Date), N'Nam', N'Pho doi truong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'22', N'Pham Duy', N'Loi', CAST(N'1986-07-03' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'23', N'Nguyen Hong', N'Minh', CAST(N'1987-08-06' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'24', N'Vu Hai', N'Nam', CAST(N'1989-09-30' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'25', N'Tran The', N'Phong', CAST(N'1989-08-28' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'26', N'Ha Viet', N'Quang', CAST(N'1990-11-07' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'27', N'Nguyen Minh', N'Quan', CAST(N'1992-08-19' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'28', N'Nguyen Anh', N'Tay', CAST(N'1992-07-10' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'29', N'Le Tran', N'Thuan', CAST(N'1991-08-10' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'30', N'Le Anh', N'Tuan', CAST(N'1993-10-07' AS Date), N'Nam', N'Si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'31', N'Bui Quang', N'Tung', CAST(N'1994-04-07' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'32', N'Ly Tran', N'Vinh', CAST(N'1995-10-08' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'33', N'Nguyen Duc', N'Vuong', CAST(N'1994-08-01' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'34', N'Le Trong', N'Chinh', CAST(N'1995-02-08' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'35', N'Mai Viet', N'Hung', CAST(N'1997-01-09' AS Date), N'Nam', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'36', N'Bui Phuong', N'Linh', CAST(N'1996-11-19' AS Date), N'Nu', N'Ha si quan')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'37', N'Dao Vu', N'Khanh', CAST(N'1993-11-08' AS Date), N'Nam', N'Chien si cong an')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'38', N'Tran Cong', N'Minh', CAST(N'1994-03-20' AS Date), N'Nam', N'Chien si cong an')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'39', N'Nguyen Duc', N'Son', CAST(N'1996-11-08' AS Date), N'Nam', N'Cong nhan vien Quoc phong')
INSERT [dbo].[Prison_staff] ([prison_staff_id], [first_name], [last_name], [date_of_birth], [gender], [position]) VALUES (N'40', N'Nguyen An', N'Thach', CAST(N'1997-08-17' AS Date), N'Nam', N'Cong nhan vien Quoc phong')
GO
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'01')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'02')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'03')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'04')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'05')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'06')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'07')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'08')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'09')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'10')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'11')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'12')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'13')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'14')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'15')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'16')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'17')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'18')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'19')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'20')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'21')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'22')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'23')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'24')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'1', N'25')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'26')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'27')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'28')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'29')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'2', N'30')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'31')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'32')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'33')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'34')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'3', N'35')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'36')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'37')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'38')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'39')
INSERT [dbo].[Prison_with_Prison_staff] ([prison_id], [prison_staff_id]) VALUES (N'4', N'40')
GO
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'01', N'Do Thi', N'Anh', CAST(N'1980-01-22' AS Date), N'Nu', N'04', CAST(N'2010-01-19' AS Date), CAST(N'2020-09-21' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'02', N'Pham Thi', N'Anh', CAST(N'1991-04-20' AS Date), N'Nu', N'04', CAST(N'2011-11-01' AS Date), CAST(N'2013-10-11' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'03', N'Do Thi Quynh', N'Anh', CAST(N'1989-02-22' AS Date), N'Nam', N'03', CAST(N'2010-01-19' AS Date), CAST(N'2020-09-21' AS Date), N'May Va', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'04', N'Tran Kim', N'Anh', CAST(N'1998-04-20' AS Date), N'Nu', N'02', CAST(N'2015-10-01' AS Date), CAST(N'2019-10-21' AS Date), N'Dan Theu', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'05', N'Vu Tuan', N'Anh', CAST(N'1999-11-01' AS Date), N'Nam', N'02', CAST(N'2020-01-01' AS Date), CAST(N'2022-10-21' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'06', N'Nguyen Van', N'Binh', CAST(N'1980-03-11' AS Date), N'Nam', N'04', CAST(N'2000-01-01' AS Date), CAST(N'2000-01-21' AS Date), N'Trong trot', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'07', N'Vu Van Ha', N'Chung', CAST(N'1997-01-30' AS Date), N'Nam', N'03', CAST(N'2018-10-02' AS Date), CAST(N'2022-10-01' AS Date), N'Trong trot', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'08', N'Pham Tien', N'Dung', CAST(N'1988-04-22' AS Date), N'Nam', N'06', CAST(N'2005-01-01' AS Date), CAST(N'2009-10-01' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'09', N'Tran Thai', N'Duong', CAST(N'2000-09-01' AS Date), N'Nam', N'04', CAST(N'2021-11-30' AS Date), CAST(N'2026-08-30' AS Date), N'Chan nuoi', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'10', N'Tran Thuy', N'Duong', CAST(N'2004-02-19' AS Date), N'Nu', N'02', CAST(N'2022-11-20' AS Date), CAST(N'2024-01-22' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'11', N'Doan Tien', N'Dat', CAST(N'1995-03-12' AS Date), N'Nam', N'05', CAST(N'2017-12-09' AS Date), CAST(N'2022-09-29' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'12', N'Nguyen Hong', N'Dat', CAST(N'1980-03-11' AS Date), N'Nam', N'01', CAST(N'2000-01-01' AS Date), CAST(N'2000-01-21' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'13', N'Nguyen Tran Hai', N'Dang', CAST(N'1981-03-29' AS Date), N'Nam', N'07', CAST(N'2000-12-03' AS Date), CAST(N'2004-01-22' AS Date), N'May Va', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'14', N'Dang Quoc', N'Nam', CAST(N'2004-03-20' AS Date), N'Nam', N'03', CAST(N'2018-10-09' AS Date), CAST(N'2022-08-01' AS Date), N'May Va', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'15', N'Nguyen Van', N'Nam', CAST(N'1980-03-11' AS Date), N'Nam', N'01', CAST(N'2000-01-01' AS Date), CAST(N'2000-01-21' AS Date), N'May Va', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'16', N'Nguyen Van', N'Quan', CAST(N'1980-03-11' AS Date), N'Nam', N'02', CAST(N'2000-01-01' AS Date), CAST(N'2000-01-21' AS Date), N'May Va', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'17', N'Nguyen Ngoc', N'Hoang', CAST(N'2001-01-30' AS Date), N'Nam', N'03', CAST(N'2020-09-13' AS Date), CAST(N'2022-08-30' AS Date), N'May Va', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'18', N'Vuong Duc', N'Hung', CAST(N'1987-08-20' AS Date), N'Nam', N'06', CAST(N'2009-11-29' AS Date), CAST(N'2013-11-29' AS Date), N'May Va', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'19', N'Pham Tran', N'Hieu', CAST(N'2005-11-22' AS Date), N'Nam', N'05', CAST(N'2024-01-11' AS Date), CAST(N'2028-03-21' AS Date), N'May Va', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'20', N'Nguyen Duy', N'hung', CAST(N'2002-01-06' AS Date), N'Nam', N'04', CAST(N'2022-09-21' AS Date), CAST(N'2023-09-30' AS Date), N'Dan Theu', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'21', N'Nguyen Cong', N'Huong', CAST(N'1979-08-25' AS Date), N'Nam', N'07', CAST(N'2006-08-02' AS Date), CAST(N'2009-08-22' AS Date), N'Dan Theu', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'22', N'Kieu Quang', N'Khanh', CAST(N'1999-01-22' AS Date), N'Nam', N'02', CAST(N'2020-12-11' AS Date), CAST(N'2023-12-22' AS Date), N'Dan Theu', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'23', N'Nguyen Quoc', N'Khanh', CAST(N'1990-11-30' AS Date), N'Nam', N'05', CAST(N'2021-04-01' AS Date), CAST(N'2023-04-21' AS Date), N'Dan Theu', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'24', N'Le Trung', N'Kien', CAST(N'2004-09-22' AS Date), N'Nam', N'01', CAST(N'2024-01-23' AS Date), CAST(N'2027-03-30' AS Date), N'Dan Theu', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'25', N'Phan Thi', N'Kieu', CAST(N'1980-03-11' AS Date), N'Nu', N'04', CAST(N'2000-01-01' AS Date), CAST(N'2008-01-21' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'26', N'Le Tien', N'Thanh', CAST(N'1996-12-21' AS Date), N'Nam', N'07', CAST(N'2019-12-21' AS Date), CAST(N'2020-01-21' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'27', N'Do Anh', N'Thu', CAST(N'2001-09-22' AS Date), N'Nu', N'03', CAST(N'2022-08-01' AS Date), CAST(N'2023-08-21' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'28', N'Tran Hoc', N'Tien', CAST(N'1999-01-11' AS Date), N'Nam', N'02', CAST(N'2020-02-08' AS Date), CAST(N'2022-02-08' AS Date), N'Trong trot', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'29', N'Le Dang', N'Son', CAST(N'2004-01-21' AS Date), N'Nam', N'05', CAST(N'2024-01-10' AS Date), CAST(N'2026-01-10' AS Date), N'Trong trot', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'30', N'Tran Thi', N'Thanh', CAST(N'1991-07-25' AS Date), N'Nu', N'04', CAST(N'2022-09-01' AS Date), CAST(N'2024-01-09' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'31', N'Nguyen Van', N'Tam', CAST(N'1980-03-11' AS Date), N'Nam', N'01', CAST(N'2000-01-01' AS Date), CAST(N'2005-01-21' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'32', N'Vang Vu', N'Trang', CAST(N'2003-01-21' AS Date), N'Nu', N'04', CAST(N'2023-02-22' AS Date), CAST(N'2025-09-23' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'33', N'Dao Trieu', N'Tu', CAST(N'2002-08-12' AS Date), N'Nam', N'06', CAST(N'2022-09-24' AS Date), CAST(N'2024-01-22' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'34', N'Nguyen Van', N'Vinh', CAST(N'1980-03-11' AS Date), N'Nam', N'05', CAST(N'2007-09-01' AS Date), CAST(N'2010-09-10' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'35', N'Mai Duc', N'Vinh', CAST(N'1997-01-04' AS Date), N'Nam', N'02', CAST(N'2020-09-11' AS Date), CAST(N'2024-10-21' AS Date), N'Chan nuoi', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'36', N'Nguyen Nhat', N'Vu', CAST(N'1970-01-11' AS Date), N'Nam', N'07', CAST(N'2000-01-01' AS Date), CAST(N'2005-01-27' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'37', N'Pham Viet', N'Nam', CAST(N'1994-09-23' AS Date), N'Nam', N'06', CAST(N'2017-09-17' AS Date), CAST(N'2020-01-21' AS Date), N'Chan nuoi', N'Xau')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'38', N'Nguyen Tien', N'Quan', CAST(N'1999-02-22' AS Date), N'Nam', N'05', CAST(N'2022-01-10' AS Date), CAST(N'2023-05-29' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'39', N'Nguyen Van', N'Viet', CAST(N'2001-09-19' AS Date), N'Nam', N'06', CAST(N'2022-09-01' AS Date), CAST(N'2023-09-01' AS Date), N'Chan nuoi', N'Tot')
INSERT [dbo].[Prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [cell_room], [start_day], [end_day], [work], [status]) VALUES (N'40', N'Duong Minh', N'Tuyen', CAST(N'1978-01-03' AS Date), N'Nam', N'07', CAST(N'2000-01-01' AS Date), CAST(N'2006-09-11' AS Date), N'Chan nuoi', N'Tot')
GO
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'01', N'01')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'02', N'02')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'03', N'03')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'04', N'04')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'05', N'05')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'06', N'06')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'07', N'02')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'08', N'07')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'09', N'04')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'10', N'08')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'11', N'09')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'12', N'10')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'13', N'06')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'14', N'11')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'15', N'12')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'16', N'13')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'17', N'14')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'18', N'15')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'19', N'07')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'20', N'03')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'21', N'05')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'22', N'01')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'23', N'08')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'24', N'16')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'25', N'17')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'26', N'18')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'27', N'19')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'28', N'20')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'29', N'21')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'30', N'22')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'31', N'23')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'32', N'11')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'33', N'12')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'34', N'15')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'34', N'18')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'35', N'19')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'36', N'14')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'37', N'09')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'38', N'10')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'39', N'11')
INSERT [dbo].[Prisoner_with_Crime] ([prisoner_id], [crime_id]) VALUES (N'40', N'22')
GO
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'01', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'02', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'03', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'04', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'05', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'06', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'07', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'08', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'09', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'10', N'1')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'11', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'12', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'13', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'14', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'15', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'16', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'17', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'18', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'19', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'20', N'2')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'21', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'22', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'23', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'24', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'25', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'26', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'27', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'28', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'29', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'30', N'3')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'31', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'32', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'33', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'34', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'35', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'36', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'37', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'38', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'39', N'4')
INSERT [dbo].[Prisoner_with_Prison] ([prisoner_id], [prison_id]) VALUES (N'40', N'4')
GO
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'01', N'An', N'Hoang Trong', CAST(N'1999-12-13' AS Date), N'male', N'Brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'01', N'An', N'Nguyen Van', CAST(N'1980-04-28' AS Date), N'male', N'Uncle')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'02', N'An', N'Pham Thanh', CAST(N'2000-03-24' AS Date), N'male', N'Step brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'03', N'Anh', N'Bui Tuan', CAST(N'1990-03-14' AS Date), N'male', N'Father')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'04', N'Anh', N'Le Thi', CAST(N'2000-02-29' AS Date), N'female', N'Wife')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'05', N'Anh', N'Nguyen Dac', CAST(N'1800-01-10' AS Date), N'male', N'GrandFather')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'06', N'Anh', N'Vu Duc', CAST(N'1990-01-12' AS Date), N'male', N'Husband')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'07', N'Anh', N'Nguyen Thi', CAST(N'1998-08-29' AS Date), N'female', N'Aunt')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'08', N'Chi', N'Trieu Linh', CAST(N'1965-02-14' AS Date), N'male', N'GrandMother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'09', N'Chung', N'Le Tien', CAST(N'2004-12-26' AS Date), N'male', N'LittleBrother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'10', N'Doanh', N'Mai Xuan', CAST(N'2010-04-28' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'10', N'Dung', N'Tran Van', CAST(N'1977-09-08' AS Date), N'male', N'StepFather')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'11', N'Dung', N'Bui Quoc', CAST(N'2004-08-01' AS Date), N'male', N'Brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'12', N'Dung', N'Nguyen Van', CAST(N'1990-10-26' AS Date), N'male', N'Uncle')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'13', N'Duy', N'Pham Duc', CAST(N'2004-02-20' AS Date), N'male', N'StepLittleBrother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'14', N'Dang', N'Tran Hai', CAST(N'1990-11-28' AS Date), N'male', N'Uncle')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'15', N'Dang', N'Tran Hai', CAST(N'1980-10-04' AS Date), N'male', N'Father')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'16', N'Dinh', N'Nguyen The', CAST(N'2004-05-18' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'17', N'Doan', N'Nguyen Van', CAST(N'1990-10-28' AS Date), N'male', N'Brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'18', N'Hai', N'Bui Nam', CAST(N'2004-07-18' AS Date), N'male', N'LittleBrother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'19', N'Hai', N'Nguyen Phan', CAST(N'1900-02-19' AS Date), N'male', N'GrandFather')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'20', N'Hai', N'Nguyen Van', CAST(N'2010-08-08' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'21', N'Hai', N'Tran Duc', CAST(N'1989-02-03' AS Date), N'male', N'Father')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'21', N'Hau', N'Nguyen Van', CAST(N'1987-01-10' AS Date), N'male', N'Uncle')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'22', N'Hieu', N'Cao Trung', CAST(N'2010-10-11' AS Date), N'male', N'GrandChildren')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'23', N'Anh', N'Nguyen Ngoc', CAST(N'2000-12-14' AS Date), N'female', N'Sister')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'24', N'Linh', N'Nguyen Phuong', CAST(N'1960-01-17' AS Date), N'female', N'GrandMother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'25', N'Nam', N'Nguyen Phuong', CAST(N'2010-05-31' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'26', N'Duyen', N'Mai Thi', CAST(N'2000-04-21' AS Date), N'female', N'Wife')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'27', N'Chau', N'Pham Thi', CAST(N'2012-03-09' AS Date), N'female', N'Daughter')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'28', N'Thuy', N'Nguyen Thu', CAST(N'2022-12-04' AS Date), N'female', N'LittleSister')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'29', N'Thu', N'Dang Thi', CAST(N'1999-12-04' AS Date), N'female', N'Aunt')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'30', N'Yen', N'Pham Hai', CAST(N'2004-06-13' AS Date), N'female', N'StepSister')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'31', N'Anh', N'Tran Thi Ngoc', CAST(N'1989-11-18' AS Date), N'female', N'Mother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'32', N'Phuc', N'Mai Duc', CAST(N'2004-11-25' AS Date), N'male', N'Husband')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'33', N'Quynh', N'Pham Thi', CAST(N'1960-08-20' AS Date), N'male', N'GrandMother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'34', N'Hieu', N'Dao Duc', CAST(N'2000-12-03' AS Date), N'male', N'Uncle')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'35', N'Hieu', N'Nguyen Minh', CAST(N'1990-11-16' AS Date), N'male', N'Brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'36', N'Hoang', N'Duong Minh', CAST(N'2004-03-22' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'37', N'Hung', N'Nguyen Manh', CAST(N'1999-01-04' AS Date), N'male', N'Brother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'38', N'Huy', N'Phi Gia', CAST(N'2010-02-13' AS Date), N'male', N'Son')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'39', N'Huy', N'Pham Xuan', CAST(N'1989-09-25' AS Date), N'male', N'Father')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'40', N'Huyen', N'Le Thanh', CAST(N'1980-03-16' AS Date), N'female', N'Mother')
INSERT [dbo].[Relative_of_prisoner] ([prisoner_id], [first_name], [last_name], [date_of_birth], [gender], [relationship_with_prisoner]) VALUES (N'40', N'Huy', N'Ta Gia', CAST(N'1979-11-17' AS Date), N'male', N'Father')
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
REFERENCES [dbo].[Prisoner] ([prisoner_id])
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
ALTER TABLE [dbo].[Relative_of_prisoner]  WITH CHECK ADD  CONSTRAINT [FK_Relative_of_prisoner_Prisoner1] FOREIGN KEY([prisoner_id])
REFERENCES [dbo].[Prisoner] ([prisoner_id])
GO
ALTER TABLE [dbo].[Relative_of_prisoner] CHECK CONSTRAINT [FK_Relative_of_prisoner_Prisoner1]
GO
USE [master]
GO
ALTER DATABASE [quan_ly_tu_nhan] SET  READ_WRITE 
GO
