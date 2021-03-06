USE [master]
GO
/****** Object:  Database [EscuelaItinerante]    Script Date: 10/11/2018 11:31:09 ******/
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
/****** Object:  User [escuelaitinerante]    Script Date: 10/11/2018 11:31:09 ******/
CREATE USER [escuelaitinerante] FOR LOGIN [escuelaitinerante] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [escuelaitinerante]
GO
/****** Object:  Table [dbo].[talumno_comision_inscripto]    Script Date: 10/11/2018 11:31:09 ******/
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
/****** Object:  Table [dbo].[talumno_pago]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[talumno_pago_parcial]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[talumnos]    Script Date: 10/11/2018 11:31:10 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [documento] UNIQUE NONCLUSTERED 
(
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcomisiones]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tcomisiones_clases]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tcomisiones_clases_temp]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tcoordinadores]    Script Date: 10/11/2018 11:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoordinadores](
	[ID_coordinador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NULL,
	[Apellido] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_coordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmestado_civil]    Script Date: 10/11/2018 11:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmestado_civil](
	[ID] [int] NOT NULL,
	[Descripcion] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmsede]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tmtipo_curso]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tmturnos]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  Table [dbo].[tusuarios]    Script Date: 10/11/2018 11:31:10 ******/
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
ALTER TABLE [dbo].[tcomisiones_clases]  WITH CHECK ADD FOREIGN KEY([id_comision])
REFERENCES [dbo].[tcomisiones] ([id_comision])
GO
/****** Object:  StoredProcedure [dbo].[sp_helpcien]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpcol]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpsp]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpspd]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helptab]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_comision_inscripto]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_pago]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_i_talumno_pago_parcial]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_i_talumnos]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_italumnos]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_talumno_comision]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_talumno_comision_inscripto]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_talumno_pago_clase]    Script Date: 10/11/2018 11:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_talumno_pago_clase]
	@id_comision int,
	@id_alumno int
as          

	select		sum(montoAbonado) SumaPagosParcialesRealizados,
				id_clase,
				id_alumno,
				id_comision
	into		#SumaDeMontosParciales
	from		talumno_pago_parcial 
	where		id_comision = @id_comision         
				and (id_alumno = @id_alumno or id_alumno is null)
	group by	id_clase,
				id_alumno,
				id_comision

	select		tcomisiones_clases.id_comision,
				fechaClase,
				talumno_pago.id_alumno,
				tcomisiones_clases.id_clase,
				SumaPagosParcialesRealizados,
				fechaPago
	from		tcomisiones_clases
	left join	talumno_pago on talumno_pago.id_comision = tcomisiones_clases.id_comision
							 and talumno_pago.id_clase = tcomisiones_clases.id_clase
	left join	#SumaDeMontosParciales on #SumaDeMontosParciales.id_clase = tcomisiones_clases.id_clase
										and #SumaDeMontosParciales.id_alumno = @id_alumno
										and #SumaDeMontosParciales.id_comision = tcomisiones_clases.id_comision
	where		tcomisiones_clases.id_comision = @id_comision
				and (talumno_pago.id_alumno = @id_alumno or talumno_pago.id_alumno is null)
	

	drop table #SumaDeMontosParciales
GO
/****** Object:  StoredProcedure [dbo].[sp_talumnos]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tcomisiones]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tcomisiones_clases]    Script Date: 10/11/2018 11:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_tcomisiones_clases]   
 @id_comision int  
as   
 select * from tcomisiones_clases where id_comision = @id_comision  
GO
/****** Object:  StoredProcedure [dbo].[sp_tcursos_alumno_inscripto]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tusuarios]    Script Date: 10/11/2018 11:31:10 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_u_talumno_comision_inscripto]    Script Date: 10/11/2018 11:31:10 ******/
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
