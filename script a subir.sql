USE [master]
GO
/****** Object:  Database [EscuelaItinerante]    Script Date: 25/11/2018 14:56:47 ******/
CREATE DATABASE [EscuelaItinerante]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EscuelaItinerante', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\EscuelaItinerante.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EscuelaItinerante_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\EscuelaItinerante_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EscuelaItinerante] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EscuelaItinerante].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EscuelaItinerante] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET ARITHABORT OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EscuelaItinerante] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EscuelaItinerante] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EscuelaItinerante] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EscuelaItinerante] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EscuelaItinerante] SET  MULTI_USER 
GO
ALTER DATABASE [EscuelaItinerante] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EscuelaItinerante] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EscuelaItinerante] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EscuelaItinerante] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EscuelaItinerante] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EscuelaItinerante] SET QUERY_STORE = OFF
GO
USE [EscuelaItinerante]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EscuelaItinerante]
GO
/****** Object:  User [escuelaitinerante]    Script Date: 25/11/2018 14:56:47 ******/
CREATE USER [escuelaitinerante] FOR LOGIN [escuelaitinerante] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [escuelaitinerante]
GO
/****** Object:  Table [dbo].[talumno_comision_inscripto]    Script Date: 25/11/2018 14:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talumno_comision_inscripto](
	[Id_Comision] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[PrecioAAbonar] [decimal](18, 0) NOT NULL,
	[ObservacionesDelCurso] [varchar](500) NULL,
	[id_estado_cursada] [int] NOT NULL,
	[FechaInscripcion] [datetime] NOT NULL,
	[FechaUltimoEstado] [datetime] NOT NULL,
 CONSTRAINT [PK_inscripcion] PRIMARY KEY CLUSTERED 
(
	[Id_Comision] ASC,
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talumno_pago]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talumno_pago](
	[id_clase] [int] NOT NULL,
	[id_alumno] [int] NOT NULL,
	[id_comision] [int] NOT NULL,
	[MontoAbonado] [int] NOT NULL,
	[fechaPago] [datetime] NOT NULL,
 CONSTRAINT [PK_alumno_pago] PRIMARY KEY CLUSTERED 
(
	[id_clase] ASC,
	[id_alumno] ASC,
	[id_comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talumno_pago_parcial]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talumno_pago_parcial](
	[id_pago_parcial] [int] IDENTITY(1,1) NOT NULL,
	[id_clase] [int] NOT NULL,
	[id_alumno] [int] NOT NULL,
	[id_comision] [int] NOT NULL,
	[MontoAbonado] [int] NOT NULL,
	[fechaPago] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talumnos]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talumnos](
	[id_alumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NOT NULL,
	[Tipodoc] [varchar](max) NOT NULL,
	[NroDocumento] [int] NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[CodigoPostal] [int] NOT NULL,
	[Localidad] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Celular] [int] NULL,
	[Email] [varchar](255) NULL,
	[ComoNosConocio] [varchar](max) NULL,
	[EstadoCivil] [int] NULL,
	[Hijos] [int] NULL,
	[EstudiosRealizados] [varchar](max) NULL,
	[ConocidoEnInstituto] [varchar](max) NULL,
	[Observaciones] [varchar](max) NULL,
	[FechaIngreso] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcomisiones]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcomisiones](
	[id_comision] [int] IDENTITY(1,1) NOT NULL,
	[id_curso] [int] NOT NULL,
	[id_modalidad] [int] NOT NULL,
	[id_sede] [int] NOT NULL,
	[id_coordinador] [int] NOT NULL,
	[id_turno] [int] NOT NULL,
	[precio] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcomisiones_clases]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcomisiones_clases](
	[id_clase] [int] IDENTITY(1,1) NOT NULL,
	[id_comision] [int] NOT NULL,
	[fechaClase] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcomisiones_clases_temp]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcomisiones_clases_temp](
	[id_clase] [int] IDENTITY(1,1) NOT NULL,
	[id_comision] [int] NOT NULL,
	[fechaClase] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmcoordinador]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmcoordinador](
	[ID_coordinador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NULL,
	[Apellido] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_coordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmcurso]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmcurso](
	[ID_curso] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmestado_civil]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmestado_civil](
	[id_estado_civil] [int] NOT NULL,
	[Descripcion] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado_civil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmmodalidad]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmmodalidad](
	[ID_modalidad] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_modalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmsede]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmsede](
	[ID_sede] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_sede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmtipo_curso]    Script Date: 25/11/2018 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmtipo_curso](
	[ID_tipo_curso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_tipo_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmturnos]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmturnos](
	[ID_turno] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tusuarios]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tusuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_grupo] [int] NOT NULL,
 CONSTRAINT [PK_tusuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (106, 2011, CAST(1200 AS Decimal(18, 0)), N'', 3, CAST(N'2018-10-14T09:29:07.700' AS DateTime), CAST(N'2018-11-18T12:44:53.950' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (106, 5013, CAST(1200 AS Decimal(18, 0)), N'', 1, CAST(N'2018-11-17T19:23:31.820' AS DateTime), CAST(N'2018-11-17T19:23:31.820' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (112, 2011, CAST(2200 AS Decimal(18, 0)), N'Observaciones de curso', 2, CAST(N'2018-10-15T18:49:46.040' AS DateTime), CAST(N'2018-11-05T19:13:28.860' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (112, 5013, CAST(2200 AS Decimal(18, 0)), N'', 1, CAST(N'2018-11-17T19:34:15.447' AS DateTime), CAST(N'2018-11-17T19:34:15.447' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (120, 2011, CAST(1300 AS Decimal(18, 0)), N'curso', 1, CAST(N'2018-10-14T09:31:59.863' AS DateTime), CAST(N'2018-10-14T09:31:59.863' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (120, 4012, CAST(1300 AS Decimal(18, 0)), N'Observacion de curso
', 1, CAST(N'2018-11-12T20:26:22.473' AS DateTime), CAST(N'2018-11-12T20:26:22.473' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (120, 5012, CAST(1300 AS Decimal(18, 0)), N'', 1, CAST(N'2018-11-17T18:40:43.120' AS DateTime), CAST(N'2018-11-17T19:15:23.183' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (121, 5012, CAST(1400 AS Decimal(18, 0)), N'', 1, CAST(N'2018-11-17T18:49:41.183' AS DateTime), CAST(N'2018-11-17T18:49:41.183' AS DateTime))
INSERT [dbo].[talumno_comision_inscripto] ([Id_Comision], [ID_Alumno], [PrecioAAbonar], [ObservacionesDelCurso], [id_estado_cursada], [FechaInscripcion], [FechaUltimoEstado]) VALUES (121, 5014, CAST(1400 AS Decimal(18, 0)), N'Alba es la seño', 1, CAST(N'2018-11-18T12:31:22.527' AS DateTime), CAST(N'2018-11-18T12:31:22.527' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1, 2011, 120, 700, CAST(N'2018-10-15T18:51:29.470' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1, 5012, 120, 0, CAST(N'2018-11-17T19:00:02.503' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (2, 2011, 120, 1400, CAST(N'2018-10-15T18:52:13.327' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3, 2011, 120, 1300, CAST(N'2018-10-15T18:58:01.260' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (4, 2011, 120, 1300, CAST(N'2018-10-15T18:58:12.000' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (5, 2011, 120, 1300, CAST(N'2018-10-15T18:58:22.417' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (6, 2011, 120, 1300, CAST(N'2018-10-15T18:58:31.707' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (7, 2011, 120, 1300, CAST(N'2018-10-15T18:58:39.703' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (8, 2011, 120, 1300, CAST(N'2018-10-15T18:58:45.730' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (9, 2011, 120, 1300, CAST(N'2018-10-15T18:58:53.230' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (10, 2011, 120, 1300, CAST(N'2018-10-15T18:59:01.177' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (11, 2011, 120, 1300, CAST(N'2018-10-15T18:59:15.207' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (12, 2011, 120, 1300, CAST(N'2018-10-15T18:59:21.230' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (13, 2011, 120, 1300, CAST(N'2018-10-15T18:59:30.227' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (14, 2011, 120, 1300, CAST(N'2018-10-15T18:59:36.137' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (15, 2011, 120, 1300, CAST(N'2018-10-15T18:59:41.523' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (16, 2011, 120, 1300, CAST(N'2018-10-15T18:59:47.437' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (17, 2011, 120, 1300, CAST(N'2018-10-15T18:59:52.553' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (18, 2011, 120, 1300, CAST(N'2018-10-15T18:59:58.660' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (19, 2011, 120, 1300, CAST(N'2018-10-15T19:00:04.067' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (20, 2011, 120, 1300, CAST(N'2018-10-15T19:00:08.693' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (21, 2011, 120, 1300, CAST(N'2018-10-15T19:00:13.810' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (22, 2011, 120, 1300, CAST(N'2018-10-15T19:00:19.080' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (23, 2011, 120, 1300, CAST(N'2018-10-15T19:00:23.717' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (24, 2011, 120, 1300, CAST(N'2018-10-15T19:00:29.850' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (25, 2011, 120, 1300, CAST(N'2018-10-15T19:00:38.423' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (26, 2011, 120, 1300, CAST(N'2018-10-15T19:00:43.737' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (27, 2011, 120, 1300, CAST(N'2018-10-15T19:00:48.543' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (28, 2011, 120, 1300, CAST(N'2018-10-15T19:00:54.850' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (29, 2011, 120, 1300, CAST(N'2018-10-15T19:00:59.457' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (30, 2011, 120, 1300, CAST(N'2018-10-15T19:01:03.560' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (31, 2011, 120, 1300, CAST(N'2018-10-15T19:01:08.690' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (32, 2011, 120, 1300, CAST(N'2018-10-15T19:01:12.840' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (33, 2011, 120, 1300, CAST(N'2018-10-15T19:01:17.300' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (34, 2011, 120, 1300, CAST(N'2018-10-15T19:01:21.653' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (35, 2011, 120, 1300, CAST(N'2018-10-15T19:01:26.027' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (36, 2011, 120, 1300, CAST(N'2018-10-15T19:01:30.700' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (37, 2011, 120, 1300, CAST(N'2018-10-15T19:01:37.533' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (38, 2011, 120, 1300, CAST(N'2018-10-15T19:01:41.687' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (39, 2011, 120, 1300, CAST(N'2018-10-15T19:01:46.050' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (40, 2011, 120, 1300, CAST(N'2018-10-15T19:01:50.850' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (41, 2011, 120, 1300, CAST(N'2018-10-15T20:35:26.153' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (42, 2011, 120, 1300, CAST(N'2018-10-17T21:23:31.713' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (43, 2011, 120, 1500, CAST(N'2018-10-24T17:23:56.820' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (44, 2011, 120, 1300, CAST(N'2018-11-05T12:40:47.543' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (45, 2011, 120, 1300, CAST(N'2018-11-12T21:42:36.400' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (46, 2011, 120, 1300, CAST(N'2018-11-17T18:46:05.887' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (47, 2011, 120, 1300, CAST(N'2018-11-18T12:00:27.310' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (158, 5012, 121, 700, CAST(N'2018-11-17T18:52:45.097' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (158, 5014, 121, 1400, CAST(N'2018-11-18T12:31:48.073' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (159, 5012, 121, 1400, CAST(N'2018-11-17T18:53:15.137' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (159, 5014, 121, 1400, CAST(N'2018-11-18T12:31:57.087' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (160, 5012, 121, 1400, CAST(N'2018-11-17T18:54:03.020' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (160, 5014, 121, 1400, CAST(N'2018-11-18T12:32:09.177' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (161, 5012, 121, 2800, CAST(N'2018-11-17T18:55:58.507' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (161, 5014, 121, 1400, CAST(N'2018-11-18T12:32:16.810' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (162, 5012, 121, 1400, CAST(N'2018-11-17T19:00:58.533' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (162, 5014, 121, 1400, CAST(N'2018-11-18T12:32:24.980' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (163, 5012, 121, 1500, CAST(N'2018-11-17T19:01:29.950' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (163, 5014, 121, 1400, CAST(N'2018-11-18T12:32:37.123' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (164, 5014, 121, 1400, CAST(N'2018-11-18T12:32:43.157' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (165, 5014, 121, 1400, CAST(N'2018-11-18T12:32:47.480' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (166, 5014, 121, 1400, CAST(N'2018-11-18T12:32:52.010' AS DateTime))
INSERT [dbo].[talumno_pago] ([id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (167, 5014, 121, 1400, CAST(N'2018-11-18T12:32:56.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[talumno_pago_parcial] ON 

INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1, 43, 2011, 120, 1200, CAST(N'2018-10-22T20:37:02.437' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (2, 43, 2011, 120, 1200, CAST(N'2018-10-22T20:38:14.740' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3, 43, 2011, 120, 1200, CAST(N'2018-10-22T20:38:47.090' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (4, 43, 2011, 120, 1200, CAST(N'2018-10-22T20:44:16.300' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (5, 43, 2011, 120, 123, CAST(N'2018-10-22T21:25:25.110' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (6, 43, 2011, 120, 1200, CAST(N'2018-10-23T14:42:31.620' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1002, 44, 2011, 120, 154, CAST(N'2018-11-05T12:34:32.287' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1003, 44, 2011, 120, 200, CAST(N'2018-11-05T12:37:00.843' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (1004, 44, 2011, 120, 700, CAST(N'2018-11-05T12:37:37.480' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (2002, 45, 2011, 120, 20000, CAST(N'2018-11-12T20:52:02.407' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (2003, 45, 2011, 120, 1200, CAST(N'2018-11-12T20:55:31.640' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3002, 1, 5012, 120, 500, CAST(N'2018-11-17T18:42:55.520' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3003, 1, 5012, 120, 100, CAST(N'2018-11-17T18:44:37.147' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3004, 1, 5012, 120, 800, CAST(N'2018-11-17T18:45:21.020' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3005, 158, 5012, 121, 700, CAST(N'2018-11-17T18:50:14.293' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3006, 1, 5012, 120, 1300, CAST(N'2018-11-17T18:58:33.470' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3007, 164, 5012, 121, 100, CAST(N'2018-11-17T19:02:34.620' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3008, 164, 5012, 121, 1300, CAST(N'2018-11-17T19:02:55.600' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3009, 2, 5012, 120, 100, CAST(N'2018-11-17T19:03:39.903' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (3010, 47, 2011, 120, 1000, CAST(N'2018-11-18T12:00:14.513' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (7, 44, 2011, 120, 0, CAST(N'2018-10-24T17:50:39.437' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (8, 44, 2011, 120, 123, CAST(N'2018-10-24T17:54:35.950' AS DateTime))
INSERT [dbo].[talumno_pago_parcial] ([id_pago_parcial], [id_clase], [id_alumno], [id_comision], [MontoAbonado], [fechaPago]) VALUES (9, 44, 2011, 120, 123, CAST(N'2018-10-24T17:54:50.783' AS DateTime))
SET IDENTITY_INSERT [dbo].[talumno_pago_parcial] OFF
SET IDENTITY_INSERT [dbo].[talumnos] ON 

INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (2011, N'Matias', N'Azcui', N'DNI', 37835500, N'H primo', 1233, N'Lanus', 1131286452, 42622580, N'matias.azcui@gmail.com', N'google', 1, 0, N'Secundario', N'Sin conocidos', N'Observación del alumno', N'Sep 29 2018  3:29PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (2012, N'leo', N'messi', N'DNI', 43567890, N'salta 456', 1663, N'san miguel', 1534764167, 14567864, N'albertolaz1515@yahoo.com.ar', N'web', 1, 3, N'secundario completo', N'la madre', N'Observaciones del alumno', N'Oct  6 2018  3:15PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (3012, N'Lucas', N'Lopez', N'DNI', 11233554, N'Direción', 2019, N'Lanus', 1234577, 126796, N'matuas@asd.com', N'Como nos conoció', 1, 1, N'no', N'Hermaon', N'Muchas', N'Nov  5 2018  8:15PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (4012, N'Lucas', N'Lopez', N'DNI', 12345678, N'Delia 1233', 1824, N'Lanus', 12321548, 13215486, N'matias.azcui@gmail.com', N'Por internet', 1, 0, N'No', N'Conocido', N'Observaciones', N'Nov 12 2018  8:22PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (5012, N'Catalina', N'Diaz', N'DNI', 37979999, N'baez 102', 1824, N'lanus', 42424242, 155555555, N'cata@gmail.com', N'web', 1, 0, N'0', N'-', N'-', N'Nov 17 2018  6:39PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (5013, N'juan', N'perez', N'DNI', 38888888, N'cordoba', 10, N'oeste', 55421, 45456471, N'jkfsdjfsdkl@sdajhdj.com', N'web', 5, 5, N'universitario', N'si', N'no', N'Nov 17 2018  7:18PM')
INSERT [dbo].[talumnos] ([id_alumno], [Nombre], [Apellido], [Tipodoc], [NroDocumento], [Direccion], [CodigoPostal], [Localidad], [Telefono], [Celular], [Email], [ComoNosConocio], [EstadoCivil], [Hijos], [EstudiosRealizados], [ConocidoEnInstituto], [Observaciones], [FechaIngreso]) VALUES (5014, N'Matias', N'Hermano', N'DNI', 37835501, N'Segui', 1824, N'Lanus', 1131286452, 113215648, N'matias.azcui@gmail.com', N'en google', 1, 0, N'oasdasd', N'', N'Es el hermano de mati azc', N'Nov 18 2018 12:04PM')
SET IDENTITY_INSERT [dbo].[talumnos] OFF
SET IDENTITY_INSERT [dbo].[tcomisiones] ON 

INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (105, 1, 2, 3, 1, 1, CAST(1350 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (106, 1, 2, 1, 3, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (107, 1, 2, 4, 12, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (108, 1, 2, 4, 12, 2, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (109, 1, 2, 2, 12, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (110, 1, 2, 2, 12, 2, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (111, 1, 2, 3, 12, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (112, 1, 2, 1, 12, 1, CAST(2200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (113, 1, 2, 3, 15, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (114, 1, 2, 1, 15, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (115, 1, 2, 1, 18, 1, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (116, 1, 2, 1, 18, 2, CAST(2200 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (117, 1, 1, 1, 1, 3, CAST(2300 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (118, 1, 1, 1, 1, 2, CAST(2300 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (119, 1, 1, 1, 12, 3, CAST(11300 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (120, 1, 1, 1, 12, 2, CAST(1300 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (121, 2, 2, 3, 2, 1, CAST(1400 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (122, 2, 1, 1, 19, 3, CAST(1400 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (123, 3, 2, 1, 9, 1, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (124, 4, 1, 1, 8, 3, CAST(1600 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (125, 5, 2, 1, 1, 1, CAST(2700 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (126, 5, 2, 1, 5, 1, CAST(1700 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (127, 5, 2, 1, 14, 1, CAST(3700 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (128, 6, 2, 4, 3, 1, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (129, 6, 2, 4, 4, 1, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (130, 6, 2, 3, 4, 1, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (131, 6, 2, 3, 5, 1, CAST(3800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (132, 6, 2, 2, 6, 1, CAST(4800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (133, 6, 2, 3, 7, 1, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (134, 6, 2, 1, 7, 1, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (135, 6, 2, 4, 10, 1, CAST(1800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (136, 6, 2, 2, 10, 1, CAST(1800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (137, 6, 2, 3, 10, 1, CAST(1800 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (138, 6, 2, 1, 10, 1, CAST(3900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (139, 6, 2, 4, 11, 1, CAST(3900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (140, 6, 2, 2, 11, 1, CAST(3900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (141, 6, 2, 3, 13, 1, CAST(4900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (142, 6, 2, 2, 16, 1, CAST(2900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (143, 6, 2, 1, 16, 1, CAST(2900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (144, 6, 2, 4, 17, 1, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (145, 6, 2, 3, 17, 1, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (146, 6, 2, 1, 17, 1, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (147, 6, 2, 3, 18, 1, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (148, 6, 2, 4, 20, 1, CAST(4900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (149, 6, 1, 1, 7, 2, CAST(2900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (150, 6, 1, 1, 7, 3, CAST(2900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (151, 6, 1, 1, 10, 2, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (152, 6, 1, 1, 17, 2, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (153, 6, 1, 1, 17, 3, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (154, 6, 1, 1, 18, 3, CAST(2900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (155, 6, 1, 1, 20, 2, CAST(3900 AS Decimal(18, 0)))
INSERT [dbo].[tcomisiones] ([id_comision], [id_curso], [id_modalidad], [id_sede], [id_coordinador], [id_turno], [precio]) VALUES (156, 6, 1, 1, 20, 3, CAST(3900 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tcomisiones] OFF
SET IDENTITY_INSERT [dbo].[tcomisiones_clases] ON 

INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (1, 120, CAST(N'2018-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (2, 120, CAST(N'2018-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (3, 120, CAST(N'2018-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (4, 120, CAST(N'2018-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (5, 120, CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (6, 120, CAST(N'2018-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (7, 120, CAST(N'2018-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (8, 120, CAST(N'2018-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (9, 120, CAST(N'2018-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (10, 120, CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (11, 120, CAST(N'2018-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (12, 120, CAST(N'2018-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (13, 120, CAST(N'2018-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (14, 120, CAST(N'2018-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (15, 120, CAST(N'2018-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (16, 120, CAST(N'2018-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (17, 120, CAST(N'2018-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (18, 120, CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (19, 120, CAST(N'2018-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (20, 120, CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (21, 120, CAST(N'2018-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (22, 120, CAST(N'2018-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (23, 120, CAST(N'2018-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (24, 120, CAST(N'2018-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (25, 120, CAST(N'2018-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (26, 120, CAST(N'2018-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (27, 120, CAST(N'2018-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (28, 120, CAST(N'2018-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (29, 120, CAST(N'2018-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (30, 120, CAST(N'2018-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (31, 120, CAST(N'2018-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (32, 120, CAST(N'2018-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (33, 120, CAST(N'2018-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (34, 120, CAST(N'2018-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (35, 120, CAST(N'2018-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (36, 120, CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (37, 120, CAST(N'2018-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (38, 120, CAST(N'2018-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (39, 120, CAST(N'2018-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (40, 120, CAST(N'2018-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (41, 120, CAST(N'2018-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (42, 120, CAST(N'2018-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (43, 120, CAST(N'2018-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (44, 120, CAST(N'2018-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (45, 120, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (46, 120, CAST(N'2018-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (47, 120, CAST(N'2018-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (48, 120, CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (49, 120, CAST(N'2018-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (50, 120, CAST(N'2018-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (51, 120, CAST(N'2018-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (52, 120, CAST(N'2018-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (106, 151, CAST(N'2018-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (107, 151, CAST(N'2018-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (108, 151, CAST(N'2018-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (109, 151, CAST(N'2018-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (110, 151, CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (111, 151, CAST(N'2018-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (112, 151, CAST(N'2018-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (113, 151, CAST(N'2018-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (114, 151, CAST(N'2018-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (115, 151, CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (116, 151, CAST(N'2018-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (117, 151, CAST(N'2018-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (118, 151, CAST(N'2018-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (119, 151, CAST(N'2018-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (120, 151, CAST(N'2018-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (121, 151, CAST(N'2018-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (122, 151, CAST(N'2018-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (123, 151, CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (124, 151, CAST(N'2018-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (125, 151, CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (126, 151, CAST(N'2018-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (127, 151, CAST(N'2018-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (128, 151, CAST(N'2018-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (129, 151, CAST(N'2018-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (130, 151, CAST(N'2018-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (131, 151, CAST(N'2018-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (132, 151, CAST(N'2018-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (133, 151, CAST(N'2018-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (134, 151, CAST(N'2018-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (135, 151, CAST(N'2018-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (136, 151, CAST(N'2018-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (137, 151, CAST(N'2018-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (138, 151, CAST(N'2018-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (139, 151, CAST(N'2018-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (140, 151, CAST(N'2018-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (141, 151, CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (142, 151, CAST(N'2018-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (143, 151, CAST(N'2018-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (144, 151, CAST(N'2018-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (145, 151, CAST(N'2018-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (146, 151, CAST(N'2018-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (147, 151, CAST(N'2018-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (148, 151, CAST(N'2018-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (149, 151, CAST(N'2018-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (150, 151, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (151, 151, CAST(N'2018-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (152, 151, CAST(N'2018-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (153, 151, CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (154, 151, CAST(N'2018-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (155, 151, CAST(N'2018-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (156, 151, CAST(N'2018-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (157, 151, CAST(N'2018-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (158, 121, CAST(N'2018-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (159, 121, CAST(N'2018-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (160, 121, CAST(N'2018-03-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (161, 121, CAST(N'2018-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (162, 121, CAST(N'2018-05-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (163, 121, CAST(N'2018-06-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (164, 121, CAST(N'2018-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (165, 121, CAST(N'2018-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (166, 121, CAST(N'2018-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (167, 121, CAST(N'2018-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (168, 121, CAST(N'2018-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases] ([id_clase], [id_comision], [fechaClase]) VALUES (169, 121, CAST(N'2018-12-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tcomisiones_clases] OFF
SET IDENTITY_INSERT [dbo].[tcomisiones_clases_temp] ON 

INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (1, 120, CAST(N'2018-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (2, 120, CAST(N'2018-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (3, 120, CAST(N'2018-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (4, 120, CAST(N'2018-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (5, 120, CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (6, 120, CAST(N'2018-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (7, 120, CAST(N'2018-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (8, 120, CAST(N'2018-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (9, 120, CAST(N'2018-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (10, 120, CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (11, 120, CAST(N'2018-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (12, 120, CAST(N'2018-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (13, 120, CAST(N'2018-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (14, 120, CAST(N'2018-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (15, 120, CAST(N'2018-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (16, 120, CAST(N'2018-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (17, 120, CAST(N'2018-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (18, 120, CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (19, 120, CAST(N'2018-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (20, 120, CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (21, 120, CAST(N'2018-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (22, 120, CAST(N'2018-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (23, 120, CAST(N'2018-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (24, 120, CAST(N'2018-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (25, 120, CAST(N'2018-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (26, 120, CAST(N'2018-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (27, 120, CAST(N'2018-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (28, 120, CAST(N'2018-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (29, 120, CAST(N'2018-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (30, 120, CAST(N'2018-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (31, 120, CAST(N'2018-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (32, 120, CAST(N'2018-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (33, 120, CAST(N'2018-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (34, 120, CAST(N'2018-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (35, 120, CAST(N'2018-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (36, 120, CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (37, 120, CAST(N'2018-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (38, 120, CAST(N'2018-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (39, 120, CAST(N'2018-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (1002, 120, CAST(N'2018-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (41, 120, CAST(N'2018-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (42, 120, CAST(N'2018-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (43, 120, CAST(N'2018-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (44, 120, CAST(N'2018-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (45, 120, CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (46, 120, CAST(N'2018-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (47, 120, CAST(N'2018-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (48, 120, CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (49, 120, CAST(N'2018-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (50, 120, CAST(N'2018-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (51, 120, CAST(N'2018-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tcomisiones_clases_temp] ([id_clase], [id_comision], [fechaClase]) VALUES (52, 120, CAST(N'2018-12-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tcomisiones_clases_temp] OFF
SET IDENTITY_INSERT [dbo].[tmcoordinador] ON 

INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (1, N'Adriana', N'Dorrego')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (2, N'Alba', NULL)
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (3, N'Alcira', N'Solaligue')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (4, N'Alicia', N'Eidelman')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (5, N'Ana', N'Garay')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (6, N'Carlos', N'Margiotta')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (7, N'Claudia', N'Izquierdo')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (8, N'Darian', N'Spalla')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (9, N'Eduardo', N'Laurenzi')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (10, N'Garciala', N'Petrella')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (11, N'JoseLuis', N'Cajal')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (12, N'Lilian', N'CanoGonzalez')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (13, N'Luly', N'Barcia')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (14, N'Marcela', N'Guala')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (15, N'Mirta', N'Priori')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (16, N'Monica', N'Caccione')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (17, N'Nancy', N'Portilla')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (18, N'Raquel', N'Acedo')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (19, N'Sabrina', N'Keller')
INSERT [dbo].[tmcoordinador] ([ID_coordinador], [Nombre], [Apellido]) VALUES (20, N'Sandra', N'Palacio')
SET IDENTITY_INSERT [dbo].[tmcoordinador] OFF
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (1, N'Acompañante_Terapeutico')
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (2, N'Diplomatura')
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (3, N'Operador_Socio_Comunitario')
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (4, N'P_N_L')
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (5, N'Psicodrama')
INSERT [dbo].[tmcurso] ([ID_curso], [Descripcion]) VALUES (6, N'Psicologia_Social')
INSERT [dbo].[tmestado_civil] ([id_estado_civil], [Descripcion]) VALUES (1, N'Soltero/a')
INSERT [dbo].[tmestado_civil] ([id_estado_civil], [Descripcion]) VALUES (2, N'Casado/a')
INSERT [dbo].[tmestado_civil] ([id_estado_civil], [Descripcion]) VALUES (3, N'Divorciado/a')
INSERT [dbo].[tmestado_civil] ([id_estado_civil], [Descripcion]) VALUES (4, N'Viudo/a')
INSERT [dbo].[tmestado_civil] ([id_estado_civil], [Descripcion]) VALUES (5, N'Otro')
INSERT [dbo].[tmmodalidad] ([ID_modalidad], [Descripcion]) VALUES (1, N'Semanal')
INSERT [dbo].[tmmodalidad] ([ID_modalidad], [Descripcion]) VALUES (2, N'Mensual')
SET IDENTITY_INSERT [dbo].[tmsede] ON 

INSERT [dbo].[tmsede] ([ID_sede], [Descripcion]) VALUES (1, N'San miguel')
INSERT [dbo].[tmsede] ([ID_sede], [Descripcion]) VALUES (2, N'Mercedes')
INSERT [dbo].[tmsede] ([ID_sede], [Descripcion]) VALUES (3, N'Moreno')
INSERT [dbo].[tmsede] ([ID_sede], [Descripcion]) VALUES (4, N'Campana')
SET IDENTITY_INSERT [dbo].[tmsede] OFF
SET IDENTITY_INSERT [dbo].[tmtipo_curso] ON 

INSERT [dbo].[tmtipo_curso] ([ID_tipo_curso], [Descripcion]) VALUES (1, N'Semanal')
INSERT [dbo].[tmtipo_curso] ([ID_tipo_curso], [Descripcion]) VALUES (2, N'Mensual')
SET IDENTITY_INSERT [dbo].[tmtipo_curso] OFF
SET IDENTITY_INSERT [dbo].[tmturnos] ON 

INSERT [dbo].[tmturnos] ([ID_turno], [Descripcion]) VALUES (1, N'Mañana')
INSERT [dbo].[tmturnos] ([ID_turno], [Descripcion]) VALUES (2, N'Tarde')
INSERT [dbo].[tmturnos] ([ID_turno], [Descripcion]) VALUES (3, N'Noche')
SET IDENTITY_INSERT [dbo].[tmturnos] OFF
SET IDENTITY_INSERT [dbo].[tusuarios] ON 

INSERT [dbo].[tusuarios] ([id_usuario], [username], [password], [id_grupo]) VALUES (1, N'administrador', N'12345', 1)
INSERT [dbo].[tusuarios] ([id_usuario], [username], [password], [id_grupo]) VALUES (2, N'rcasco', N'soft2018', 1)
INSERT [dbo].[tusuarios] ([id_usuario], [username], [password], [id_grupo]) VALUES (3, N'mfernandez', N'2018soft', 1)
INSERT [dbo].[tusuarios] ([id_usuario], [username], [password], [id_grupo]) VALUES (4, N'jcasco', N'sys2018', 1)
INSERT [dbo].[tusuarios] ([id_usuario], [username], [password], [id_grupo]) VALUES (5, N'cmilman', N'2018sys', 1)
SET IDENTITY_INSERT [dbo].[tusuarios] OFF
/****** Object:  Index [documento]    Script Date: 25/11/2018 14:56:49 ******/
ALTER TABLE [dbo].[talumnos] ADD  CONSTRAINT [documento] UNIQUE NONCLUSTERED 
(
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[talumno_comision_inscripto]  WITH CHECK ADD FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[talumnos] ([id_alumno])
GO
ALTER TABLE [dbo].[talumno_comision_inscripto]  WITH CHECK ADD FOREIGN KEY([Id_Comision])
REFERENCES [dbo].[tcomisiones] ([id_comision])
GO
ALTER TABLE [dbo].[talumno_pago]  WITH CHECK ADD FOREIGN KEY([id_alumno])
REFERENCES [dbo].[talumnos] ([id_alumno])
GO
ALTER TABLE [dbo].[talumno_pago]  WITH CHECK ADD FOREIGN KEY([id_clase])
REFERENCES [dbo].[tcomisiones_clases] ([id_clase])
GO
ALTER TABLE [dbo].[talumno_pago]  WITH CHECK ADD FOREIGN KEY([id_comision])
REFERENCES [dbo].[tcomisiones] ([id_comision])
GO
ALTER TABLE [dbo].[talumno_pago_parcial]  WITH CHECK ADD FOREIGN KEY([id_alumno])
REFERENCES [dbo].[talumnos] ([id_alumno])
GO
ALTER TABLE [dbo].[talumno_pago_parcial]  WITH CHECK ADD FOREIGN KEY([id_clase])
REFERENCES [dbo].[tcomisiones_clases] ([id_clase])
GO
ALTER TABLE [dbo].[talumno_pago_parcial]  WITH CHECK ADD FOREIGN KEY([id_comision])
REFERENCES [dbo].[tcomisiones] ([id_comision])
GO
ALTER TABLE [dbo].[talumnos]  WITH CHECK ADD FOREIGN KEY([EstadoCivil])
REFERENCES [dbo].[tmestado_civil] ([id_estado_civil])
GO
ALTER TABLE [dbo].[tcomisiones_clases]  WITH CHECK ADD FOREIGN KEY([id_comision])
REFERENCES [dbo].[tcomisiones] ([id_comision])
GO
/****** Object:  StoredProcedure [dbo].[sp_helpcien]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------
Create Procedure [dbo].[sp_helpcien]
@sys sysname
As
Declare @SQL nVarChar(100)
Select @SQL = 'Select Top 100 * From ' + @sys
Exec SP_ExecuteSQL @SQL
Return
















GO
/****** Object:  StoredProcedure [dbo].[sp_helpcol]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_helpcol]
@cadena varchar(50)= null
as
select distinct t.name
from sysobjects t, syscolumns c
where  t.id = c.id and
c.name like isnull(@cadena,'%') and
t.type = 'U'
return
GO
/****** Object:  StoredProcedure [dbo].[sp_helpcomision]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_helpcomision]
 @id_comision int = 0
as    
	select	id_comision,
			Precio,
			Nombre,
			Apellido,
			tmcurso.Descripcion as Curso,
			tmsede.Descripcion as Sede,
			tmturnos.Descripcion as Turno,
			tmmodalidad.Descripcion as Modalidad
	from	tcomisiones
	inner join tmcoordinador on tcomisiones.id_coordinador = tmcoordinador.id_coordinador
	inner join tmcurso on tcomisiones.id_curso = tmcurso.id_curso
	inner join tmsede on tcomisiones.id_sede = tmsede.id_sede
	inner join tmturnos on tcomisiones.id_turno = tmturnos.id_turno
	inner join tmmodalidad on tcomisiones.id_modalidad = tmmodalidad.id_modalidad
	where @id_comision = 0 or id_comision = @id_comision
	order by Curso, Sede, Turno
return
GO
/****** Object:  StoredProcedure [dbo].[sp_helpsp]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------
CREATE Procedure [dbo].[sp_helpsp]
@cadena varchar(50) = null,
@incluir_trigger int = 0
As

Select t.name, type
from sysobjects t
where
t.name like isnull(@cadena, '%') And
(t.type = 'P' Or t.type = 'FN' Or
(@incluir_trigger = 1 And t.type = 'TR'))
Order By t.name

Return
GO
/****** Object:  StoredProcedure [dbo].[sp_helpspd]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_helpspd]  
 @cadena varchar(50)= null,  
 @incluir_trigger int = 0,  
 @incluir_views int =0,  
 @incluir_funciones int =0  
as  
 select a.name  
 from sysobjects a,  
   syscomments b  
 where a.id = b.id and  
   (  
    a.type = 'P' Or  
    (@incluir_trigger = 1 And a.type = 'TR') or  
    (@incluir_views = 1 and a.type = 'V') or  
    (@incluir_funciones = 1 and a.type In ('FN', 'FS', 'FT'))  
   ) and  
   a.name like 's%' and  
   b.text like isnull(@cadena,'%')  
group by a.name  
return
GO
/****** Object:  StoredProcedure [dbo].[sp_helptab]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_helptab]
@cadena varchar(50)= null
as

select t.name
from sysobjects t
where t.name like isnull(@cadena, '%') and
t.type = 'U'
Order by t.name

Return
GO
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_comision_inscripto]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_i_talumno_comision_inscripto]
 @id_comision int,      
 @id_alumno int,      
 @PrecioAAbonar decimal,
 @id_estado_cursada decimal,      
 @ObservacionesDeLaInscripcion VARCHAR(255)      
      
as         
 IF not EXISTS (select * from talumno_comision_inscripto where id_comision = @id_comision and ID_Alumno = @id_alumno)  
  BEGIN  
   insert into talumno_comision_inscripto values (@id_comision, @id_alumno, @PrecioAAbonar, @ObservacionesDeLaInscripcion, @id_estado_cursada, getdate(), getdate())   
   select 1  
  END  
  
 select 0  

GO
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_pago]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_i_talumno_pago]  
 @id_comision int,        
 @id_alumno int,        
 @id_clase int,
 @MontoAbonado int  
as        
     
 IF not EXISTS (select * from talumno_pago where id_comision = @id_comision and ID_Alumno = @id_alumno and id_clase = @id_clase)    
  BEGIN    
   insert into talumno_pago values (@id_clase, @id_alumno, @id_comision, @MontoAbonado, getdate())     
   select 1    
  END    
    
 select 0
GO
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_pago_parcial]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_i_talumno_pago_parcial]    
 @id_comision int,          
 @id_alumno int,          
 @id_clase int,  
 @MontoAbonado int    
as          
       
   insert into talumno_pago_parcial values (@id_clase, @id_alumno, @id_comision, @MontoAbonado, getdate())       
GO
/****** Object:  StoredProcedure [dbo].[sp_i_talumnos]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_i_talumnos]
	@Nombre VARCHAR(255) ,
	@Apellido VARCHAR(255) ,
	@Tipodoc VARCHAR(MAX) ,
	@NroDocumento INTEGER ,
	@Direccion VARCHAR(255) ,
	@CodigoPostal INTEGER ,
	@Localidad VARCHAR(50) ,
	@Telefono integer ,
	@Celular integer ,
	@Email VARCHAR(255) ,
	@ComoNosConocio VARCHAR(MAX) ,
	@EstadoCivil int,
	@Hijos int,
	@EstudiosRealizados VARCHAR(MAX) ,
	@ConocidoEnInstituto VARCHAR(MAX) ,
	@Observaciones VARCHAR(MAX)
as	

	insert into talumnos values (@Nombre, @Apellido, @Tipodoc, @NroDocumento, @Direccion, 
	@CodigoPostal, @Localidad, @Telefono, @Celular, @Email, @ComoNosConocio, @EstadoCivil, 
	@Hijos, @EstudiosRealizados, @ConocidoEnInstituto, @Observaciones, getdate())

GO
/****** Object:  StoredProcedure [dbo].[sp_italumnos]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_italumnos]
	@Nombre	varchar(50),
	@Apellido	varchar(50),
	@Tipodoc	int,
	@NroDocumento	int,
	@Dirección	varchar(50),
	@codigopostal	int,
	@Localidad	varchar(50),
	@Telefono	int,
	@Celular	int,
	@TelLaboral	int,
	@Email	varchar(50),
	@ComoNosConocio	varchar(50),
	@EstadoCivil	int,
	@Hijos	int,
	@EstudiosRealizados	varchar(200),
	@Experiencias	varchar(200),
	@Expectativas	varchar(200),
	@ConocidoEnInstituto	varchar(200),
	@Observaciones	varchar(300)
as
	insert into talumnos values (@Nombre,@Apellido,@Tipodoc,@NroDocumento,@Dirección,@codigopostal,@Localidad,@Telefono,@Celular,@TelLaboral,@Email,@ComoNosConocio,@EstadoCivil,@Hijos,@EstudiosRealizados,@Experiencias,@Expectativas,@ConocidoEnInstituto,@Observaciones, getdate())
GO
/****** Object:  StoredProcedure [dbo].[sp_talumno_comision]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_talumno_comision]        
 @id_comision int = 0      
as             
    
select  max(fechaClase) as FechaClasePaga, id_alumno    
into  #UltimaFechaClaseNOPaga    
from  tcomisiones_clases    
right outer join talumno_pago on tcomisiones_clases.id_clase = talumno_pago.id_clase and tcomisiones_clases.id_comision = talumno_pago.id_comision    
where  talumno_pago.id_comision = @id_comision    
group by id_alumno    
                      
select  *        
from  talumnos         
inner join talumno_comision_inscripto on talumnos.id_alumno = talumno_comision_inscripto.id_alumno    
left join #UltimaFechaClaseNOPaga on talumnos.id_alumno = #UltimaFechaClaseNOPaga.id_alumno    
where  id_comision = @id_comision        
   or @id_comision  = 0    
    
drop table #UltimaFechaClaseNOPaga
GO
/****** Object:  StoredProcedure [dbo].[sp_talumno_comision_inscripto]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_talumno_comision_inscripto]                   
 @id_alumno int = 0  
as         
  
select		*             
from		talumno_comision_inscripto         
inner join	tcomisiones on tcomisiones.id_comision = talumno_comision_inscripto.id_comision            
where		ID_Alumno = @id_alumno or @id_alumno = 0 
GO
/****** Object:  StoredProcedure [dbo].[sp_talumno_pago_clase]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_talumno_pago_clase]  
 @id_comision int,  
 @id_alumno int  
as            
  
 select  sum(montoAbonado) SumaPagosParcialesRealizados,  
    id_clase,  
    id_alumno,  
    id_comision  
 into  #SumaDeMontosParciales  
 from  talumno_pago_parcial   
 where  id_comision = @id_comision           
    and id_alumno = @id_alumno
 group by id_clase,  
    id_alumno,  
    id_comision  
  
 select  tcomisiones_clases.id_comision,  
    fechaClase,  
    talumno_pago.id_alumno,  
    tcomisiones_clases.id_clase,  
    SumaPagosParcialesRealizados,  
    fechaPago  
 from  tcomisiones_clases  
 left join talumno_pago on talumno_pago.id_comision = tcomisiones_clases.id_comision  
        and talumno_pago.id_clase = tcomisiones_clases.id_clase  
		and talumno_pago.id_alumno = @id_alumno
 left join #SumaDeMontosParciales on #SumaDeMontosParciales.id_clase = tcomisiones_clases.id_clase  
          and #SumaDeMontosParciales.id_alumno = @id_alumno  
          and #SumaDeMontosParciales.id_comision = tcomisiones_clases.id_comision  
 where  tcomisiones_clases.id_comision = @id_comision  
    and (talumno_pago.id_alumno = @id_alumno or talumno_pago.id_alumno is null)  
   
  
 drop table #SumaDeMontosParciales
GO
/****** Object:  StoredProcedure [dbo].[sp_talumnos]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_talumnos]  
	@nroDocumento int = 0,
	@id_alumno int = 0
as  
 select * 
 from talumnos
 where 
	 (id_alumno = @id_alumno or @id_alumno = 0)
	 and (NroDocumento = @nroDocumento or @nroDocumento = 0)

GO
/****** Object:  StoredProcedure [dbo].[sp_tcomisiones]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tcomisiones]           
 @id_sede int = 0,
 @id_comision int = 0       
as           
 select			* 
 from			tcomisiones 
 where			(id_sede = @id_sede or @id_sede = 0)
				and (id_comision = @id_comision or @id_comision = 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_tcomisiones_clases]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_tcomisiones_clases]   
 @id_comision int  
as   
 select * from tcomisiones_clases where id_comision = @id_comision  
GO
/****** Object:  StoredProcedure [dbo].[sp_tcursos_alumno_inscripto]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--No se usa?
CREATE procedure [dbo].[sp_tcursos_alumno_inscripto]   
 @id_alumno int  
    
as       
 select *   
 from talumno_curso_inscripto  
 inner join tcursos_comisiones on tcursos_comisiones.id_comision = talumno_curso_inscripto.Id_Comision  
 inner join tcursos on tcursos.ID_Curso = talumno_curso_inscripto.id_curso  
 where id_alumno = @id_alumno  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_tusuarios]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_tusuarios]
	@username varchar(100),
	@password varchar(100)
as
	select * from tusuarios where username = @username and password = @password
GO
/****** Object:  StoredProcedure [dbo].[sp_u_talumno_comision_inscripto]    Script Date: 25/11/2018 14:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_u_talumno_comision_inscripto]
 @id_comision int,      
 @id_alumno int,      
 @id_estado_cursada int  
as         
 IF EXISTS (select * from talumno_comision_inscripto where id_comision = @id_comision and ID_Alumno = @id_alumno)  
  BEGIN  
   update talumno_comision_inscripto set id_estado_cursada = @id_estado_cursada, FechaUltimoEstado = getdate()  
   where id_comision = @id_comision and ID_Alumno = @id_alumno  
   select 1  
  END  
  
 select 0  
GO
USE [master]
GO
ALTER DATABASE [EscuelaItinerante] SET  READ_WRITE 
GO
