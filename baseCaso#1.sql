USE [master]
GO

/****** Object:  Database [Caso1BasesII]    Script Date: 27/2/2022 18:53:43 ******/
DROP DATABASE [Caso1BasesII]
GO

/****** Object:  Database [Caso1BasesII]    Script Date: 27/2/2022 18:53:43 ******/
CREATE DATABASE [Caso1BasesII]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Caso1BasesII', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2\MSSQL\DATA\Caso1BasesII.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Caso1BasesII_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2\MSSQL\DATA\Caso1BasesII_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Caso1BasesII].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Caso1BasesII] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Caso1BasesII] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Caso1BasesII] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Caso1BasesII] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Caso1BasesII] SET ARITHABORT OFF 
GO

ALTER DATABASE [Caso1BasesII] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Caso1BasesII] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Caso1BasesII] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Caso1BasesII] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Caso1BasesII] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Caso1BasesII] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Caso1BasesII] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Caso1BasesII] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Caso1BasesII] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Caso1BasesII] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Caso1BasesII] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Caso1BasesII] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Caso1BasesII] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Caso1BasesII] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Caso1BasesII] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Caso1BasesII] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Caso1BasesII] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Caso1BasesII] SET RECOVERY FULL 
GO

ALTER DATABASE [Caso1BasesII] SET  MULTI_USER 
GO

ALTER DATABASE [Caso1BasesII] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Caso1BasesII] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Caso1BasesII] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Caso1BasesII] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Caso1BasesII] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Caso1BasesII] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Caso1BasesII] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Caso1BasesII] SET  READ_WRITE 
GO

USE [Caso1BasesII]
GO

/********************************* Object:  Table [dbo].[tipoUsuario]    Script Date: 27/2/2022 18:57:22 **************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipoUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[tipoUsuario]
GO

/****** Object:  Table [dbo].[tipoUsuario]    Script Date: 27/2/2022 18:57:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tipoUsuario](
	[idTipo] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [FK_usuario_tipoUsuario]
GO

/***************************** Object:  Table [dbo].[usuario]    Script Date: 27/2/2022 18:57:35 **********************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario]') AND type in (N'U'))
DROP TABLE [dbo].[usuario]
GO

/****** Object:  Table [dbo].[usuario]    Script Date: 27/2/2022 18:57:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[usuario](
	[idUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[apellido] [varchar](25) NOT NULL,
	[clave] [varchar](25) NOT NULL,
	[urlfoto] [varchar](150) NOT NULL,
	[diaCreacion] [datetime] NULL,
	[tipoUsuario] [smallint] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipoUsuario] FOREIGN KEY([tipoUsuario])
REFERENCES [dbo].[tipoUsuario] ([idTipo])
GO

ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipoUsuario]
GO

GO

ALTER TABLE [dbo].[Partidos] DROP CONSTRAINT [FK_Partidos_usuario]
GO

/************************************* Object:  Table [dbo].[Partidos]    Script Date: 27/2/2022 19:01:12 *************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Partidos]') AND type in (N'U'))
DROP TABLE [dbo].[Partidos]
GO

/****** Object:  Table [dbo].[Partidos]    Script Date: 27/2/2022 19:01:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Partidos](
	[idPartido] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[urlBandera] [varchar](150) NOT NULL,
	[diaCreacion] [date] NULL,
	[idUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO

ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_usuario]
GO

GO

ALTER TABLE [dbo].[planes] DROP CONSTRAINT [FK_planes_Partidos]
GO

/************************************** Object:  Table [dbo].[planes]    Script Date: 27/2/2022 19:01:56 **************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[planes]') AND type in (N'U'))
DROP TABLE [dbo].[planes]
GO

/****** Object:  Table [dbo].[planes]    Script Date: 27/2/2022 19:01:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[planes](
	[idPlan] [bigint] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](30) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[idPartido] [bigint] NOT NULL,
 CONSTRAINT [PK_planes] PRIMARY KEY CLUSTERED 
(
	[idPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[planes]  WITH CHECK ADD  CONSTRAINT [FK_planes_Partidos] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partidos] ([idPartido])
GO

ALTER TABLE [dbo].[planes] CHECK CONSTRAINT [FK_planes_Partidos]
GO

GO

ALTER TABLE [dbo].[Acciones] DROP CONSTRAINT [FK_Acciones_planes]
GO

/*********************************** Object:  Table [dbo].[Acciones]    Script Date: 27/2/2022 19:02:22 ****************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Acciones]') AND type in (N'U'))
DROP TABLE [dbo].[Acciones]
GO

/****** Object:  Table [dbo].[Acciones]    Script Date: 27/2/2022 19:02:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Acciones](
	[idAccion] [bigint] IDENTITY(1,1) NOT NULL,
	[idPlan] [bigint] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Acciones] PRIMARY KEY CLUSTERED 
(
	[idAccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Acciones]  WITH CHECK ADD  CONSTRAINT [FK_Acciones_planes] FOREIGN KEY([idPlan])
REFERENCES [dbo].[planes] ([idPlan])
GO

ALTER TABLE [dbo].[Acciones] CHECK CONSTRAINT [FK_Acciones_planes]
GO

GO

/************************** Object:  Table [dbo].[Provincias]    Script Date: 27/2/2022 19:02:44 **********************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincias]') AND type in (N'U'))
DROP TABLE [dbo].[Provincias]
GO

/****** Object:  Table [dbo].[Provincias]    Script Date: 27/2/2022 19:02:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Provincias](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

ALTER TABLE [dbo].[Cantones] DROP CONSTRAINT [FK_Cantones_Provincias1]
GO

/************************************** Object:  Table [dbo].[Cantones]    Script Date: 27/2/2022 19:03:02 **************************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cantones]') AND type in (N'U'))
DROP TABLE [dbo].[Cantones]
GO

/****** Object:  Table [dbo].[Cantones]    Script Date: 27/2/2022 19:03:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cantones](
	[idCanton] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[idProvincia] [int] NOT NULL,
 CONSTRAINT [PK_Cantones] PRIMARY KEY CLUSTERED 
(
	[idCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cantones]  WITH CHECK ADD  CONSTRAINT [FK_Cantones_Provincias1] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincias] ([idProvincia])
GO

ALTER TABLE [dbo].[Cantones] CHECK CONSTRAINT [FK_Cantones_Provincias1]
GO

GO

ALTER TABLE [dbo].[Deliverables] DROP CONSTRAINT [FK_Deliverables_planes]
GO

ALTER TABLE [dbo].[Deliverables] DROP CONSTRAINT [FK_Deliverables_Cantones]
GO

ALTER TABLE [dbo].[Deliverables] DROP CONSTRAINT [FK_Deliverables_Acciones]
GO

/****************************************** Object:  Table [dbo].[Deliverables]    Script Date: 27/2/2022 19:03:33 ****************************/
/**********************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deliverables]') AND type in (N'U'))
DROP TABLE [dbo].[Deliverables]
GO

/****** Object:  Table [dbo].[Deliverables]    Script Date: 27/2/2022 19:03:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Deliverables](
	[idPlan] [bigint] NOT NULL,
	[idAccion] [bigint] NOT NULL,
	[idCanton] [bigint] NOT NULL,
	[kpiValue] [int] NOT NULL,
	[kpiTipo] [varchar](25) NOT NULL,
	[postTime] [datetime] NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[idDeliverable] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Deliverables] PRIMARY KEY CLUSTERED 
(
	[idDeliverable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Acciones] FOREIGN KEY([idAccion])
REFERENCES [dbo].[Acciones] ([idAccion])
GO

ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Acciones]
GO

ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Cantones] FOREIGN KEY([idCanton])
REFERENCES [dbo].[Cantones] ([idCanton])
GO

ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Cantones]
GO

ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_planes] FOREIGN KEY([idPlan])
REFERENCES [dbo].[planes] ([idPlan])
GO

ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_planes]
GO

/********************************************************** INGRESAR TIPO USUARIO *************************************************************/
/**********************************************************************************************************************************************/

DECLARE @idTipo SMALLINT
SET @idTipo = ISNULL( (SELECT idTipo FROM dbo.tipoUsuario tipo
WHERE TRIM('Ciudadano')= tipo.nombre), -1)

IF(@idTipo = -1)
	INSERT INTO dbo.tipoUsuario(nombre) VALUES
	('Ciudadano')


SET @idTipo = ISNULL( (SELECT idTipo FROM dbo.tipoUsuario tipo
WHERE TRIM('Encargados de campaña')= tipo.nombre), -1)
IF(@idTipo = -1)
	insert into dbo.tipoUsuario(nombre) values
	('Encargados de campaña')

/*************************************************************** INGRESAR USUARIO *************************************************************/
/**********************************************************************************************************************************************/
DECLARE @cantUsuarios INT
DECLARE @nombre VARCHAR(25)
DECLARE @apellido VARCHAR(25)
DECLARE @clave VARCHAR(25)
DECLARE @urlfoto VARCHAR(150)
DECLARE @diaCreacion DATETIME
DECLARE @years INT

SET @cantUsuarios = 2

WHILE @cantUsuarios>0 BEGIN
    SET @years = (4 + floor(rand()* 10))* -1
    SET @diaCreacion = dateadd(year, @years, getdate())

    SET @diaCreacion = dateadd(day, CASE WHEN rand() < 0.5 THEN -1 ELSE 1 END * 200 * rand(), @diaCreacion)

    INSERT INTO dbo.usuario 
    (nombre, apellido, clave, urlfoto, diaCreacion, tipoUsuario)
    VALUES
    ('Nombre'+CONVERT(VARCHAR,floor(999999*rand())), 
    'Apellido '+CONVERT(VARCHAR, floor(999999*rand())), 
    'Clave '+CONVERT(VARCHAR,floor(999999*rand())),
	'URLFOTO'+CONVERT(VARCHAR,floor(999999*rand())), @diaCreacion, 2)


    SET @cantUsuarios = @cantUsuarios - 1
END

/********************************************************** Ingresar Partidos ******************************************************************/
/**********************************************************************************************************************************************/
DECLARE @cantPartidos INT
DECLARE @urlBandera VARCHAR(150)
DECLARE @idUs BIGINT

SET @cantPartidos = 5

WHILE @cantPartidos>0 BEGIN
    SET @years = (19+floor(rand()*70))*-1
    SET @diaCreacion = dateadd(year, @years, getdate())
    SET @diaCreacion = dateadd(day, CASE WHEN rand() < 0.5 THEN -1 ELSE 1 END * 200 * rand(), @diaCreacion)
	SET @idUs = ( SELECT MAX(idUsuario) FROM dbo.usuario )

    INSERT INTO dbo.Partidos 
    (nombre, urlBandera, diaCreacion, idUsuario)
    VALUES
    ('Partido '+CONVERT(VARCHAR,floor(999999*rand())), 
    'URLBANDERA '+CONVERT(VARCHAR, floor(999999*rand())), 
    @diaCreacion, (FLOOR(RAND()*(@idUs - 1+1))+1) )


    SET @cantPartidos = @cantPartidos - 1
END


/********************************************************** Ingresar Planes ******************************************************************/
/**********************************************************************************************************************************************/
DECLARE @cantPlanes INT
DECLARE @titulo VARCHAR(30)
DECLARE @descripcion VARCHAR(500)
DECLARE @idPartido BIGINT

SET @cantPlanes = 15

WHILE @cantPlanes>0 BEGIN
	SET @idPartido = ( SELECT MAX(idPartido) FROM dbo.Partidos )

    INSERT INTO dbo.planes
    (titulo, descripcion, idPartido)
    VALUES
    ('Titulo Plan '+CONVERT(VARCHAR,floor(999999*rand())), 
    'Descripcion '+CONVERT(VARCHAR, floor(999999*rand())), 
    (FLOOR(RAND()*(@idPartido - 1+1))+1))


    SET @cantPlanes = @cantPlanes - 1
END

/********************************************************** Ingresar Acciones ******************************************************************/
/**********************************************************************************************************************************************/
DECLARE @idPlan BIGINT

DECLARE @cantAcciones INT

SET @cantAcciones = 40

WHILE @cantAcciones>0 BEGIN
	SET @idPlan = ( SELECT MAX(idPlan) FROM dbo.planes )

    INSERT INTO dbo.Acciones
    (idPlan, descripcion)
    VALUES
    ( (FLOOR(RAND()*(@idPlan - 1+1))+1), 
	'Descripcion Acciones'+CONVERT(VARCHAR, floor(999999*rand())) )


    SET @cantAcciones = @cantAcciones - 1
END

/********************************************************** Insertar Provincias ******************************************************************/
/**********************************************************************************************************************************************/
DECLARE @idProvincia INT

-- 	San José
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('San José')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('San José')

-- 	Alajuela
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Alajuela')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Alajuela')

-- 	Cartago
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Cartago')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Cartago')

-- 	Heredia
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Heredia')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Heredia')

-- 	Guanacaste
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Guanacaste')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Guanacaste')

-- 	Puntarenas
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Puntarenas')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Puntarenas')

-- 	Limón
SET @idProvincia = ISNULL( (SELECT idProvincia FROM dbo.Provincias provincia
WHERE TRIM('Limón')= provincia.nombre), -1)

IF(@idProvincia = -1)
	INSERT INTO dbo.Provincias(nombre) VALUES
	('Limón')

-- Insertar cantones
DECLARE @idCantones INT

-- 	Cantones de San José
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Acosta')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Acosta', 1)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Curridabat')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Curridabat', 1)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Desamparados')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Desamparados', 1)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Escazú')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Escazú', 1)


SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Goicoechea')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Goicoechea', 1)

-- 	Cantones de Alajuela
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('San Ramón')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('San Ramón', 2)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Naranjo')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Naranjo', 2)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Guatuso')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Guatuso', 2)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Grecia')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Grecia', 2)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Atenas')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Atenas', 2)

-- 	Cantones de Cartago
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('La Unión')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('La Unión', 3)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Paraíso')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Paraíso', 3)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Turrialba')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Turrialba', 3)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('El Guarco')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('El Guarco', 3)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Oreamuno')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Oreamuno', 3)

-- 	Cantones de Heredia
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Barva')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Barva', 4)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('San Isidro')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('San Isidro', 4)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Santo Domingo')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Santo Domingo', 4)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Sarapiquí')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Sarapiquí', 4)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('San Rafael')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('San Rafael', 4)

-- 	Cantones de Guanacaste
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Liberia')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Liberia', 5)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Cañas')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Cañas', 5)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Nandayure')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Nandayure', 5)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Nicoya')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Nicoya', 5)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('La Cruz')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('La Cruz', 5)

-- 	Cantones de Puntarenas
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Buenos Aires')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Buenos Aires', 6)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Corredores')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Corredores', 6)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Esparza')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Esparza', 6)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Golfito')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Golfito', 6)


SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Osa')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Osa', 6)

-- 	Cantones de Limón
SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Matina')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Matina', 7)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Pococí')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Pococí', 7)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Talamanca')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Talamanca', 7)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Siquirres')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Siquirres', 7)

SET @idCantones = ISNULL( (SELECT idCanton FROM dbo.Cantones cantones
WHERE TRIM('Guácimo')= cantones.nombre), -1)

IF(@idCantones = -1)
	INSERT INTO dbo.Cantones(nombre, idProvincia) VALUES
	('Guácimo', 7)

SELECT * FROM Cantones

/********************************************************** Ingresar Entregables ******************************************************************/
/**********************************************************************************************************************************************/
DECLARE @idPlan BIGINT
DECLARE @idAccionM BIGINT
DECLARE @idAccion BIGINT
DECLARE @idCanton BIGINT
DECLARE @kpiValue INT
DECLARE @checksum VARCHAR(200)

DECLARE @diaCreacion DATETIME
DECLARE @years INT


DECLARE @cantDev INT

SET @cantDev = 50

WHILE @cantDev>0 BEGIN
	SET @idAccionM = ( SELECT MAX(idAccion) FROM dbo.Acciones )
	SET @idAccion = (FLOOR(RAND()*(@idAccionM - 1+1))+1)
	SET @idPlan = (SELECT idPlan FROM dbo.Acciones WHERE idAccion = @idAccion)
	SET @idCanton = ( SELECT MAX(idCanton) FROM dbo.Cantones )
	SET @kpiValue = (FLOOR(RAND()*(100 - 1+1))+1)

	SET @years = (4 + floor(rand()* 10))* -1
    SET @diaCreacion = dateadd(year, @years, getdate())
    SET @diaCreacion = dateadd(day, CASE WHEN rand() < 0.5 THEN -1 ELSE 1 END * 200 * rand(), @diaCreacion)

	SET @checksum = HASHBYTES('SHA2_256', ('kpiValue'+CONVERT(VARCHAR, floor(999999*rand()))) )

    INSERT INTO dbo.Deliverables
    (idPlan, idAccion, idCanton, kpiValue, kpiTipo, postTime, checksum)
    VALUES
    ( @idPlan, @idAccion,
	(FLOOR(RAND()*(@idCanton - 1+1))+1), 
	@kpiValue, 'kpiValue'+CONVERT(VARCHAR, floor(999999*rand())), 
	@diaCreacion, @checksum)


    SET @cantDev = @cantDev - 1
END

/***************************************************** Store Procedure Query 1 ****************************************************************/
/**********************************************************************************************************************************************/

DROP PROCEDURE IF EXISTS [CantonEntregable]
GO
Create Procedure [dbo].[CantonEntregable]
	@Canton VARCHAR(25)
as
	SELECT par.nombre Partido, CONCAT('Tipo kpi: ', dev.kpiTipo, '   Valor kpi: ', dev.kpiValue) Entregable FROM dbo.Deliverables dev
	INNER JOIN dbo.Cantones can ON can.idCanton = dev.idCanton
	INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan
	INNER JOIN dbo.Partidos par ON par.idPartido = plans.idPartido
	WHERE can.nombre = @Canton
	GROUP BY par.nombre, dev.kpiTipo, dev.kpiValue
	
GO

/***********************************************************/* Vista Query 3 ******************************************************************/
/**********************************************************************************************************************************************/

DROP VIEW IF EXISTS [obtenerCanton]
GO
CREATE VIEW [dbo].[obtenerCanton]
AS 
	SELECT par.nombre Partido, MAX(allfundsusers.total) Entregables, can.nombre Canton FROM dbo.Partidos par
	INNER JOIN dbo.planes plans ON plans.idPartido = par.idPartido
	INNER JOIN dbo.Deliverables dev on dev.idPlan = plans.idPlan
	INNER JOIN dbo.Cantones can ON can.idCanton = dev.idCanton
	INNER JOIN (
		SELECT COUNT(dev.idDeliverable) total, can.idCanton id, plans.idPartido plans
		FROM dbo.Deliverables dev
		INNER JOIN dbo.Cantones can ON can.idCanton = dev.idCanton
		INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan
		GROUP BY can.idCanton, plans.idPartido, plans.idPartido
	) as allfundsusers ON allfundsusers.plans = plans.idPartido
	GROUP BY par.nombre, can.nombre
GO



