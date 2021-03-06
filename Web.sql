USE [master]
GO
/****** Object:  Database [shoestoreproject]    Script Date: 12/10/2020 12:51:57 PM ******/
CREATE DATABASE [shoestoreproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoestoreproject', FILENAME = N'c:\databases\shoestoreproject\shoestoreproject.mdf' , SIZE = 8192KB , MAXSIZE = 20971520KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'shoestoreproject_log', FILENAME = N'c:\databases\shoestoreproject\shoestoreproject_log.ldf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shoestoreproject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoestoreproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoestoreproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoestoreproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoestoreproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoestoreproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoestoreproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoestoreproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoestoreproject] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [shoestoreproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoestoreproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoestoreproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoestoreproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoestoreproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoestoreproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoestoreproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoestoreproject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shoestoreproject] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [shoestoreproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoestoreproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoestoreproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoestoreproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoestoreproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoestoreproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoestoreproject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoestoreproject] SET  MULTI_USER 
GO
ALTER DATABASE [shoestoreproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoestoreproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoestoreproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoestoreproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoestoreproject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'shoestoreproject', N'ON'
GO
ALTER DATABASE [shoestoreproject] SET QUERY_STORE = OFF
GO
USE [shoestoreproject]
GO
/****** Object:  Table [dbo].[ChiTietOrder]    Script Date: 12/10/2020 12:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietOrder](
	[MaSP] [int] NOT NULL,
	[Order_ID] [bigint] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [float] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_ChiTietOrder] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/10/2020 12:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KH_ID] [int] IDENTITY(1,199901) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DoB] [datetime] NULL,
	[SoDT] [nvarchar](11) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[KH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 12/10/2020 12:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/10/2020 12:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[KH_ID] [int] NULL,
	[SoDT_Ship] [nvarchar](11) NULL,
	[DiaChi_Ship] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
	[TenKH_Ship] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/10/2020 12:52:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1301) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[Gia] [float] NOT NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](4000) NULL,
	[Anh] [nvarchar](1000) NOT NULL,
	[MaLoai] [int] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (1302, 1, 1, 150, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (1302, 2, 5, 150, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (1302, 5, 5, 750, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (1302, 6, 1, 150, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (2603, 4, 1, 180, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (5205, 2, 5, 200, NULL)
INSERT [dbo].[ChiTietOrder] ([MaSP], [Order_ID], [SoLuong], [Gia], [TongTien]) VALUES (7807, 5, 5, 5500, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([KH_ID], [Username], [MatKhau], [TenKH], [Email], [DoB], [SoDT], [DiaChi]) VALUES (1, N'nguyenthanhloc', N'6e490198845882bdb156e95cfd0dd80b', N'Nguyễn Thành Lộc', N'nguyenthanhloc1308@gmail.com', CAST(N'1999-08-13T00:00:00.000' AS DateTime), N'0774784101', N'Quận 12')
INSERT [dbo].[KhachHang] ([KH_ID], [Username], [MatKhau], [TenKH], [Email], [DoB], [SoDT], [DiaChi]) VALUES (199902, N'thanhloc', N'a8c319940f1c4a5312264fe79d9c8c16', N'Nguyễn Thành Lộc', N'nguyenthanhloc0813@gmail.com', CAST(N'1999-08-13T00:00:00.000' AS DateTime), N'0774784101', N'Quận 12')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (100, N'Adidas Ultraboost')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (101, N'Adidas Yeezy')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (200, N'Nike Air Jordan')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (201, N'Nike Air Force')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (202, N'Nike Air Max')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (300, N'Converse')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (400, N'Fila')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (500, N'Reebok')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (1, CAST(N'2020-12-10T12:04:46.180' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (2, CAST(N'2020-12-10T12:09:17.307' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (3, CAST(N'2020-12-10T12:12:54.157' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (4, CAST(N'2020-12-10T12:13:26.210' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (5, CAST(N'2020-12-10T12:24:07.383' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
INSERT [dbo].[Order] ([ID], [NgayTao], [KH_ID], [SoDT_Ship], [DiaChi_Ship], [TrangThai], [TenKH_Ship]) VALUES (6, CAST(N'2020-12-10T12:34:27.810' AS DateTime), NULL, N'0774784101', N'Quận 12', NULL, N'Nguyễn Thành Lộc')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (1302, N'ULTRA BOOST 4.0', 150, 13, N'Adidas Ultra Boost 4.0 Running White', N'https://stockx-360.imgix.net//Adidas-Ultra-Boost-4-0-Running-White/Images/Adidas-Ultra-Boost-4-0-Running-White/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 100)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (2603, N'JORDAN 1 CHICAGO', 180, 19, N'Jordan 1 Retro High Off-White Chicago', N'https://stockx-360.imgix.net//Air-Jordan-1-Retro-High-Off-White-Chicago/Images/Air-Jordan-1-Retro-High-Off-White-Chicago/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (3904, N'YEEZY BOOST 350', 450, 9, N'Adidas Yeezy 350 V2 Zebra', N'https://stockx-360.imgix.net//Adidas-Yeezy-Boost-350-V2-Zebra/Images/Adidas-Yeezy-Boost-350-V2-Zebra/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 101)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (5205, N'AIR FORCE 1 WHITE', 200, 8, N'Nike Air Force 1 Low Swoosh Pack All-Star 2018', N'https://stockx-360.imgix.net//Nike-Air-Force-1-Low-Supreme-Box-Logo-White/Images/Nike-Air-Force-1-Low-Supreme-Box-Logo-White/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 201)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (6506, N'NIKE AIR MAX 97', 240, 32, N'Nike Air Max 97 Silver Bullet (2016/2017)', N'https://stockx-360.imgix.net//Nike-Air-Max-97-Silver-Bullet-2016/Images/Nike-Air-Max-97-Silver-Bullet-2016/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1568300033&w=1000', 202)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (7807, N'AIR JORDAN 1 HIGH GOLD TOP 3
', 1100, 2, N'Jordan 1 Retro High Gold Top 3', N'https://stockx-360.imgix.net//Air-Jordan-1-Retro-High-Gold-Top-3/Images/Air-Jordan-1-Retro-High-Gold-Top-3/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1559089950&w=1000', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (9108, N'CONVERSE CHUCK TAYLOR', 175, 12, N'Converse Chuck Taylor All-Star 70s Hi Comme des Garcons PLAY Black', N'https://stockx-360.imgix.net//Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-Des-Garcons-PLAY-Black/Images/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-Des-Garcons-PLAY-Black/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 300)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (10409, N'CONVERSE CHUCK TAYLOR', 297, 3, N'Converse Chuck Taylor All-Star 70s Hi Fear Of God Black Natural', N'https://stockx-360.imgix.net//Converse-Chuck-Taylor-All-Star-70s-Hi-Fear-Of-God-Black-Natural/Images/Converse-Chuck-Taylor-All-Star-70s-Hi-Fear-Of-God-Black-Natural/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 300)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (11710, N'JORDAN 1 RETRO HIGH', 475, 4, N'Jordan 1 Retro High Royal Toe', N'https://stockx-360.imgix.net//Air-Jordan-1-Retro-High-Black-Game-Royal-Toe/Images/Air-Jordan-1-Retro-High-Black-Game-Royal-Toe/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (13011, N'JORDAN 1 RETRO HIGH DIOR', 8950, 2, N'Jordan 1 Retro High Dior', N'https://stockx-360.imgix.net//Air-Jordan-1-Retro-High-Dior/Images/Air-Jordan-1-Retro-High-Dior/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (14312, N'JORDAN 11 RETRO ', 375, 10, N'Jordan 11 Retro Playoffs Bred (2019)', N'https://stockx-360.imgix.net//Air-Jordan-11-Retro-Playoffs-2019/Images/Air-Jordan-11-Retro-Playoffs-2019/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (15613, N'FILA DISRIPTOR 2', 44, 23, N'Fila Disruptor 2 White Navy Red (W)', N'https://stockx-360.imgix.net//Fila-Disruptor-2-White-Navy-Red-W/Images/Fila-Disruptor-2-White-Navy-Red-W/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 400)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (16914, N'REEBOK INSTAPUMP', 529, 4, N'Reebok Instapump Fury Bait x Toy Story Woody and Buzz', N'https://stockx-360.imgix.net//Reebok-Instapump-Fury-Bait-x-Toy-Story-Woody/Images/Reebok-Instapump-Fury-Bait-x-Toy-Story-Woody/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 500)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (18215, N'ADIDAS YEEZY BOOST 700', 715, 5, N'Adidas Yeezy Boost 700 Wave Runner Solid Grey', N'https://stockx-360.imgix.net//Adidas-Yeezy-Wave-Runner-700-Solid-Grey/Images/Adidas-Yeezy-Wave-Runner-700-Solid-Grey/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 101)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (19516, N'NUULTRA BOOST 3.0LL', 265, 5, N'Adidas Ultra Boost Tech Ink Glow Blue', N'https://stockx-360.imgix.net//adidas-Ultra-Boost-Tech-Ink-Glow-Blue/Images/adidas-Ultra-Boost-Tech-Ink-Glow-Blue/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 100)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [SoLuong], [MoTa], [Anh], [MaLoai]) VALUES (20817, N'ADIDAS YEEZY BOOST 350', 735, 3, N'Adidas Yeezy Boost 350 V2 Beluga 2.0', N'https://stockx-360.imgix.net//Adidas-Yeezy-Boost-350-V2-Beluga-2pt0/Images/Adidas-Yeezy-Boost-350-V2-Beluga-2pt0/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1603481985&w=1000', 101)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
USE [master]
GO
ALTER DATABASE [shoestoreproject] SET  READ_WRITE 
GO
