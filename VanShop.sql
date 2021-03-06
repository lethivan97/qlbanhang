USE [master]
GO
/****** Object:  Database [VanShop]    Script Date: 2018-04-11 9:09:21 PM ******/
CREATE DATABASE [VanShop]
ALTER DATABASE [VanShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VanShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VanShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VanShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VanShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VanShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VanShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [VanShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VanShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VanShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VanShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VanShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VanShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VanShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VanShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VanShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VanShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VanShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VanShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VanShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VanShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VanShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VanShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VanShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VanShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VanShop] SET  MULTI_USER 
GO
ALTER DATABASE [VanShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VanShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VanShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VanShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VanShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VanShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL DEFAULT (''),
	[Address] [nvarchar](max) NOT NULL DEFAULT (''),
	[Avatar] [nvarchar](max) NULL,
	[BirthOfDate] [datetime] NULL,
	[DateRegister] [datetime] NULL,
	[LastAccess] [datetime] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatHang](
	[DatHangID] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[DienThoai] [varchar](15) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [nvarchar](150) NULL,
	[NgayDat] [datetime] NOT NULL CONSTRAINT [DF_DatHang_NgayDat]  DEFAULT (getdate()),
	[TriGia] [int] NOT NULL CONSTRAINT [DF_DatHang_TriGia]  DEFAULT ((0)),
	[DaGiao] [bit] NOT NULL CONSTRAINT [DF_DatHang_DaGiao]  DEFAULT ((0)),
	[NgayGiao] [datetime] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_DatHang_1] PRIMARY KEY CLUSTERED 
(
	[DatHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatHangCT]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHangCT](
	[DatHangID] [int] NOT NULL,
	[SanPhamID] [int] NOT NULL,
	[SoLuong] [int] NOT NULL CONSTRAINT [DF_DatHangCT_SoLuong]  DEFAULT ((0)),
	[DonGia] [int] NOT NULL CONSTRAINT [DF_DatHangCT_DonGia]  DEFAULT ((0)),
	[ThanhTien] [int] NOT NULL CONSTRAINT [DF_DatHangCT_ThanhTien]  DEFAULT ((0)),
 CONSTRAINT [PK_DatHangCT] PRIMARY KEY CLUSTERED 
(
	[DatHangID] ASC,
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopThu]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopThu](
	[HopThuID] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayCapNhat] [datetime] NOT NULL CONSTRAINT [DF_HopThu_NgayCapNhat]  DEFAULT (getdate()),
	[DaDoc] [bit] NOT NULL CONSTRAINT [DF_HopThu_DaDoc]  DEFAULT ((0)),
	[SDT] [nvarchar](15) NULL,
	[TieuDe] [nvarchar](50) NULL,
 CONSTRAINT [PK_HopThu] PRIMARY KEY CLUSTERED 
(
	[HopThuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhomsp]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nhomsp](
	[NhomspID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomsp] [nvarchar](50) NOT NULL,
	[PhanLoaiID] [int] NOT NULL,
	[BiDanh] [varchar](50) NULL,
 CONSTRAINT [PK_NHOMSP] PRIMARY KEY CLUSTERED 
(
	[NhomspID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[PhanLoaiID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanLoai] [nvarchar](50) NULL,
	[BiDanh] [varchar](50) NULL,
 CONSTRAINT [PK_LOAISP] PRIMARY KEY CLUSTERED 
(
	[PhanLoaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2018-04-11 9:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](150) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[DonGia] [int] NOT NULL CONSTRAINT [DF_SanPham_DonGia]  DEFAULT ((0)),
	[GiaKM] [int] NOT NULL CONSTRAINT [DF_SanPham_GiaKM]  DEFAULT ((0)),
	[Hinh] [nvarchar](150) NULL,
	[NhomspID] [int] NOT NULL,
	[NgayCapNhat] [datetime] NOT NULL CONSTRAINT [DF_SANPHAM_NgayDang]  DEFAULT (getdate()),
	[NgungBan] [bit] NOT NULL CONSTRAINT [DF_SanPham_NgungBan]  DEFAULT ((0)),
	[BiDanh] [varchar](150) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'Ad', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'Mod', N'Mod')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9b2e8156-9043-40f8-b4d4-a31633ec4a51', N'Ad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [Address], [Avatar], [BirthOfDate], [DateRegister], [LastAccess]) VALUES (N'82beab60-088e-46d3-bdd1-d1290083342a', N'cntt3k56@gmail.com', 0, N'ACDxCIAWU3jz9AnGT7un9Qal5a0CcXxrJU2uDIyd+MFMgpOYDMYR2czZy+tcxxqNew==', N'a97f93d9-9502-426a-b960-861c444f378b', NULL, 0, 0, NULL, 1, 0, N'cntt3k56@gmail.com', N'Le Van', N'Hung Yen', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [Address], [Avatar], [BirthOfDate], [DateRegister], [LastAccess]) VALUES (N'9b2e8156-9043-40f8-b4d4-a31633ec4a51', N'levan.hy.97@gmail.com', 1, N'AKBKGPit6KY5tZDXW9irLr0Ut+eDZcyZavOxxLzQdzu9JiWFIMf6r/gAwH0UC7q1zA==', N'3ad78d68-1c2c-46b1-b12d-3567d64d2df5', NULL, 0, 0, NULL, 1, 0, N'levan.hy.97@gmail.com', N'Lê Vân', N'Thuy Khue', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (1, N'Trần Thanh Tâm', N'01688996543', N'123 Lê Hồng Phong, Quận 10, Tp.HCM', N'thanhtam@gmail.com', CAST(N'2014-05-01 16:54:14.607' AS DateTime), 3500000, 1, CAST(N'2014-05-02 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (2, N'Lê Quốc Tuấn Anh', N'01688996547', N'456 Lê Lai, Q1, Tp.HCM', N'tuananh@yahoo.com', CAST(N'2014-05-01 16:54:14.607' AS DateTime), 200000, 1, CAST(N'2014-05-02 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (3, N'Lê Văn Quốc ', N'01687986547', N'222 Trần Hưng Đạo', N'quoc@gmail.com', CAST(N'2014-05-01 16:54:14.607' AS DateTime), 310000, 1, CAST(N'2014-05-02 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (4, N'Trần Thanh Mai', N'01687986541', N'202 Trần Hưng Đạo', N'mai@gmail.com', CAST(N'2014-05-01 16:54:14.607' AS DateTime), 335000, 1, CAST(N'2014-05-02 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (17, N'Phùng Thị An', N'01635833102', N'Thụy Khuê', NULL, CAST(N'2018-03-10 09:33:47.577' AS DateTime), 550000, 0, CAST(N'2018-03-14 09:33:47.577' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([DatHangID], [Hoten], [DienThoai], [DiaChi], [Email], [NgayDat], [TriGia], [DaGiao], [NgayGiao], [GhiChu]) VALUES (18, N'Le Thi Van', N'01635833102', N'thuy khue', NULL, CAST(N'2018-03-21 16:27:05.387' AS DateTime), 470000, 0, CAST(N'2018-03-25 16:27:05.387' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 32, 10, 310000, 3100000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 89, 2, 200000, 400000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 89, 1, 200000, 200000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (3, 23, 1, 310000, 310000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 13, 1, 165000, 165000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 139, 1, 170000, 170000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (17, 19, 1, 250000, 250000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (17, 24, 1, 300000, 300000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (18, 48, 1, 230000, 230000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SanPhamID], [SoLuong], [DonGia], [ThanhTien]) VALUES (18, 49, 1, 240000, 240000)
SET IDENTITY_INSERT [dbo].[HopThu] ON 

INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (1, N'Phạm Ngọc Cẩm Đào', N'abc@yahoo.com', N'Cảm nhận một không gian nhà vườn mộc mạc, thưởng thức các loại hải sản tươi sống, nhà hàng Alphatek mang đến cho bạn một hương vị thanh đạm chốn hương quê giữa lòng thành phố.', CAST(N'2013-09-03 00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (2, N'Trần Hùng', N'tranhung@gmail.com', N'Đến với nhà hàng Alphatek là sự lựa chọn của nhiều thực khách, trong đó có tôi, muốn tìm đến không gian thoáng đãng, yên tĩnh cho những buổi gặp mặt người thân, bạn bè và đồng nghiệp', CAST(N'2013-09-03 11:14:12.737' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (4, N'nguyễn ái tuấn', N'nguyenaituan@yahoo.com', N'Website cần bổ sung thêm chức năng thanh toán qua thẻ ngân hàng.', CAST(N'2016-10-16 14:18:20.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (8, N'nguyễn ái tuấn', N'nguyenaituan95@gmail.com', N'Website cần bổ sung thêm chức năng thanh toán qua thẻ ngân hàng.', CAST(N'2016-10-16 14:24:01.457' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (9, N'Lê Minh Nhơn', N'leminhnhon@gmail.com', N'Website rất đẹp nhưng responsive.', CAST(N'2016-10-18 14:38:07.997' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (1009, N'Nguyễn Tuấn Tú', N'tuantu@gmail.com', N'Xin chào cả nhà', CAST(N'2016-11-29 13:45:20.603' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (1010, N'Quang Chu', N'chuvanquang96@gmail.com', N'qqwq', CAST(N'2017-03-15 00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[HopThu] ([HopThuID], [Hoten], [Email], [NoiDung], [NgayCapNhat], [DaDoc], [SDT], [TieuDe]) VALUES (1011, N'Lê Thị Vân', N'levan.hy.97@gmail.com', N'Nội dung tốt', CAST(N'2018-01-26 00:00:00.000' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HopThu] OFF
SET IDENTITY_INSERT [dbo].[Nhomsp] ON 

INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (1, N'Áo sơ mi nữ', 1, N'Ao_so_mi_nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (2, N'Áo sơ mi nam', 2, N'Ao-so-mi-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (3, N'Áo khoác nữ', 1, N'Ao-khoac-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (4, N'Áo khoác nam', 2, N'Ao-khoac-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (5, N'Áo thun nam', 2, N'Ao-thun-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (6, N'Áo thun nữ', 1, N'Ao-thun-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (7, N'Quần jean nữ', 1, N'Quan-jean-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (8, N'Quần jean nam', 2, N'Quan-jean-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (9, N'Quần tây nam', 2, N'Quan-tay-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (10, N'Quần tây nữ', 1, N'Quan-tay-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (11, N'Quần kaki nữ', 1, N'Quan-kaki-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (12, N'Váy - Đầm', 1, N'Vay-Dam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (13, N'Quần đùi, short nữ', 1, N'Quan-dui-short-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (14, N'Quần đùi, short nam', 2, N'Quan-dui-short-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (15, N'Quần kaki nam', 2, N'Quan-kaki-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (16, N'Đồ ngủ nữ', 1, N'Do-ngu-nu')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (17, N'Đồ ngủ nam', 2, N'Do-ngu-nam')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (23, N'Đồ bơi', 1, N'Ðo-boi')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (24, N'Áo Croptop', 1, N'Ao-Croptop')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (25, N'Áo hai dây', 1, N'Ao-hai-day')
INSERT [dbo].[Nhomsp] ([NhomspID], [TenNhomsp], [PhanLoaiID], [BiDanh]) VALUES (29, N'Áo', 1, N'ao')
SET IDENTITY_INSERT [dbo].[Nhomsp] OFF
SET IDENTITY_INSERT [dbo].[PhanLoai] ON 

INSERT [dbo].[PhanLoai] ([PhanLoaiID], [TenPhanLoai], [BiDanh]) VALUES (1, N'Quần áo nữ', N'Quan-ao-nu')
INSERT [dbo].[PhanLoai] ([PhanLoaiID], [TenPhanLoai], [BiDanh]) VALUES (2, N'Quần áo nam', N'Quan-ao-nam')
SET IDENTITY_INSERT [dbo].[PhanLoai] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (1, N'Áo cách điệu HOT HOT', N'abc', 230000, 200000, N'1.jpg', 1, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 1, N'Ao-cach-dieu-HOT-HOT')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (2, N'Áo thun KOREA mới về-Kute', N'Hàng order... nhận oder liên tục... thường là cuối tuần có hàng nên thứ 6 đóng oder.', 150000, 130000, N'2.jpg', 6, CAST(N'2011-03-16 00:00:00.000' AS DateTime), 0, N'Ao-thun-KOREA-moi-ve-Kute')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (4, N'Áo thun Nữ xì tin cực xinh, xanh', N'Chất Liệu Thành Phần ：100%Cotton', 220000, 0, N'4.jpg', 6, CAST(N'2011-03-16 00:00:00.000' AS DateTime), 1, N'Ao-thun-Nu-xi-tin-cuc-xinh--xanh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (5, N'Thun sọc cá tính', N'CHẤT LIỆU : COTTON', 220000, 0, N'5.jpg', 6, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Thun-soc-ca-tinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (6, N'Áo ba lỗ dễ thương lắm đây', N'CHẤT LIỆU : COTTON', 150000, 0, N'6.jpg', 6, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-ba-lo-de-thuong-lam-day')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (7, N'Áo nơ xinh form dài', N'CHẤT LIỆU : COTTON', 220000, 0, N'7.jpg', 6, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-no-xinh-form-dai')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (8, N'Áo kiểu set đôi', N'CHẤT LIỆU : COTTON', 190000, 0, N'8.jpg', 6, CAST(N'2011-03-16 00:00:00.000' AS DateTime), 0, N'Ao-kieu-set-doi')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (10, N'Áo kiểu công sở Ánes_i ', N'', 150000, 0, N'10.jpg', 1, CAST(N'2011-03-01 00:00:00.000' AS DateTime), 0, N'Ao-kieu-cong-so-Anes_i')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (12, N'Áo kiểu nơ xinh Ánes_i', N'<ul>', 210000, 0, N'12.jpg', 1, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-kieu-no-xinh-Anes_i')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (13, N'Sơ mi kiểu thắt eo xinh', N'<ul>', 165000, 0, N'13.jpg', 1, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-kieu-that-eo-xinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (14, N'Áo kiểu nơ xinh Ánes_i', N'Tên Sản phẩm: Áo kiểu nơ xinh', 165000, 0, N'14.jpg', 1, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-kieu-no-xinh-Anes_i')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (15, N'Chân váy kẻ sọc', N'Chân váy sọc xanh - 59k', 60000, 0, N'15.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Chan-vay-ke-soc')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (17, N'Đầm voan xinh', N'Tên Sản phẩm: Đầm voan xinh', 250000, 0, N'17.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Dam-voan-xinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (18, N'Đầm ống phong cách Q_Ling', N'Tên Sản phẩm: Đầm thun xinh xinh', 280000, 0, N'18.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Dam-ong-phong-cach-Q_Ling')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (19, N'Đầm ren voan', N'Tên Sản phẩm: Đầm ren voan', 250000, 0, N'19.jpg', 12, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Dam-ren-voan')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (20, N'Áo voan yêu', N'Tên Sản phẩm: Áo voan yêu', 280000, 0, N'20.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-voan-yeu')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (21, N'Đầm satin kết hạt đá Q_Ling', N'Tên Sản phẩm: Đầm satin kết hạt đá', 280000, 0, N'21.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Dam-satin-ket-hat-da-Q_Ling')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (22, N'Đầm tầng xinh', N'', 300000, 0, N'22.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Dam-tang-xinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (23, N'Đầm ống xinh Q_Ling', NULL, 300000, 0, N'23.jpg', 12, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Dam-ong-xinh-Q_Ling')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (24, N'Đầm kaki Q_Ling', N'', 300000, 0, N'24.jpg', 12, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Dam-kaki-Q_Ling')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (26, N'Áo khoác kiểu lạ Men', N'', 350000, 0, N'26.jpg', 4, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-khoac-kieu-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (27, N'Áo kiểu lạ Men', N'', 350000, 0, N'27.jpg', 4, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-kieu-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (28, N'Fashion Men Men 07', N'', 340000, 0, N'28.jpg', 4, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Fashion-Men-Men-07')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (29, N'Áo khoác hai lớp Men', N'', 350000, 0, N'29.jpg', 4, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-khoac-hai-lop-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (30, N'Áo khoác nón M 1003', N'', 290000, 0, N'30.jpg', 4, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-khoac-non-M-1003')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (31, N'Áo khoác nam Men', N'', 280000, 0, N'31.jpg', 4, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-khoac-nam-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (32, N'Sơ mi cá tính', N'', 310000, 0, N'32.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-ca-tinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (33, N'Sơ mi phong cách Men', N'', 300000, 0, N'33.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-phong-cach-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (34, N'Áo sơ mi thun Men', N'', 230000, 0, N'34.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-so-mi-thun-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (35, N'Áo sơ mi nam kiểu Men', N'', 285000, 0, N'35.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-so-mi-nam-kieu-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (36, N'Áo sơ mi nam viền M ', N'', 300000, 0, N'36.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-so-mi-nam-vien-M')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (37, N'Sơ mi nối sọoc Men', N'', 290000, 0, N'37.jpg', 2, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'So-mi-noi-sooc-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (38, N'Sơ mi nam công sở Men', N'', 290000, 0, N'38.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-nam-cong-so-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (39, N'Sơ mi sang trọng Men', N'', 280000, 0, N'39.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-sang-trong-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (41, N'Sơ mi caro Men', N'', 290000, 0, N'41.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-caro-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (42, N'Áo sơ mi nam caro Men', N'', 290000, 0, N'42.jpg', 2, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-so-mi-nam-caro-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (43, N'Sơ mi Hàn Men', N'', 310000, 0, N'43.jpg', 2, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'So-mi-Han-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (44, N'Sơ mi kiểu hoàng tộc Men', N'', 280000, 0, N'44.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'So-mi-kieu-hoang-toc-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (45, N'Áo thun nam lạ Men', N'', 260000, 0, N'45.jpg', 2, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-thun-nam-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (46, N'Áo thun cute Men', N'', 290000, 0, N'46.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-thun-cute-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (47, N'Áo thun ba màu Men', N'', 220000, 0, N'47.jpg', 5, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-thun-ba-mau-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (48, N'Áo thun khăn quàng Men', N'', 230000, 0, N'48.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-thun-khan-quang-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (49, N'Áo nam cute Men', N'', 240000, 0, N'49.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-nam-cute-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (50, N'Áo nam kiểu lạ Men', N'', 270000, 0, N'50.jpg', 5, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-nam-kieu-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (51, N'Áo thun trắng đen Men', N'', 210000, 0, N'51.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-thun-trang-den-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (52, N'Áo nam phong cách Men', N'', 220000, 0, N'52.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-nam-phong-cach-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (53, N'Áo nam phong cách Men', N'', 300000, 0, N'53.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-nam-phong-cach-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (54, N'Áo thun cá tính Men', N'', 260000, 0, N'54.jpg', 5, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Ao-thun-ca-tinh-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (55, N'Quần kiểu lạ Men', N'', 300000, 0, N'55.jpg', 14, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-kieu-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (56, N'Quần túi hộp Men', N'', 360000, 0, N'56.jpg', 14, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Quan-tui-hop-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (57, N'Quần sort cute Men', N'', 280000, 0, N'57.jpg', 14, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Quan-sort-cute-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (58, N'Quần lửng cute Men', N'', 280000, 0, N'58.jpg', 14, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-lung-cute-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (59, N'quần dài nam hàn quốc cực xinh', N'', 350000, 0, N'59.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'quan-dai-nam-han-quoc-cuc-xinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (60, N'Quần kaki phong cách Men', N'', 330000, 0, N'60.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-kaki-phong-cach-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (61, N'Quần nam ống côn M', N'', 370000, 0, N'61.jpg', 15, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Quan-nam-ong-con-M')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (62, N'Quần nam cute Men', N'', 350000, 0, N'62.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-nam-cute-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (63, N'Quần kiểu lạ Men', N'', 290000, 0, N'63.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-kieu-la-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (64, N'Quần nam phong cách Men', N'', 320000, 0, N'64.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-nam-phong-cach-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (65, N'Quần nam dây kéo M', N'', 360000, 0, N'65.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-nam-day-keo-M')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (66, N'Quần kaki công sở M', N'', 350000, 0, N'66.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-kaki-cong-so-M')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (67, N'Quần nam sang trọng Men', N'', 330000, 0, N'67.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-nam-sang-trong-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (68, N'Quần kaki túi kiểu Men', N'', 310000, 0, N'68.jpg', 15, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Quan-kaki-tui-kieu-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (69, N'Quần Dior Home Men', N'', 330000, 0, N'69.jpg', 15, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-Dior-Home-Men')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (77, N'Quần Nam cá tính 2011 - KEM', N'', 230000, 0, N'72.jpg', 8, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-Nam-ca-tinh-2011-KEM')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (78, N'Quần jean bóng thời trang', N'', 250000, 0, N'73.jpg', 8, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-jean-bong-thoi-trang')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (79, N'Quần jeans Nam thời trang Hàn', N'', 480000, 0, N'74.jpg', 8, CAST(N'2011-03-17 00:00:00.000' AS DateTime), 0, N'Quan-jeans-Nam-thoi-trang-Han')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (81, N'Đầm voan M01', N'ko co g', 230000, 0, N'2.jpg', 12, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Dam-voan-M01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (82, N'Đầm phi M03', N'ko', 200000, 0, N'3.jpg', 12, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Dam-phi-M03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (83, N'Đầm Nữ dạo phố cực xinh', N'', 210000, 0, N'4.jpg', 12, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Dam-Nu-dao-pho-cuc-xinh')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (84, N'Váy PN00015', N'', 220000, 0, N'5.jpg', 12, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Vay-PN00015')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (85, N'Váy PN00013', N'', 240000, 0, N'6.jpg', 12, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Vay-PN00013')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (86, N'Áo sơmi body Ms 01', N'', 100000, 0, N'7.jpg', 2, CAST(N'2013-12-22 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (87, N'Áo sơmi body Ms 02', N'', 200000, 0, N'8.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (88, N'Áo sơmi body Ms 03', N'', 200000, 0, N'9.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (89, N'Áo sơmi body Ms 04', N'', 200000, 0, N'10.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (90, N'Áo sơmi body Ms 05', N'', 200000, 0, N'11.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (91, N'Áo sơmi body Ms 06', N'', 200000, 0, N'12.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (92, N'Áo sơmi body Ms 07', N'', 200000, 0, N'9.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-07')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (93, N'Áo sơmi body Ms 08', N'', 200000, 0, N'13.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-08')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (94, N'Áo sơmi body Ms 09', N'', 200000, 0, N'14.jpg', 2, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Ao-somi-body-Ms-09')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (95, N'Quần kaki nam MS 01', N'', 260000, 0, N'15.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (96, N'Quần kaki nam MS 02', N'', 260000, 0, N'16.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (97, N'Quần kaki nam MS 03', N'', 260000, 0, N'17.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (98, N'Quần kaki nam MS 04', N'', 260000, 0, N'18.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (99, N'Quần kaki nam MS 05', N'', 260000, 0, N'19.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (100, N'Quần kaki nam MS 05', N'', 260000, 0, N'20.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (101, N'Quần kaki nam MS 06', N'', 260000, 0, N'21.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (102, N'Quần kaki nam MS 07', N'', 260000, 0, N'22.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-07')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (103, N'Quần kaki nam MS 08', N'', 260000, 0, N'23.jpg', 15, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nam-MS-08')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (104, N'Quần đùi, short MS 01', N'', 220000, 0, N'24.jpg', 14, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (105, N'Quần đùi, short MS 02', N'', 220000, 0, N'25.jpg', 14, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (106, N'Quần đùi, short MS 03', N'', 220000, 0, N'26.jpg', 14, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (107, N'Quần đùi, short MS 04', N'', 220000, 0, N'27.jpg', 14, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (108, N'Quần đùi, short MS 05', N'', 220000, 0, N'28.jpg', 14, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (109, N'Quần tây nam MS 01', N'', 190000, 0, N'29.jpg', 9, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nam-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (110, N'Quần tây nam MS 02', N'', 190000, 0, N'30.jpg', 9, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nam-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (111, N'Quần tây nam MS 03', N'', 190000, 0, N'31.jpg', 9, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nam-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (112, N'Quần tây nam MS 04', N'', 190000, 0, N'32.jpg', 9, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nam-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (113, N'Quần tây nam MS 05', N'', 190000, 0, N'33.jpg', 9, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nam-MS-05')
GO
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (114, N'Quần tây nữ MS 01', N'', 190000, 0, N'34.jpg', 10, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (115, N'Quần tây nữ MS 02', N'', 190000, 0, N'35.jpg', 10, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (116, N'Quần tây nữ MS 03', N'', 190000, 0, N'36.jpg', 10, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (117, N'Quần tây nữ MS 04', N'', 190000, 0, N'37.jpg', 10, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (118, N'Quần tây nữ MS 05', N'', 190000, 0, N'38.jpg', 10, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (119, N'Quần kaki nữ MS 01', N'', 200000, 0, N'39.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (120, N'Quần kaki nữ MS 02', N'', 200000, 0, N'40.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (121, N'Quần kaki nữ MS 03', N'', 200000, 0, N'41.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (122, N'Quần kaki nữ MS 04', N'', 200000, 0, N'42.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (123, N'Quần kaki nữ MS 05', N'', 200000, 0, N'43.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (124, N'Quần kaki nữ MS 06', N'', 200000, 0, N'44.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (125, N'Quần kaki nữ MS 07', N'', 200000, 0, N'45.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-07')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (126, N'Quần kaki nữ MS 08', N'', 200000, 0, N'46.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-08')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (127, N'Quần kaki nữ MS 09', N'', 200000, 0, N'47.jpg', 11, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-kaki-nu-MS-09')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (128, N'Quần jean nữ MS 01', N'', 210000, 0, N'48.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (129, N'Quần jean nữ MS 02', N'', 210000, 0, N'49.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (130, N'Quần jean nữ MS 03', N'', 210000, 0, N'50.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (131, N'Quần jean nữ MS 04', N'', 210000, 0, N'51.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (132, N'Quần jean nữ MS 05', N'', 210000, 0, N'52.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (133, N'Quần jean nữ MS 06', N'', 210000, 0, N'53.jpg', 7, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-jean-nu-MS-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (134, N'Quần đùi, short nữ MS 01', N'', 170000, 0, N'54.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (135, N'Quần đùi, short nữ MS 02', N'', 170000, 0, N'55.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (136, N'Quần đùi, short nữ MS 03', N'', 170000, 0, N'56.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (137, N'Quần đùi, short nữ MS 04', N'', 170000, 0, N'57.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (138, N'Quần đùi, short nữ MS 05', N'', 170000, 0, N'58.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (139, N'Quần đùi, short nữ MS 06', N'', 170000, 0, N'59.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-nu-MS-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (140, N'Quần đùi, short ữu MS 07', N'', 170000, 0, N'60.jpg', 13, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Quan-dui-short-uu-MS-07')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (141, N'Đồ ngủ nữ MS 0', N'', 230000, 0, N'61.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-0')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (142, N'Đồ ngủ nữ MS 01', N'', 230000, 0, N'62.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-01')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (143, N'Đồ ngủ nữ MS 02', N'', 230000, 0, N'63.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-02')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (144, N'Đồ ngủ nữ MS 03', N'', 230000, 0, N'64.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-03')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (145, N'Đồ ngủ nữ MS 04', N'', 230000, 0, N'65.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-04')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (146, N'Đồ ngủ nữ MS 05', N'', 230000, 0, N'66.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-05')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (147, N'Đồ ngủ nữ MS 06', N'', 230000, 0, N'67.jpg', 16, CAST(N'2011-04-14 00:00:00.000' AS DateTime), 0, N'Do-ngu-nu-MS-06')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (148, N'Quần tây nữ MS 051', N'', 200000, 150000, N'68.jpg', 10, CAST(N'2011-04-15 00:00:00.000' AS DateTime), 0, N'Quan-tay-nu-MS-051')
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [DonGia], [GiaKM], [Hinh], [NhomspID], [NgayCapNhat], [NgungBan], [BiDanh]) VALUES (150, N'Áo khoác Nỉ Nam', N'Áo chất tốt', 400000, 0, N'70.jpg', 1, CAST(N'2011-05-05 00:00:00.000' AS DateTime), 0, N'Ao-khoac-Ni-Nam')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DatHangCT]  WITH CHECK ADD  CONSTRAINT [FK_DatHangCT_DatHang] FOREIGN KEY([DatHangID])
REFERENCES [dbo].[DatHang] ([DatHangID])
GO
ALTER TABLE [dbo].[DatHangCT] CHECK CONSTRAINT [FK_DatHangCT_DatHang]
GO
ALTER TABLE [dbo].[DatHangCT]  WITH CHECK ADD  CONSTRAINT [FK_DatHangCT_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[DatHangCT] CHECK CONSTRAINT [FK_DatHangCT_SanPham]
GO
ALTER TABLE [dbo].[Nhomsp]  WITH CHECK ADD  CONSTRAINT [FK_Nhomsp_PhanLoai] FOREIGN KEY([PhanLoaiID])
REFERENCES [dbo].[PhanLoai] ([PhanLoaiID])
GO
ALTER TABLE [dbo].[Nhomsp] CHECK CONSTRAINT [FK_Nhomsp_PhanLoai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Nhomsp] FOREIGN KEY([NhomspID])
REFERENCES [dbo].[Nhomsp] ([NhomspID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Nhomsp]
GO
USE [master]
GO
ALTER DATABASE [VanShop] SET  READ_WRITE 
GO
