USE [master]
GO
/****** Object:  Database [Services365]    Script Date: 8/20/2023 6:27:15 PM ******/
CREATE DATABASE [Services365]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Services365', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Services365.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Services365_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Services365_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Services365] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Services365].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Services365] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Services365] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Services365] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Services365] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Services365] SET ARITHABORT OFF 
GO
ALTER DATABASE [Services365] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Services365] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Services365] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Services365] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Services365] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Services365] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Services365] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Services365] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Services365] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Services365] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Services365] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Services365] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Services365] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Services365] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Services365] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Services365] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Services365] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Services365] SET RECOVERY FULL 
GO
ALTER DATABASE [Services365] SET  MULTI_USER 
GO
ALTER DATABASE [Services365] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Services365] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Services365] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Services365] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Services365] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Services365] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Services365', N'ON'
GO
ALTER DATABASE [Services365] SET QUERY_STORE = ON
GO
ALTER DATABASE [Services365] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Services365]
GO
/****** Object:  User [pentaho]    Script Date: 8/20/2023 6:27:15 PM ******/
CREATE USER [pentaho] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faq]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faq](
	[IdFaq] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Solucion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Faq] PRIMARY KEY CLUSTERED 
(
	[IdFaq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Serie] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[VersionInv] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje](
	[IdMensaje] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](500) NOT NULL,
	[MensjFecha] [datetime] NOT NULL,
	[IdTiquete] [int] NOT NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED 
(
	[IdMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[TipoServicio] [varchar](50) NOT NULL,
	[Tiempo] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiquete]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiquete](
	[IdTiquete] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFinal] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTecnico] [int] NULL,
	[IdEstado] [int] NOT NULL,
	[IdServicio] [int] NULL,
	[IdFaq] [int] NULL,
	[IdInventario] [int] NULL,
 CONSTRAINT [PK_Tiquete] PRIMARY KEY CLUSTERED 
(
	[IdTiquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Alias] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Contrasenna] [nvarchar](50) NOT NULL,
	[IdRol] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([IdEstado], [status]) VALUES (1, N'Nuevo')
INSERT [dbo].[Estado] ([IdEstado], [status]) VALUES (2, N'Abierto')
INSERT [dbo].[Estado] ([IdEstado], [status]) VALUES (3, N'Cerrado')
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Faq] ON 

INSERT [dbo].[Faq] ([IdFaq], [Titulo], [Descripcion], [Solucion]) VALUES (1, N'Titulo1', N'Descripcion1', N'Solucion')
INSERT [dbo].[Faq] ([IdFaq], [Titulo], [Descripcion], [Solucion]) VALUES (2, N'Mantenimientos de equipos basico', N'Consultas de como realizar un mantenimiento de manera basica', N'Solucion')
SET IDENTITY_INSERT [dbo].[Faq] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([IdInventario], [TipoEquipo], [Marca], [Modelo], [Serie], [Nombre], [VersionInv]) VALUES (1, N'Equipo1', N'Marca1', N'Modelo1', N'Serie1', N'Nombre1', N'1.1')
INSERT [dbo].[Inventario] ([IdInventario], [TipoEquipo], [Marca], [Modelo], [Serie], [Nombre], [VersionInv]) VALUES (5, N'TEST1', N'TEST1', N'TEST1', N'TEST1', N'TEST1', N'1.8')
INSERT [dbo].[Inventario] ([IdInventario], [TipoEquipo], [Marca], [Modelo], [Serie], [Nombre], [VersionInv]) VALUES (6, N'TEST', N'TESTMARCA', N'TEST1', N'TEST1', N'EDUARDO', N'12312')
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensaje] ON 

INSERT [dbo].[Mensaje] ([IdMensaje], [Mensaje], [MensjFecha], [IdTiquete], [IdUsuario]) VALUES (13, N'Se asigna al tecnico jose para resolver su caso', CAST(N'2023-08-20T14:28:04.617' AS DateTime), 16, 7)
INSERT [dbo].[Mensaje] ([IdMensaje], [Mensaje], [MensjFecha], [IdTiquete], [IdUsuario]) VALUES (14, N'Se desbloqua su usario correspondiente.

Saludos', CAST(N'2023-08-20T14:28:46.793' AS DateTime), 16, 6)
SET IDENTITY_INSERT [dbo].[Mensaje] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (2, N'User')
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (3, N'Tecnico')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([IdServicio], [TipoServicio], [Tiempo]) VALUES (1, N'TipoServicio', 200)
INSERT [dbo].[Servicio] ([IdServicio], [TipoServicio], [Tiempo]) VALUES (2, N'Mantenimiento de equipo', 300)
INSERT [dbo].[Servicio] ([IdServicio], [TipoServicio], [Tiempo]) VALUES (3, N'Desbloqueo de usuario', 60)
INSERT [dbo].[Servicio] ([IdServicio], [TipoServicio], [Tiempo]) VALUES (4, N'Instalación de sistemas', 400)
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Tiquete] ON 

INSERT [dbo].[Tiquete] ([IdTiquete], [Titulo], [Descripcion], [FechaInicio], [FechaFinal], [IdUsuario], [IdTecnico], [IdEstado], [IdServicio], [IdFaq], [IdInventario]) VALUES (16, N'Solicitud para desbloqueo de usuario AS400', N'<p>Buenas tardes.</p>
<p>Favor agradezco la ayuda', CAST(N'2023-08-20T14:26:50.640' AS DateTime), CAST(N'2023-08-20T14:28:54.443' AS DateTime), 8, 6, 3, 2, 2, NULL)
INSERT [dbo].[Tiquete] ([IdTiquete], [Titulo], [Descripcion], [FechaInicio], [FechaFinal], [IdUsuario], [IdTecnico], [IdEstado], [IdServicio], [IdFaq], [IdInventario]) VALUES (17, N'Solicitud para desbloqueo de usuario AS400', N'<p>TEST1</p>', CAST(N'2023-08-20T14:30:40.453' AS DateTime), NULL, 8, 6, 2, 2, 2, NULL)
INSERT [dbo].[Tiquete] ([IdTiquete], [Titulo], [Descripcion], [FechaInicio], [FechaFinal], [IdUsuario], [IdTecnico], [IdEstado], [IdServicio], [IdFaq], [IdInventario]) VALUES (18, N'TEST de flujo 1', N'<p>TEST2</p>', CAST(N'2023-08-20T14:30:55.753' AS DateTime), NULL, 8, 3, 2, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[Tiquete] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (1, N'u1', N'Usuario1', N'U', N'U', N'u@u', N'asd', 2)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (2, N'a1', N'Admin1', N'A', N'A', N'a@a', N'asd', 3)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (3, N'j1', N'jose', N'A', N'A', N'test@test.com', N'asd', 3)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (4, N'c1', N'cris', N'A', N'A', N'a@a', N'asd', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (6, N'test1', N'test1', N'test', N'test', N'testing@testing.com', N'asad', 3)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (7, N'EJAEN', N'EDUARDO', N'JAEN', N'ARIAS', N'eduardojja47@gmail.com', N'1234', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Alias], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [IdRol]) VALUES (8, N'ecalvoc', N'Eduardo', N'Calvo', N'Castillo', N'eduardocalvo@gmail.com', N'12345', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Estado]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Faq] FOREIGN KEY([IdFaq])
REFERENCES [dbo].[Faq] ([IdFaq])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Faq]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Inventario] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventario] ([IdInventario])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Inventario]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Servicio]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarInventario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarInventario]
	@IdInventario int,
	@TipoEquipo varchar(50),
	@Marca varchar(50),
	@Modelo varchar(50),
	@Serie varchar(10),
	@Nombre varchar(50),
	@VersionInv varchar(50)
AS
BEGIN

UPDATE Inventario SET TipoEquipo= @TipoEquipo,Marca= @Marca, Modelo= @Modelo, Serie= @Serie, Nombre= @Nombre, VersionInv = @VersionInv WHERE IdInventario = @IdInventario

END

GO
/****** Object:  StoredProcedure [dbo].[BuscarTiquete]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarTiquete]
@IdTiquete int
AS
BEGIN
SELECT 
	t.IdTiquete, 
	t.Titulo, 
	t.Descripcion, 
	CAST(t.FechaInicio AS date) as FechaInicio, 
	t.FechaFinal,
	t.IdUsuario,
	t.IdTecnico,
	t.IdEstado,
	t.IdServicio,
	t.IdFaq,
	t.IdInventario,
	e.status, 
	s.Tiempo, 
	s.TipoServicio, 
	f.Titulo as faq, 
	i.Nombre,
	u.Nombre + ' ' + u.Apellido1 + ' ' + u.Apellido2 as Usuario
	FROM Tiquete t
	LEFT JOIN Estado e ON e.IdEstado = t.IdEstado
	LEFT JOIN Servicio s ON s.IdServicio = t.IdEstado
	LEFT JOIN Faq f ON f.IdFaq = t.IdFaq
	LEFT JOIN Inventario i ON i.IdInventario = t.IdInventario
	LEFT JOIN Usuario u ON u.IdUsuario = t.IdUsuario
where t.IdTiquete = @IdTiquete ;
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarContrasena]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarContrasena]
@Correo varchar(100),
@Contrasena varchar(100)
AS
BEGIN
	UPDATE Usuario SET Contrasenna = @Contrasena WHERE Correo = @Correo
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFaq]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarFaq]
    @Titulo NVARCHAR(100)
AS
BEGIN
    SELECT [IdFaq]
          ,[Titulo]
          ,[Descripcion]
          ,[Solucion]
    FROM [dbo].[Faq]
    WHERE [Titulo] = @Titulo
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarInventario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarInventario]
    @IdInventario NVARCHAR(50)
AS
BEGIN
    SELECT [IdInventario]
          ,[TipoEquipo]
          ,[Marca]
          ,[Modelo]
          ,[Serie]
          ,[Nombre]
          ,[VersionInv]
    FROM [dbo].[Inventario]
    WHERE [IdInventario] = @IdInventario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarServicio]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarServicio]
    @idServicio NVARCHAR(50)
AS
BEGIN
    SELECT [IdServicio]
          ,[TipoServicio]
          ,[Tiempo]
    FROM [dbo].[Servicio]
    WHERE IdServicio = @idServicio
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodoEstado]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodoEstado]
AS
BEGIN
	SELECT * FROM Estado
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodoFaqs]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodoFaqs]
AS
BEGIN
    SELECT [IdFaq]
          ,[Titulo]
          ,[Descripcion]
          ,[Solucion]
    FROM [dbo].[Faq]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodoInventario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodoInventario]
AS
BEGIN
    SELECT [IdInventario]
          ,[TipoEquipo]
          ,[Marca]
          ,[Modelo]
          ,[Serie]
          ,[Nombre]
          ,[VersionInv]
    FROM [dbo].[Inventario]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTodoServicios]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTodoServicios]
AS
BEGIN
    SELECT [IdServicio]
          ,[TipoServicio]
          ,[Tiempo]
    FROM [dbo].[Servicio]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuarios]

AS
BEGIN

	select u.IdUsuario, u.Alias, u.Nombre, u.Apellido1, u.Apellido2, u.Correo, 
	r.NombreRol, u.IdRol
	from dbo.Usuario u
	join rol r on u.IdRol = r.IdRol;

END
GO
/****** Object:  StoredProcedure [dbo].[CrearInventario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearInventario]
	@TipoEquipo varchar(50),
	@Marca varchar(50),
	@Modelo varchar(50),
	@Serie varchar(10),
	@Nombre varchar(50),
	@VersionInv varchar(50)
AS
BEGIN
	INSERT INTO Inventario (TipoEquipo,Marca, Modelo, Serie, Nombre, VersionInv) VALUES(@TipoEquipo, @Marca, @Modelo, @Serie, @Nombre, @VersionInv)
END

GO
/****** Object:  StoredProcedure [dbo].[CrearTiquete]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearTiquete]
@Titulo varchar(50),
@Descripcion varchar(50),
@FechaFinal datetime,
@IdUsuario int,
@IdTecnico int,
@IdEstado int,
@IdServicio int,
@IdFaq int,
@IdInvetario int
AS
BEGIN
	
	Insert into dbo.Tiquete(
	Titulo, Descripcion, 
	FechaInicio, FechaFinal,
	IdUsuario, IdTecnico,
	IdEstado, IdServicio,
	IdFaq, IdInventario)
	Values(@Titulo, @Descripcion, 
	GETDATE(), @FechaFinal,
	@IdUsuario, @IdTecnico, 
	@IdEstado, @IdServicio,
	@IdFaq, @IdInvetario);

END
GO
/****** Object:  StoredProcedure [dbo].[EditarTiquete]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarTiquete]
@IdTiquete int,
@IdTecnico int,
@IdEstado int
AS
BEGIN
	
	IF(@IdEstado = 3)
		BEGIN
			SET @idTecnico = (SELECT IdTecnico FROM dbo.Tiquete WHERE IdTiquete = @IdTiquete)
			UPDATE dbo.Tiquete SET IdTecnico = @IdTecnico, IdEstado = @IdEstado, FechaFinal = GETDATE() WHERE IdTiquete = @IdTiquete
		END
	ELSE
		UPDATE dbo.Tiquete SET IdTecnico = @IdTecnico, IdEstado = @IdEstado WHERE IdTiquete = @IdTiquete;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarTiquete]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarTiquete]
@IdTiquete int
AS
BEGIN
    delete Tiquete
    WHERE IdTiquete = @IdTiquete;
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo VARCHAR(50),
	@Contrasenna VARCHAR(50)

AS
BEGIN

SELECT IdUsuario,
       Alias,
       Nombre,
       Apellido1,
       Apellido2,
       Correo,
       IdRol
  FROM dbo.Usuario
  WHERE Correo = @Correo
    AND Contrasenna = @Contrasenna


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarMensaje]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarMensaje]
@Mensaje varchar(500),
@IdTiquete int,
@IdUsuario int
AS
BEGIN
	insert into dbo.Mensaje(Mensaje, MensjFecha, IdTiquete, IdUsuario)
	values(@Mensaje, GETDATE(),@IdTiquete,@IdUsuario);
END
GO
/****** Object:  StoredProcedure [dbo].[ListarTiquetes]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarTiquetes]
AS
BEGIN
SELECT 
	t.IdTiquete, 
	t.Titulo, 
	t.Descripcion, 
	CAST(t.FechaInicio AS date) as FechaInicio, 
	t.FechaFinal,
	t.IdUsuario,
	t.IdTecnico,
	t.IdEstado,
	t.IdServicio,
	t.IdFaq,
	t.IdInventario,
	e.status, 
	s.Tiempo, 
	s.TipoServicio, 
	f.Titulo as faq, 
	i.Nombre
	FROM Tiquete t
	LEFT JOIN Estado e ON e.IdEstado = t.IdEstado
	LEFT JOIN Servicio s ON s.IdServicio = t.IdEstado
	LEFT JOIN Faq f ON f.IdFaq = t.IdFaq
	LEFT JOIN Inventario i ON i.IdInventario = t.IdInventario
END


GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Alias VARCHAR(50),
    @Nombre VARCHAR(50),
    @Apellido1 VARCHAR(50),
    @Apellido2 VARCHAR(50),
    @Correo VARCHAR(50),
	@Contrasenna VARCHAR(50),
    @IdRol int
AS
BEGIN

INSERT INTO dbo.Usuario (Alias, Nombre, Apellido1, Apellido2, Correo,Contrasenna, IdRol)
Values
	   (@Alias,
       @Nombre,
       @Apellido1,
       @Apellido2,
       @Correo,
	   @Contrasenna,
       @IdRol)

END
GO
/****** Object:  StoredProcedure [dbo].[VerMensaje]    Script Date: 8/20/2023 6:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerMensaje]
@IdTiquete int
AS
BEGIN
	select m.*, u.Nombre + ' ' +u.Apellido1 + ' ' + u.Apellido2 as Usuario 
	from mensaje m
	left join Usuario u ON u.IdUsuario = m.IdUsuario
	where IdTiquete = @IdTiquete
END
GO
USE [master]
GO
ALTER DATABASE [Services365] SET  READ_WRITE 
GO
