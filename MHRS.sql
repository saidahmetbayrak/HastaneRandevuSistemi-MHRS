USE [master]
GO
/****** Object:  Database [HastaneRandevuSistemi]    Script Date: 4.11.2019 20:50:54 ******/
CREATE DATABASE [HastaneRandevuSistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneRandevuSistemi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HastaneRandevuSistemi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HastaneRandevuSistemi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HastaneRandevuSistemi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HastaneRandevuSistemi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneRandevuSistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneRandevuSistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneRandevuSistemi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [HastaneRandevuSistemi]
GO
/****** Object:  Table [dbo].[Bolumler]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolumler](
	[BolumID] [int] NOT NULL,
	[PoliklinkID] [int] NULL,
	[BolumAd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bolumler] PRIMARY KEY CLUSTERED 
(
	[BolumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoktorBilgileri]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoktorBilgileri](
	[DoktorID] [int] NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Cinsiyet] [bit] NOT NULL,
	[BolumID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](16) NOT NULL,
	[Telefon] [nchar](11) NULL,
	[RolID] [int] NULL,
 CONSTRAINT [PK_DoktorBilgileri] PRIMARY KEY CLUSTERED 
(
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrRandevuEkrani]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrRandevuEkrani](
	[DrRandevuID] [int] NOT NULL,
	[HastaID] [int] NOT NULL,
	[SeansID] [int] NOT NULL,
	[MuaniyeDurumu] [bit] NOT NULL,
	[RandevuID] [int] NOT NULL,
 CONSTRAINT [PK_DrRandevuEkranı] PRIMARY KEY CLUSTERED 
(
	[DrRandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EczaneBilgileri]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EczaneBilgileri](
	[EczaneID] [int] IDENTITY(1,1) NOT NULL,
	[EczaneAdi] [nchar](10) NOT NULL,
	[EMail] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[RolID] [int] NOT NULL,
 CONSTRAINT [PK_EczaneBilgileri] PRIMARY KEY CLUSTERED 
(
	[EczaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HastaBilgileri]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaBilgileri](
	[HastaID] [int] NOT NULL,
	[Tc_No] [nchar](11) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Cinsiyet] [bit] NOT NULL,
	[EMail] [nvarchar](100) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[Telefon] [nchar](11) NULL,
	[RolID] [int] NULL,
 CONSTRAINT [PK_HastaBilgileri] PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastane]    Script Date: 4.11.2019 20:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastane](
	[HastaneID] [int] IDENTITY(1,1) NOT NULL,
	[HastaneAd] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hastane] PRIMARY KEY CLUSTERED 
(
	[HastaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastaneler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastaneler](
	[HastanelerID] [int] IDENTITY(1,1) NOT NULL,
	[BolumID] [int] NOT NULL,
	[PoliklinkID] [int] NOT NULL,
	[HastaneID] [int] NOT NULL,
	[IlceD] [int] NOT NULL,
 CONSTRAINT [PK_Hastaneler] PRIMARY KEY CLUSTERED 
(
	[HastanelerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilceler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilceler](
	[IlceID] [int] IDENTITY(1,1) NOT NULL,
	[ilceAd] [nvarchar](50) NULL,
	[ILID] [int] NOT NULL,
 CONSTRAINT [PK_ilceler] PRIMARY KEY CLUSTERED 
(
	[IlceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Iller]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iller](
	[ILID] [int] IDENTITY(1,1) NOT NULL,
	[ILAd] [nvarchar](255) NULL,
 CONSTRAINT [PK_Iller] PRIMARY KEY CLUSTERED 
(
	[ILID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuayeneBilgileri]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuayeneBilgileri](
	[MuayeneID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NOT NULL,
	[TeshisID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
	[ReceteID] [int] NOT NULL,
 CONSTRAINT [PK_MuayeneBilgileri] PRIMARY KEY CLUSTERED 
(
	[MuayeneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinkler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinkler](
	[PoliklinkID] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinkAd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Poliklinkler] PRIMARY KEY CLUSTERED 
(
	[PoliklinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Randevu]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RandevuID] [int] NOT NULL,
	[BolumAD] [nvarchar](max) NOT NULL,
	[Ad] [nchar](10) NOT NULL,
	[Tarih] [datetime2](7) NOT NULL,
	[Saat] [time](7) NULL,
 CONSTRAINT [PK_Randevu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RandevuOlusturma]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandevuOlusturma](
	[RandevuID] [int] NOT NULL,
	[HastaID] [int] NOT NULL,
	[HastanelerID] [int] NOT NULL,
	[SeansID] [int] NOT NULL,
 CONSTRAINT [PK_RandevuOlusturma] PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receteler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receteler](
	[ReceteID] [int] IDENTITY(1,1) NOT NULL,
	[ReceteKodu] [nchar](5) NOT NULL,
	[HastaID] [int] NOT NULL,
	[ilaclar] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Receteler] PRIMARY KEY CLUSTERED 
(
	[ReceteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceteSorgulama]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceteSorgulama](
	[ReceteID] [int] NOT NULL,
	[EczaneID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roller]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roller](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[Rolu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roller] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saatler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saatler](
	[SaatID] [int] IDENTITY(1,1) NOT NULL,
	[saatDurumu] [bit] NOT NULL,
	[Saat] [time](7) NOT NULL,
 CONSTRAINT [PK_Saatler] PRIMARY KEY CLUSTERED 
(
	[SaatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seanslar]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seanslar](
	[SeansID] [int] NOT NULL,
	[Tarih] [date] NOT NULL,
	[SaatID] [int] NOT NULL,
 CONSTRAINT [PK_Seanslar] PRIMARY KEY CLUSTERED 
(
	[SeansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teshisler]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teshisler](
	[TeshisID] [int] IDENTITY(1,1) NOT NULL,
	[TeshisAd] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Teshisler] PRIMARY KEY CLUSTERED 
(
	[TeshisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UyeGirisi]    Script Date: 4.11.2019 20:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UyeGirisi](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[EMail] [nvarchar](100) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[RolID] [int] NOT NULL,
 CONSTRAINT [PK_UyeGirisi] PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (1, 1, N'Aile Hekimliği')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (2, 2, N'Beyin Ve Sinir Cerrahisi')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (3, 1, N'Çocuk Hastalıkları')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (4, 2, N'Deri ve Zührevi Hastalıkları (Cildiye)')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (5, 1, N'Genel Cerrahi')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (6, 3, N'Göğüs Hastalıkları')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (7, 4, N'İç Hastalıkları (Dahiliye)')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (8, 6, N'Kalp Damar Cerrahisi')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (9, 5, N'Nöroloji')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (10, 6, N'Üroloji')
INSERT [dbo].[Bolumler] ([BolumID], [PoliklinkID], [BolumAd]) VALUES (11, 3, N'Ortopedi')
INSERT [dbo].[DoktorBilgileri] ([DoktorID], [Ad], [Soyad], [Cinsiyet], [BolumID], [Email], [Sifre], [Telefon], [RolID]) VALUES (1, N'Burcu', N'Volkan', 1, 3, N'bvolkan@mail.com', N'1234', N'02596321512', 1)
INSERT [dbo].[DoktorBilgileri] ([DoktorID], [Ad], [Soyad], [Cinsiyet], [BolumID], [Email], [Sifre], [Telefon], [RolID]) VALUES (2, N'Deniz', N'Ertem', 0, 2, N'dertem@mail.com', N'123456789', N'02569745859', 1)
INSERT [dbo].[DoktorBilgileri] ([DoktorID], [Ad], [Soyad], [Cinsiyet], [BolumID], [Email], [Sifre], [Telefon], [RolID]) VALUES (3, N'Safa', N'Barış', 0, 2, N'sbaris@mail.com', N'12134578', NULL, 1)
INSERT [dbo].[DoktorBilgileri] ([DoktorID], [Ad], [Soyad], [Cinsiyet], [BolumID], [Email], [Sifre], [Telefon], [RolID]) VALUES (4, N'Fatma', N'Şahin', 1, 1, N'fsahin@mail.com', N'987654321', N'05269745869', 1)
SET IDENTITY_INSERT [dbo].[EczaneBilgileri] ON 

INSERT [dbo].[EczaneBilgileri] ([EczaneID], [EczaneAdi], [EMail], [Sifre], [RolID]) VALUES (1, N'Çiğdem    ', N'cigdem@eczane.com', N'12345678', 3)
INSERT [dbo].[EczaneBilgileri] ([EczaneID], [EczaneAdi], [EMail], [Sifre], [RolID]) VALUES (2, N'Barış     ', N'baris@eczane.com', N'97654321', 3)
INSERT [dbo].[EczaneBilgileri] ([EczaneID], [EczaneAdi], [EMail], [Sifre], [RolID]) VALUES (3, N'Erkut     ', N'erkut@eczane.com', N'951753a', 3)
INSERT [dbo].[EczaneBilgileri] ([EczaneID], [EczaneAdi], [EMail], [Sifre], [RolID]) VALUES (5, N'Kadıköy   ', N'kadıköye@eczane.com', N'1222654', 3)
SET IDENTITY_INSERT [dbo].[EczaneBilgileri] OFF
INSERT [dbo].[HastaBilgileri] ([HastaID], [Tc_No], [Ad], [Soyad], [Cinsiyet], [EMail], [Sifre], [Telefon], [RolID]) VALUES (1, N'15986548752', N'Elif', N'Şaşmaz', 1, N'esasmaz@hasta.com', N'987654321', N'2589631457 ', 2)
INSERT [dbo].[HastaBilgileri] ([HastaID], [Tc_No], [Ad], [Soyad], [Cinsiyet], [EMail], [Sifre], [Telefon], [RolID]) VALUES (2, N'13256547795', N'Ahmet', N'Güngör', 0, N'agungor@hasta.com', N'12345678', N'2125689650 ', 2)
INSERT [dbo].[HastaBilgileri] ([HastaID], [Tc_No], [Ad], [Soyad], [Cinsiyet], [EMail], [Sifre], [Telefon], [RolID]) VALUES (3, N'98574695654', N'Seda', N'Yıldız', 1, N'syildiz@hasta.com', N'134525263', NULL, 2)
INSERT [dbo].[HastaBilgileri] ([HastaID], [Tc_No], [Ad], [Soyad], [Cinsiyet], [EMail], [Sifre], [Telefon], [RolID]) VALUES (4, N'24361738465', N'Erhan', N'Demir', 0, N'edemir@hasta.com', N'248635791', N'5689659568 ', 2)
SET IDENTITY_INSERT [dbo].[Hastane] ON 

INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (1, N'Bakırköy Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (2, N'Kadıköy Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (3, N'Tuzla Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (4, N'Çiğli Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (5, N'Konak Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (6, N'Bornova Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (7, N'Mamak Devlet Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (8, N'Keçiören Eğitim Araştırma Hastanesi')
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAd]) VALUES (9, N'Etimesgut Devlet Hastanesi')
SET IDENTITY_INSERT [dbo].[Hastane] OFF
SET IDENTITY_INSERT [dbo].[Hastaneler] ON 

INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (3, 1, 1, 1, 14)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (4, 1, 11, 7, 8)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (5, 1, 14, 5, 21)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (6, 2, 4, 3, 15)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (8, 2, 7, 7, 9)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (9, 2, 13, 6, 18)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (10, 3, 5, 2, 12)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (11, 3, 8, 9, 10)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (12, 3, 15, 4, 22)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (13, 4, 2, 1, 14)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (14, 4, 10, 9, 10)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (15, 4, 12, 5, 19)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (16, 5, 6, 3, 16)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (17, 5, 7, 7, 9)
INSERT [dbo].[Hastaneler] ([HastanelerID], [BolumID], [PoliklinkID], [HastaneID], [IlceD]) VALUES (18, 5, 13, 6, 18)
SET IDENTITY_INSERT [dbo].[Hastaneler] OFF
SET IDENTITY_INSERT [dbo].[Ilceler] ON 

INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (3, N'Çankaya', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (5, N'Sincan', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (6, N'Kızılay', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (7, N'Keçiören', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (8, N'Kızılay', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (9, N'Mamak', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (10, N'Etimesgut', 1)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (11, N'Beylikdüzü', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (12, N'Kadıköy', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (13, N'Üsküdar', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (14, N'Bakırköy', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (15, N'Tuzla', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (16, N'Pendik', 2)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (17, N'Buca', 3)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (18, N'Bornova', 3)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (19, N'Konak', 3)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (21, N'Alsancak', 3)
INSERT [dbo].[Ilceler] ([IlceID], [ilceAd], [ILID]) VALUES (22, N'Göztepe', 3)
SET IDENTITY_INSERT [dbo].[Ilceler] OFF
SET IDENTITY_INSERT [dbo].[Iller] ON 

INSERT [dbo].[Iller] ([ILID], [ILAd]) VALUES (1, N'Ankara')
INSERT [dbo].[Iller] ([ILID], [ILAd]) VALUES (2, N'İstanbul')
INSERT [dbo].[Iller] ([ILID], [ILAd]) VALUES (3, N'İzmir')
SET IDENTITY_INSERT [dbo].[Iller] OFF
SET IDENTITY_INSERT [dbo].[MuayeneBilgileri] ON 

INSERT [dbo].[MuayeneBilgileri] ([MuayeneID], [HastaID], [TeshisID], [DoktorID], [ReceteID]) VALUES (2, 1, 3, 2, 1)
INSERT [dbo].[MuayeneBilgileri] ([MuayeneID], [HastaID], [TeshisID], [DoktorID], [ReceteID]) VALUES (3, 2, 4, 3, 2)
SET IDENTITY_INSERT [dbo].[MuayeneBilgileri] OFF
SET IDENTITY_INSERT [dbo].[Poliklinkler] ON 

INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (1, N'Osmaniye Semt Polikinliği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (2, N'Güneşli Semt Polikinliği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (3, N'Bahçelievler Semp Polikliniği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (4, N'İçmeler Semt Polikliniği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (5, N'Mimar Sinan Şifa Semt Polikliniği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (6, N'Kaynarca Semt Polikliniği')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (7, N'Mamak Semp Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (8, N'Etimesgut Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (9, N'YeniMahalle Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (10, N'Eryaman Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (11, N'Kızılay Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (12, N'Bayraklı Diş Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (13, N'Bornova Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (14, N'Alsancak Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (15, N'Göztepe Semt Pol.')
INSERT [dbo].[Poliklinkler] ([PoliklinkID], [PoliklinkAd]) VALUES (16, N'Çiğli Semt Pol.')
SET IDENTITY_INSERT [dbo].[Poliklinkler] OFF
SET IDENTITY_INSERT [dbo].[Randevu] ON 

INSERT [dbo].[Randevu] ([ID], [RandevuID], [BolumAD], [Ad], [Tarih], [Saat]) VALUES (7, 1, N'Beyin Ve Sinir Cerrahisi', N'ErhanDemir', CAST(N'2019-11-05T00:00:00.0000000' AS DateTime2), CAST(N'08:30:00' AS Time))
INSERT [dbo].[Randevu] ([ID], [RandevuID], [BolumAD], [Ad], [Tarih], [Saat]) VALUES (8, 2, N'Deri ve Zührevi Hastalıkları (Cildiye)', N'ElifŞaşmaz', CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Randevu] OFF
INSERT [dbo].[RandevuOlusturma] ([RandevuID], [HastaID], [HastanelerID], [SeansID]) VALUES (1, 2, 3, 3)
INSERT [dbo].[RandevuOlusturma] ([RandevuID], [HastaID], [HastanelerID], [SeansID]) VALUES (2, 3, 6, 2)
SET IDENTITY_INSERT [dbo].[Receteler] ON 

INSERT [dbo].[Receteler] ([ReceteID], [ReceteKodu], [HastaID], [ilaclar]) VALUES (1, N'12598', 1, N'Insülin')
INSERT [dbo].[Receteler] ([ReceteID], [ReceteKodu], [HastaID], [ilaclar]) VALUES (2, N'56897', 2, N'Kas gevşetici')
INSERT [dbo].[Receteler] ([ReceteID], [ReceteKodu], [HastaID], [ilaclar]) VALUES (3, N'64985', 3, N'Parol')
SET IDENTITY_INSERT [dbo].[Receteler] OFF
INSERT [dbo].[ReceteSorgulama] ([ReceteID], [EczaneID]) VALUES (1, 2)
INSERT [dbo].[ReceteSorgulama] ([ReceteID], [EczaneID]) VALUES (2, 1)
INSERT [dbo].[ReceteSorgulama] ([ReceteID], [EczaneID]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Roller] ON 

INSERT [dbo].[Roller] ([RolID], [Rolu]) VALUES (1, N'Doktor')
INSERT [dbo].[Roller] ([RolID], [Rolu]) VALUES (2, N'Hasta')
INSERT [dbo].[Roller] ([RolID], [Rolu]) VALUES (3, N'Eczaci')
SET IDENTITY_INSERT [dbo].[Roller] OFF
SET IDENTITY_INSERT [dbo].[Saatler] ON 

INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (2, 0, CAST(N'08:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (3, 0, CAST(N'08:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (4, 0, CAST(N'09:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (5, 0, CAST(N'09:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (6, 0, CAST(N'10:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (7, 0, CAST(N'10:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (8, 0, CAST(N'11:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (9, 0, CAST(N'11:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (10, 0, CAST(N'12:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (11, 0, CAST(N'12:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (12, 0, CAST(N'13:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (13, 0, CAST(N'13:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (14, 0, CAST(N'14:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (15, 0, CAST(N'14:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (16, 0, CAST(N'15:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (17, 0, CAST(N'15:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (18, 0, CAST(N'16:00:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (19, 0, CAST(N'16:30:00' AS Time))
INSERT [dbo].[Saatler] ([SaatID], [saatDurumu], [Saat]) VALUES (20, 0, CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Saatler] OFF
INSERT [dbo].[Seanslar] ([SeansID], [Tarih], [SaatID]) VALUES (1, CAST(N'2019-11-05' AS Date), 2)
INSERT [dbo].[Seanslar] ([SeansID], [Tarih], [SaatID]) VALUES (2, CAST(N'2019-05-11' AS Date), 5)
INSERT [dbo].[Seanslar] ([SeansID], [Tarih], [SaatID]) VALUES (3, CAST(N'2019-11-05' AS Date), 3)
INSERT [dbo].[Seanslar] ([SeansID], [Tarih], [SaatID]) VALUES (4, CAST(N'2019-11-07' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Teshisler] ON 

INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (1, N'Grip')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (2, N'Hipertansiyon')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (3, N'Diyabet')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (4, N'Kol Kırığı')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (5, N'Çıkık')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (6, N'Migren')
INSERT [dbo].[Teshisler] ([TeshisID], [TeshisAd]) VALUES (7, N'Denge Bozukluğu')
SET IDENTITY_INSERT [dbo].[Teshisler] OFF
SET IDENTITY_INSERT [dbo].[UyeGirisi] ON 

INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (1, N'esasmaz@hasta.com', N'987654321', 2)
INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (2, N'agungor@hasta.com', N'12345678', 2)
INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (3, N'dertem@mail.com', N'123456789', 1)
INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (4, N'fsahin@mail.com', N'987654321', 1)
INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (5, N'cigdem@eczane.com', N'12345678', 3)
INSERT [dbo].[UyeGirisi] ([UyeID], [EMail], [Sifre], [RolID]) VALUES (6, N'erkut@eczane.com', N'1222654', 3)
SET IDENTITY_INSERT [dbo].[UyeGirisi] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_EMail]    Script Date: 4.11.2019 20:50:55 ******/
ALTER TABLE [dbo].[HastaBilgileri] ADD  CONSTRAINT [UQ_EMail] UNIQUE NONCLUSTERED 
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HastaBilgileri] ADD  CONSTRAINT [DF_HastaBilgileri_RolID]  DEFAULT ((2)) FOR [RolID]
GO
ALTER TABLE [dbo].[Saatler] ADD  CONSTRAINT [DF_Saatler_saatAlındı]  DEFAULT ((0)) FOR [saatDurumu]
GO
ALTER TABLE [dbo].[Bolumler]  WITH CHECK ADD  CONSTRAINT [FK_Bolumler_Poliklinkler] FOREIGN KEY([PoliklinkID])
REFERENCES [dbo].[Poliklinkler] ([PoliklinkID])
GO
ALTER TABLE [dbo].[Bolumler] CHECK CONSTRAINT [FK_Bolumler_Poliklinkler]
GO
ALTER TABLE [dbo].[DoktorBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_DoktorBilgileri_Bolumler] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Bolumler] ([BolumID])
GO
ALTER TABLE [dbo].[DoktorBilgileri] CHECK CONSTRAINT [FK_DoktorBilgileri_Bolumler]
GO
ALTER TABLE [dbo].[DoktorBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_DoktorBilgileri_Roller] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roller] ([RolID])
GO
ALTER TABLE [dbo].[DoktorBilgileri] CHECK CONSTRAINT [FK_DoktorBilgileri_Roller]
GO
ALTER TABLE [dbo].[DrRandevuEkrani]  WITH CHECK ADD  CONSTRAINT [FK_DrRandevuEkranı_HastaBilgileri] FOREIGN KEY([HastaID])
REFERENCES [dbo].[HastaBilgileri] ([HastaID])
GO
ALTER TABLE [dbo].[DrRandevuEkrani] CHECK CONSTRAINT [FK_DrRandevuEkranı_HastaBilgileri]
GO
ALTER TABLE [dbo].[DrRandevuEkrani]  WITH CHECK ADD  CONSTRAINT [FK_DrRandevuEkranı_RandevuOlusturma] FOREIGN KEY([RandevuID])
REFERENCES [dbo].[RandevuOlusturma] ([RandevuID])
GO
ALTER TABLE [dbo].[DrRandevuEkrani] CHECK CONSTRAINT [FK_DrRandevuEkranı_RandevuOlusturma]
GO
ALTER TABLE [dbo].[EczaneBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_EczaneBilgileri_Roller] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roller] ([RolID])
GO
ALTER TABLE [dbo].[EczaneBilgileri] CHECK CONSTRAINT [FK_EczaneBilgileri_Roller]
GO
ALTER TABLE [dbo].[HastaBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_HastaBilgileri_Roller] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roller] ([RolID])
GO
ALTER TABLE [dbo].[HastaBilgileri] CHECK CONSTRAINT [FK_HastaBilgileri_Roller]
GO
ALTER TABLE [dbo].[Hastaneler]  WITH CHECK ADD  CONSTRAINT [FK_Hastaneler_Bolumler] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Bolumler] ([BolumID])
GO
ALTER TABLE [dbo].[Hastaneler] CHECK CONSTRAINT [FK_Hastaneler_Bolumler]
GO
ALTER TABLE [dbo].[Hastaneler]  WITH CHECK ADD  CONSTRAINT [FK_Hastaneler_Hastane] FOREIGN KEY([HastaneID])
REFERENCES [dbo].[Hastane] ([HastaneID])
GO
ALTER TABLE [dbo].[Hastaneler] CHECK CONSTRAINT [FK_Hastaneler_Hastane]
GO
ALTER TABLE [dbo].[Hastaneler]  WITH CHECK ADD  CONSTRAINT [FK_Hastaneler_Ilceler1] FOREIGN KEY([IlceD])
REFERENCES [dbo].[Ilceler] ([IlceID])
GO
ALTER TABLE [dbo].[Hastaneler] CHECK CONSTRAINT [FK_Hastaneler_Ilceler1]
GO
ALTER TABLE [dbo].[Hastaneler]  WITH CHECK ADD  CONSTRAINT [FK_Hastaneler_Poliklinkler] FOREIGN KEY([PoliklinkID])
REFERENCES [dbo].[Poliklinkler] ([PoliklinkID])
GO
ALTER TABLE [dbo].[Hastaneler] CHECK CONSTRAINT [FK_Hastaneler_Poliklinkler]
GO
ALTER TABLE [dbo].[Ilceler]  WITH CHECK ADD  CONSTRAINT [FK_Ilceler_Iller] FOREIGN KEY([ILID])
REFERENCES [dbo].[Iller] ([ILID])
GO
ALTER TABLE [dbo].[Ilceler] CHECK CONSTRAINT [FK_Ilceler_Iller]
GO
ALTER TABLE [dbo].[MuayeneBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneBilgileri_DoktorBilgileri] FOREIGN KEY([DoktorID])
REFERENCES [dbo].[DoktorBilgileri] ([DoktorID])
GO
ALTER TABLE [dbo].[MuayeneBilgileri] CHECK CONSTRAINT [FK_MuayeneBilgileri_DoktorBilgileri]
GO
ALTER TABLE [dbo].[MuayeneBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneBilgileri_HastaBilgileri] FOREIGN KEY([HastaID])
REFERENCES [dbo].[HastaBilgileri] ([HastaID])
GO
ALTER TABLE [dbo].[MuayeneBilgileri] CHECK CONSTRAINT [FK_MuayeneBilgileri_HastaBilgileri]
GO
ALTER TABLE [dbo].[MuayeneBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneBilgileri_Receteler] FOREIGN KEY([ReceteID])
REFERENCES [dbo].[Receteler] ([ReceteID])
GO
ALTER TABLE [dbo].[MuayeneBilgileri] CHECK CONSTRAINT [FK_MuayeneBilgileri_Receteler]
GO
ALTER TABLE [dbo].[MuayeneBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneBilgileri_Teshisler] FOREIGN KEY([TeshisID])
REFERENCES [dbo].[Teshisler] ([TeshisID])
GO
ALTER TABLE [dbo].[MuayeneBilgileri] CHECK CONSTRAINT [FK_MuayeneBilgileri_Teshisler]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_RandevuOlusturma] FOREIGN KEY([RandevuID])
REFERENCES [dbo].[RandevuOlusturma] ([RandevuID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_RandevuOlusturma]
GO
ALTER TABLE [dbo].[RandevuOlusturma]  WITH CHECK ADD  CONSTRAINT [FK_RandevuOlusturma_HastaBilgileri] FOREIGN KEY([HastaID])
REFERENCES [dbo].[HastaBilgileri] ([HastaID])
GO
ALTER TABLE [dbo].[RandevuOlusturma] CHECK CONSTRAINT [FK_RandevuOlusturma_HastaBilgileri]
GO
ALTER TABLE [dbo].[RandevuOlusturma]  WITH CHECK ADD  CONSTRAINT [FK_RandevuOlusturma_Hastaneler] FOREIGN KEY([HastanelerID])
REFERENCES [dbo].[Hastaneler] ([HastanelerID])
GO
ALTER TABLE [dbo].[RandevuOlusturma] CHECK CONSTRAINT [FK_RandevuOlusturma_Hastaneler]
GO
ALTER TABLE [dbo].[Receteler]  WITH CHECK ADD  CONSTRAINT [FK_Receteler_HastaBilgileri] FOREIGN KEY([HastaID])
REFERENCES [dbo].[HastaBilgileri] ([HastaID])
GO
ALTER TABLE [dbo].[Receteler] CHECK CONSTRAINT [FK_Receteler_HastaBilgileri]
GO
ALTER TABLE [dbo].[ReceteSorgulama]  WITH CHECK ADD  CONSTRAINT [FK_ReceteSorgulama_EczaneBilgileri] FOREIGN KEY([EczaneID])
REFERENCES [dbo].[EczaneBilgileri] ([EczaneID])
GO
ALTER TABLE [dbo].[ReceteSorgulama] CHECK CONSTRAINT [FK_ReceteSorgulama_EczaneBilgileri]
GO
ALTER TABLE [dbo].[ReceteSorgulama]  WITH CHECK ADD  CONSTRAINT [FK_ReceteSorgulama_Receteler] FOREIGN KEY([ReceteID])
REFERENCES [dbo].[Receteler] ([ReceteID])
GO
ALTER TABLE [dbo].[ReceteSorgulama] CHECK CONSTRAINT [FK_ReceteSorgulama_Receteler]
GO
ALTER TABLE [dbo].[Seanslar]  WITH CHECK ADD  CONSTRAINT [FK_Seanslar_Saatler] FOREIGN KEY([SaatID])
REFERENCES [dbo].[Saatler] ([SaatID])
GO
ALTER TABLE [dbo].[Seanslar] CHECK CONSTRAINT [FK_Seanslar_Saatler]
GO
ALTER TABLE [dbo].[UyeGirisi]  WITH CHECK ADD  CONSTRAINT [FK_UyeGirisi_Roller] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roller] ([RolID])
GO
ALTER TABLE [dbo].[UyeGirisi] CHECK CONSTRAINT [FK_UyeGirisi_Roller]
GO
USE [master]
GO
ALTER DATABASE [HastaneRandevuSistemi] SET  READ_WRITE 
GO
