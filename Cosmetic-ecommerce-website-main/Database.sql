USE [master]
GO
/****** Object:  Database [CosmeticDB]    Script Date: 5/15/2025 5:57:25 PM ******/
CREATE DATABASE [CosmeticDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CosmeticDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CosmeticDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CosmeticDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CosmeticDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CosmeticDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CosmeticDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CosmeticDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CosmeticDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CosmeticDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CosmeticDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CosmeticDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CosmeticDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CosmeticDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CosmeticDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CosmeticDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CosmeticDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CosmeticDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CosmeticDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CosmeticDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CosmeticDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CosmeticDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CosmeticDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CosmeticDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CosmeticDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CosmeticDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CosmeticDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CosmeticDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CosmeticDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CosmeticDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CosmeticDB] SET  MULTI_USER 
GO
ALTER DATABASE [CosmeticDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CosmeticDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CosmeticDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CosmeticDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CosmeticDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CosmeticDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CosmeticDB', N'ON'
GO
ALTER DATABASE [CosmeticDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CosmeticDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CosmeticDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressShipping]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressShipping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Province] [nvarchar](max) NOT NULL,
	[District] [nvarchar](max) NOT NULL,
	[Ward] [nvarchar](max) NOT NULL,
	[SpecificPlace] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[IsDefaultAddress] [bit] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
 CONSTRAINT [PK_AddressShipping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductSize] [nvarchar](max) NOT NULL,
	[FinalPrice] [float] NOT NULL,
	[ProductDiscount] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[CartId] [bigint] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LoyalPoints] [float] NOT NULL,
	[StartDate] [date] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[RankId] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Province] [nvarchar](max) NOT NULL,
	[District] [nvarchar](max) NOT NULL,
	[Ward] [nvarchar](max) NOT NULL,
	[FinalPrice] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[ProductDiscount] [float] NOT NULL,
	[RankDiscount] [float] NOT NULL,
	[LoyalPointEarned] [float] NOT NULL,
	[SpecificPlace] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FinalPrice] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[ProductDiscount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductSize] [nvarchar](max) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[InStock] [bigint] NOT NULL,
	[ProductType] [nvarchar](24) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Discount] [float] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[InStock] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 5/15/2025 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Discount] [float] NOT NULL,
	[RequiredPoint] [float] NOT NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250508163238_InitialCreate', N'8.0.11')
GO
SET IDENTITY_INSERT [dbo].[AddressShipping] ON 

INSERT [dbo].[AddressShipping] ([Id], [Name], [Province], [District], [Ward], [SpecificPlace], [PhoneNumber], [IsDefaultAddress], [CustomerId]) VALUES (1, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', N'hihihihi', N'0783481811', 0, 1)
INSERT [dbo].[AddressShipping] ([Id], [Name], [Province], [District], [Ward], [SpecificPlace], [PhoneNumber], [IsDefaultAddress], [CustomerId]) VALUES (2, N'Đặng Phú Tân', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Xã Lũng Cú', N'Ấp A, bla bla', N'0783481811', 1, 1)
SET IDENTITY_INSERT [dbo].[AddressShipping] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Name], [Address], [PhoneNumber], [DateOfBirth], [Gender], [IsActive], [UserId]) VALUES (1, N'TanCoi', N'Ấp A', N'0783481811', CAST(N'2025-05-09' AS Date), 1, 1, N'ade8052e-cdae-446e-a814-6ead5031fe44')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3e577151-4744-41b6-8c62-e7c527c8c420', N'Client', N'CLIENT', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'46e3dc13-55d4-42af-8fba-c81bf73e608b', N'ADMIN', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9dd26859-52a3-4aaa-8e89-3fb9746eba9a', N'CUSTOMER', N'CUSTOMER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ade8052e-cdae-446e-a814-6ead5031fe44', N'46e3dc13-55d4-42af-8fba-c81bf73e608b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9109d178-1fad-4beb-8789-6f3892244399', N'9dd26859-52a3-4aaa-8e89-3fb9746eba9a')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9109d178-1fad-4beb-8789-6f3892244399', N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDRQGvHaJQa1uLgcRTruTZdxPv+q4C2pGg8J5BQG0glz2IWzr1/d9pZGf5yNloGk+w==', N'RXVOG2B3YAV6IYLTZ73JW4GYG6F72J7P', N'b47346ac-a6dd-434e-9694-131fac1a95aa', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ade8052e-cdae-446e-a814-6ead5031fe44', N'admin@admin', N'ADMIN@ADMIN', N'admin@admin', N'ADMIN@ADMIN', 1, N'AQAAAAIAAYagAAAAEGvnsvCfaU3mkHyqbYobUcNQ60h1/hCZESKlagFQzTRUnN0hbydjBlA5R51zLdFW2g==', N'N26AUO3AIA7VB6SGOMHONJ7AC3ZKVH7Y', N'051c9400-adb1-4a1b-a3ad-dcdda702147f', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [CustomerId]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [Status], [Quantity], [ProductSize], [FinalPrice], [ProductDiscount], [TotalPrice], [ProductId], [CartId]) VALUES (6, N'Available', 12, N'12ml', 604.80000000000007, 10, 672, 6, 1)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (2, N'Accessories and Applications', N'For things', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (3, N'Face', N'For face', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (4, N'Nail', N'For nail', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (5, N'Fragrance', N'For perfume', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (6, N'Lips', N'For lips', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (7, N'Eyes', N'For eye', 1, CAST(N'2025-04-18T20:34:16.2833333' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (8, N'Hehe', N'yeahyeah', 1, CAST(N'2025-05-10T23:37:50.0747033' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (9, N'Đặng Phú Tân', N'hehe', 1, CAST(N'2025-05-11T15:13:54.7700653' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (10, N'yeahyeah', N'123', 1, CAST(N'2025-05-11T15:33:23.4708790' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [Description], [Status], [CreateTime]) VALUES (11, N'jehehehe', N'asd', 0, CAST(N'2025-05-13T13:13:30.0398847' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Address], [PhoneNumber], [DateOfBirth], [Gender], [IsActive], [LoyalPoints], [StartDate], [UserId], [RankId]) VALUES (1, N'TanCoi', N'hihihihih', N'0783481811', CAST(N'2003-05-24' AS Date), 0, 1, 1.86, CAST(N'2025-05-09' AS Date), N'9109d178-1fad-4beb-8789-6f3892244399', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [Province], [District], [Ward], [FinalPrice], [TotalPrice], [TotalDiscount], [ProductDiscount], [RankDiscount], [LoyalPointEarned], [SpecificPlace], [PhoneNumber], [Note], [OrderStatus], [OrderDate], [CustomerId]) VALUES (1, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', 100.8, 112, 11.2, 11.2, 0, 10.08, N'hihihihi', N'0783481811', N'yeahhhh', N'CANCELLED', CAST(N'2025-05-09T13:24:30.1217083' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [Name], [Province], [District], [Ward], [FinalPrice], [TotalPrice], [TotalDiscount], [ProductDiscount], [RankDiscount], [LoyalPointEarned], [SpecificPlace], [PhoneNumber], [Note], [OrderStatus], [OrderDate], [CustomerId]) VALUES (3, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', 35, 35, 0, 0, 0, 3.5, N'hihihihi', N'0783481811', N'', N'PENDING', CAST(N'2025-05-09T13:27:14.6601784' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [Name], [Province], [District], [Ward], [FinalPrice], [TotalPrice], [TotalDiscount], [ProductDiscount], [RankDiscount], [LoyalPointEarned], [SpecificPlace], [PhoneNumber], [Note], [OrderStatus], [OrderDate], [CustomerId]) VALUES (5, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', 22, 22, 0, 0, 0, 2.2, N'hihihihi', N'0783481811', N'', N'SHIPPED', CAST(N'2025-05-09T13:30:08.1397986' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [Name], [Province], [District], [Ward], [FinalPrice], [TotalPrice], [TotalDiscount], [ProductDiscount], [RankDiscount], [LoyalPointEarned], [SpecificPlace], [PhoneNumber], [Note], [OrderStatus], [OrderDate], [CustomerId]) VALUES (7, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', 18.6, 20, 1.3999999999999986, 1.3999999999999986, 0, 1.86, N'hihihihi', N'0783481811', N'', N'COMPLETED', CAST(N'2025-05-10T15:42:45.2419997' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [Name], [Province], [District], [Ward], [FinalPrice], [TotalPrice], [TotalDiscount], [ProductDiscount], [RankDiscount], [LoyalPointEarned], [SpecificPlace], [PhoneNumber], [Note], [OrderStatus], [OrderDate], [CustomerId]) VALUES (8, N'Đặng Phú Tân', N'Tỉnh Đồng Tháp', N'Thành phố Cao Lãnh', N'Phường 1', 50.4, 56, 5.6, 5.6, 0, 5.04, N'hihihihi', N'0783481811', N'', N'CANCELLED', CAST(N'2025-05-09T13:32:13.5354435' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [FinalPrice], [TotalPrice], [ProductDiscount], [Quantity], [ProductSize], [OrderId], [ProductId]) VALUES (1, 100.8, 112, 10, 2, N'12ml', 1, 6)
INSERT [dbo].[OrderDetail] ([Id], [FinalPrice], [TotalPrice], [ProductDiscount], [Quantity], [ProductSize], [OrderId], [ProductId]) VALUES (2, 35, 35, 0, 1, N'10g', 3, 7)
INSERT [dbo].[OrderDetail] ([Id], [FinalPrice], [TotalPrice], [ProductDiscount], [Quantity], [ProductSize], [OrderId], [ProductId]) VALUES (3, 22, 22, 0, 1, N'5ml', 5, 9)
INSERT [dbo].[OrderDetail] ([Id], [FinalPrice], [TotalPrice], [ProductDiscount], [Quantity], [ProductSize], [OrderId], [ProductId]) VALUES (4, 18.6, 20, 7, 1, N'6ml', 7, 10)
INSERT [dbo].[OrderDetail] ([Id], [FinalPrice], [TotalPrice], [ProductDiscount], [Quantity], [ProductSize], [OrderId], [ProductId]) VALUES (5, 50.4, 56, 10, 1, N'12ml', 8, 6)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (6, N'Violet Strawberry Rococo Eyeshadow Palette', N'01 Starmoon Strawberry - Jewel-Toned Dream A dreamy blend of icy blues and soft pinks, each shade captures the enchanting essence of a fairytale. Metallic pinks sparkle like stardust, while pastel hues swirl with soft, romantic magic.', N'/assets/images/products/e1a4bce0-df7a-4398-a07f-0e2beaf9f89d.webp', 252, N'VolumeBased', 1, 10, 7, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (7, N'Strawberry Cupid Pressed Powder', N'Say goodbye to dullness. Soft Lavender neutralizes yellow undertones and brightens your complexion for a healthy glow.', N'/assets/images/products/08b5907d-6808-4473-a108-6da068f121ed.webp', 248, N'WeightBased', 1, 0, 3, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (8, N'Little Angel Embossed Highlighter', N'L01 Eros''s Fable - Rosy Pearl A dreamy pink shimmer that swirls with light, casting a soft, ethereal glow.', N'/assets/images/products/36f1a7f5-063b-499a-90c4-439568dabf84.webp', 148, N'WeightBased', 1, 5, 3, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (9, N'Strawberry Cupid All Day Glow Liquid Blush', N'01 Frosty Strawberry—Baby Pink Soft and delicate, Frosty Strawberry is the perfect shade for a fresh, just-pinched pink glow.', N'/assets/images/products/5a8b5f20-048f-4af6-aec2-03800b157799.webp', 184, N'VolumeBased', 1, 0, 3, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (10, N'Butterfly Cloud Collar Mascara', N'Ink Black gives your lashes bold volume and lift that lasts all day. The curved brush glides on smooth, defining each lash with a waterproof finish—perfect for everyday or a bold, dramatic look.', N'/assets/images/products/fcbefc55-1034-4478-9edc-47dc2d2a4383.webp', 145, N'VolumeBased', 1, 7, 7, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (11, N'Butterfly Cloud Collar Liquid Eyeliner', N'Intensely pigmented and effortlessly precise, Ink Black delivers bold, long-lasting definition for any eye look.', N'/assets/images/products/c05a37ef-e530-4d91-a822-783b233e0571.webp', 280, N'VolumeBased', 1, 0, 7, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (12, N'Creamy Strawberry Trio Lip Set', N'Spoil someone special with the lovely custom Creamy Strawberry Trio Lip Set.', N'/assets/images/products/ed149db7-0a77-4a08-9647-3fa8558e602f.webp', 250, N'VolumeBased', 1, 20, 6, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (13, N'Butterfly Cloud Collar Collection Glossy Lipstick', N'C01: Birchleaf Pair - Nude Apricot Meet your new favorite nude. A soft, sheer apricot, Birchleaf Pear adds just the right warmth to any look—it''s the perfect everyday shade', N'/assets/images/products/2e572e87-3ba5-4849-afda-c31ab71c77ad.webp', 250, N'WeightBased', 1, 0, 6, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (14, N'Juicy Strawberry Trio Lip Set', N'Spoil someone special with the lovely custom Juicy Strawberry Trio Lip Set.', N'/assets/images/products/afb2d85e-1c44-497c-aec0-78bce2357406.webp', 250, N'VolumeBased', 1, 3, 6, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (15, N'Midsummer Fairytales Perfume', N'Inspired by garden courtyard architecture and birdcages, the perfume bottle features romantic elements like fairies, flowers, and butterflies. It offers a delicate and enchanting fragrance, reminiscent of a stroll through a lush garden. Midsummer Fanta', N'/assets/images/products/935d5e38-924a-4119-b6d7-cb121310cfa7.webp', 100, N'VolumeBased', 1, 0, 5, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (16, N'Strawberry Cupid Solid Perfume', N'Lychee Bouquet—lychee rose fruity floral A little sweet, a little floral. Lychee Bouquet blends juicy lychee, berries, and rose, with a soft musk finish. Top Notes: Lychee, Black Currant, Berries, Lemon Heart Notes: Rose, Jasmine Base Note: Musk', N'/assets/images/products/448e3c7b-29fc-458b-9a7a-eb87b0c725b3.webp', 100, N'WeightBased', 1, 3, 5, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (17, N'Strawberry Cupid Perfume', N'Lychee Bouquet—lychee rose fruity floral A little sweet, a little floral. Lychee Bouquet blends juicy lychee, berries, and rose, with a soft musk finish. Top Notes: Lychee, Black Currant, Berries, Lemon Heart Notes: Rose, Jasmine Base Note: Musk', N'/assets/images/products/623f9309-d9a8-4121-a2ef-78d6ce16bc6c.webp', 50, N'VolumeBased', 1, 0, 5, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (18, N'Strawberry Cupid Hand Mirror', N'??A mirror fit for a fairytale. The sweet strawberry cake design, complete with piped ''cream'' and strawberries, is paired with a golden Cupid for the perfect blend of sweetness and romance.', N'/assets/images/products/9591146b-bd75-466c-86ef-ee8a336f35e7.webp', 150, N'Standard', 1, 10, 2, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (19, N'Strawberry Cupid Scented Hand Cream', N'Lychee Bouquet—lychee rose fruity floral A little sweet, a little floral. Lychee Bouquet blends juicy lychee, berries, and rose, with a soft musk finish. Top Notes: Lychee, Black Currant, Berries, Lemon Heart Notes: Rose, Jasmine Base Notes: Musk', N'/assets/images/products/c23ff08d-b0f8-44f9-999e-ea8cc274bf7f.webp', 250, N'VolumeBased', 1, 0, 2, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (20, N'Flower Knows Chocolate Leather Tote Bag', N'?? This Chocolate Leather Tote Bag oozes timeless elegance with a modern flair — perfect for fashionistas who want to look fab without sacrificing practicality. Its chocolate-hued hue brings a luxe feel for a versatile accessory that can complement any ensemble.', N'/assets/images/products/de193287-e0b3-431a-8a06-da84af3605dd.webp', 50, N'Standard', 1, 5, 2, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (21, N'Little Angel Mini Powder Puff', N'?? Made specially for applying blush & highlighter. The fluffy surface delivers the ultimate compatible application of powder-based products.', N'/assets/images/products/1deb97dc-93e5-4772-a7a2-24067d9aaff3.webp', 350, N'SizeBased', 1, 5, 2, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (22, N'Lips serum', N'', N'/assets/images/products/43deb5d6-a269-4300-82dc-2fe6b08269c9.webp', 50, N'VolumeBased', 1, 0, 6, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (23, N'Radiant Eyes & Cheeks Duo A', N'Spoil someone special with the lovely custom Radiant Eyes & Cheeks Duo A', N'/assets/images/products/3cec03aa-677c-46b9-a37f-a601f8b1b8b2.webp', 50, N'WeightBased', 1, 5, 7, CAST(N'2025-04-18T20:34:16.2866667' AS DateTime2))
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image], [InStock], [ProductType], [IsAvailable], [Discount], [CategoryId], [CreateTime]) VALUES (24, N'Đặng Phú Tân', N'asd', N'/assets/images/products/4a33c46f-c344-45fe-8d20-3d992d36aed9.png', 0, N'VolumeBased', 1, 10, 2, CAST(N'2025-05-13T23:42:26.6589326' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductVariant] ON 

INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (1, 6, 56, 122, N'12ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (2, 6, 80, 80, N'18ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (3, 6, 100, 50, N'24ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (4, 7, 35, 98, N'10g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (5, 7, 52, 75, N'15g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (6, 7, 65, 75, N'20g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (7, 8, 30, 68, N'8g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (8, 8, 45, 50, N'12g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (9, 8, 55, 30, N'15g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (10, 9, 22, 77, N'5ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (11, 9, 35, 70, N'10ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (12, 9, 50, 37, N'15ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (13, 10, 20, 55, N'6ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (14, 10, 32, 50, N'10ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (15, 10, 40, 40, N'12ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (16, 11, 15, 100, N'3ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (17, 11, 25, 100, N'5ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (18, 11, 35, 80, N'8ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (19, 12, 53, 110, N'10ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (20, 12, 75, 80, N'15ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (21, 12, 90, 60, N'20ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (22, 13, 20, 100, N'3g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (23, 13, 30, 80, N'5g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (24, 13, 40, 70, N'8g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (25, 14, 72, 90, N'12ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (26, 14, 95, 80, N'18ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (27, 14, 120, 80, N'24ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (28, 15, 45, 40, N'30ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (29, 15, 75, 30, N'50ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (30, 15, 120, 30, N'100ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (31, 16, 62, 40, N'15g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (32, 16, 90, 30, N'25g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (33, 16, 115, 30, N'35g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (34, 17, 80, 20, N'30ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (35, 17, 115, 15, N'50ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (36, 17, 165, 15, N'100ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (37, 18, 25, 150, N'Standard')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (38, 19, 15, 100, N'30ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (39, 19, 25, 80, N'60ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (40, 19, 40, 70, N'100ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (41, 20, 95, 50, N'Standard')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (42, 21, 5, 150, N'Small')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (43, 21, 8, 120, N'Medium')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (44, 21, 12, 80, N'Large')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (45, 22, 15, 20, N'5ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (46, 22, 25, 15, N'10ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (47, 22, 35, 15, N'15ml')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (48, 23, 92, 20, N'15g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (49, 23, 120, 15, N'20g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (50, 23, 145, 15, N'25g')
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Price], [InStock], [Name]) VALUES (52, 24, 12, 5, N'12ml')
SET IDENTITY_INSERT [dbo].[ProductVariant] OFF
GO
SET IDENTITY_INSERT [dbo].[Rank] ON 

INSERT [dbo].[Rank] ([Id], [Name], [Discount], [RequiredPoint]) VALUES (1, N'NONE', 0, 0)
INSERT [dbo].[Rank] ([Id], [Name], [Discount], [RequiredPoint]) VALUES (2, N'SILVER', 2, 2000)
INSERT [dbo].[Rank] ([Id], [Name], [Discount], [RequiredPoint]) VALUES (3, N'GOLD', 5, 5000)
INSERT [dbo].[Rank] ([Id], [Name], [Discount], [RequiredPoint]) VALUES (4, N'PLATINUM', 7, 7000)
SET IDENTITY_INSERT [dbo].[Rank] OFF
GO
/****** Object:  Index [IX_AddressShipping_CustomerId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AddressShipping_CustomerId] ON [dbo].[AddressShipping]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Admin_UserId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Admin_UserId] ON [dbo].[Admin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cart_CustomerId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cart_CustomerId] ON [dbo].[Cart]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_CartId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_CartId] ON [dbo].[CartItems]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer_RankId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_RankId] ON [dbo].[Customer]
(
	[RankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_UserId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_UserId] ON [dbo].[Customer]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductId] ON [dbo].[OrderDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariant_ProductId]    Script Date: 5/15/2025 5:57:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariant_ProductId] ON [dbo].[ProductVariant]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressShipping]  WITH CHECK ADD  CONSTRAINT [FK_AddressShipping_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AddressShipping] CHECK CONSTRAINT [FK_AddressShipping_Customer_CustomerId]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer_CustomerId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Cart_CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Product_ProductId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Rank_RankId] FOREIGN KEY([RankId])
REFERENCES [dbo].[Rank] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Rank_RankId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_CustomerId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_ProductId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Product_ProductId]
GO
USE [master]
GO
ALTER DATABASE [CosmeticDB] SET  READ_WRITE 
GO
