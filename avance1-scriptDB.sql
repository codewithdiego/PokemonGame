USE [master]
GO
/****** Object:  Database [JuegoPokemon]    Script Date: 28/11/2024 11:59:56 ******/
CREATE DATABASE [JuegoPokemon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoPokemon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JuegoPokemon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoPokemon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JuegoPokemon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JuegoPokemon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoPokemon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoPokemon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoPokemon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoPokemon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoPokemon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoPokemon] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoPokemon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoPokemon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoPokemon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoPokemon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoPokemon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoPokemon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoPokemon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoPokemon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoPokemon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoPokemon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JuegoPokemon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoPokemon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoPokemon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoPokemon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoPokemon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoPokemon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoPokemon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoPokemon] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoPokemon] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoPokemon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoPokemon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoPokemon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoPokemon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoPokemon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JuegoPokemon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JuegoPokemon', N'ON'
GO
ALTER DATABASE [JuegoPokemon] SET QUERY_STORE = ON
GO
ALTER DATABASE [JuegoPokemon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JuegoPokemon]
GO
/****** Object:  Table [dbo].[Debilidades]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debilidades](
	[DebilidadId] [int] IDENTITY(1,1) NOT NULL,
	[NombreDebilidad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DebilidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[MensajeId] [int] IDENTITY(1,1) NOT NULL,
	[RemitenteId] [int] NULL,
	[DestinatarioId] [int] NULL,
	[Contenido] [nvarchar](500) NOT NULL,
	[FechaHora] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MensajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pokedex]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokedex](
	[PokedexId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoId] [int] NULL,
	[Evoluciones] [nvarchar](255) NULL,
	[Peso] [decimal](5, 2) NULL,
	[Numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PokedexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PokedexDebilidades]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokedexDebilidades](
	[PokedexId] [int] NOT NULL,
	[DebilidadId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PokedexId] ASC,
	[DebilidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pokemons]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokemons](
	[PokemonId] [int] IDENTITY(1,1) NOT NULL,
	[EntrenadorId] [int] NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoId] [int] NULL,
	[Nivel] [int] NULL,
	[Salud] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PokemonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudesDeBatalla]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudesDeBatalla](
	[SolicitudBatallaId] [int] IDENTITY(1,1) NOT NULL,
	[RetadorId] [int] NULL,
	[OponenteId] [int] NULL,
	[Estado] [nvarchar](20) NULL,
	[FechaSolicitud] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SolicitudBatallaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudesDeCuracion]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudesDeCuracion](
	[SolicitudCuracionId] [int] IDENTITY(1,1) NOT NULL,
	[EntrenadorId] [int] NULL,
	[PokemonId] [int] NULL,
	[Estado] [nvarchar](20) NULL,
	[FechaSolicitud] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SolicitudCuracionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos](
	[TipoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipo] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/11/2024 11:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[HashContrasena] [nvarchar](255) NOT NULL,
	[RolId] [int] NULL,
	[NombreEntrenador] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mensajes] ON 

INSERT [dbo].[Mensajes] ([MensajeId], [RemitenteId], [DestinatarioId], [Contenido], [FechaHora]) VALUES (1, 1, 1, N'Hola', CAST(N'2024-11-28T11:30:09.907' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mensajes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pokedex] ON 

INSERT [dbo].[Pokedex] ([PokedexId], [Nombre], [TipoId], [Evoluciones], [Peso], [Numero]) VALUES (1, N'Pikachu', 1, N'No', CAST(2.50 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[Pokedex] OFF
GO
SET IDENTITY_INSERT [dbo].[Pokemons] ON 

INSERT [dbo].[Pokemons] ([PokemonId], [EntrenadorId], [Nombre], [TipoId], [Nivel], [Salud]) VALUES (1, 1, N'Pikachu', 1, 4, 100)
SET IDENTITY_INSERT [dbo].[Pokemons] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RolId], [NombreRol]) VALUES (2, N'Administrador')
INSERT [dbo].[Roles] ([RolId], [NombreRol]) VALUES (3, N'Enfermero')
INSERT [dbo].[Roles] ([RolId], [NombreRol]) VALUES (1, N'Entrenador')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SolicitudesDeBatalla] ON 

INSERT [dbo].[SolicitudesDeBatalla] ([SolicitudBatallaId], [RetadorId], [OponenteId], [Estado], [FechaSolicitud]) VALUES (2, 1, 1, N'Pendiente', CAST(N'2024-11-28T11:31:20.067' AS DateTime))
SET IDENTITY_INSERT [dbo].[SolicitudesDeBatalla] OFF
GO
SET IDENTITY_INSERT [dbo].[SolicitudesDeCuracion] ON 

INSERT [dbo].[SolicitudesDeCuracion] ([SolicitudCuracionId], [EntrenadorId], [PokemonId], [Estado], [FechaSolicitud]) VALUES (1, 1, 1, N'Pendiente', CAST(N'2024-11-28T11:31:43.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[SolicitudesDeCuracion] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos] ON 

INSERT [dbo].[Tipos] ([TipoId], [NombreTipo]) VALUES (1, N'Fuegooo')
SET IDENTITY_INSERT [dbo].[Tipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioId], [NombreUsuario], [HashContrasena], [RolId], [NombreEntrenador]) VALUES (1, N'Leonardo', N'123', 2, N'Leo')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Debilida__5317C55B49F58C15]    Script Date: 28/11/2024 11:59:56 ******/
ALTER TABLE [dbo].[Debilidades] ADD UNIQUE NONCLUSTERED 
(
	[NombreDebilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Pokedex__7E532BC60ED9F189]    Script Date: 28/11/2024 11:59:56 ******/
ALTER TABLE [dbo].[Pokedex] ADD UNIQUE NONCLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__4F0B537F4F15A647]    Script Date: 28/11/2024 11:59:56 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[NombreRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tipos__7586661C61646310]    Script Date: 28/11/2024 11:59:56 ******/
ALTER TABLE [dbo].[Tipos] ADD UNIQUE NONCLUSTERED 
(
	[NombreTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__6B0F5AE0EDBBFF7B]    Script Date: 28/11/2024 11:59:56 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mensajes] ADD  DEFAULT (getdate()) FOR [FechaHora]
GO
ALTER TABLE [dbo].[Pokemons] ADD  DEFAULT ((100)) FOR [Salud]
GO
ALTER TABLE [dbo].[SolicitudesDeBatalla] ADD  DEFAULT (getdate()) FOR [FechaSolicitud]
GO
ALTER TABLE [dbo].[SolicitudesDeCuracion] ADD  DEFAULT (getdate()) FOR [FechaSolicitud]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([DestinatarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD FOREIGN KEY([RemitenteId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pokedex]  WITH CHECK ADD FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipos] ([TipoId])
GO
ALTER TABLE [dbo].[PokedexDebilidades]  WITH CHECK ADD FOREIGN KEY([DebilidadId])
REFERENCES [dbo].[Debilidades] ([DebilidadId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokedexDebilidades]  WITH CHECK ADD FOREIGN KEY([PokedexId])
REFERENCES [dbo].[Pokedex] ([PokedexId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD FOREIGN KEY([EntrenadorId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipos] ([TipoId])
GO
ALTER TABLE [dbo].[SolicitudesDeBatalla]  WITH CHECK ADD FOREIGN KEY([OponenteId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[SolicitudesDeBatalla]  WITH CHECK ADD FOREIGN KEY([RetadorId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SolicitudesDeCuracion]  WITH CHECK ADD FOREIGN KEY([EntrenadorId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SolicitudesDeCuracion]  WITH CHECK ADD FOREIGN KEY([PokemonId])
REFERENCES [dbo].[Pokemons] ([PokemonId])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([Nivel]>=(1)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([Salud]>=(0) AND [Salud]<=(100)))
GO
ALTER TABLE [dbo].[SolicitudesDeBatalla]  WITH CHECK ADD CHECK  (([Estado]='Rechazado' OR [Estado]='Aceptado' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[SolicitudesDeCuracion]  WITH CHECK ADD CHECK  (([Estado]='Rechazado' OR [Estado]='Atendido' OR [Estado]='Pendiente'))
GO
USE [master]
GO
ALTER DATABASE [JuegoPokemon] SET  READ_WRITE 
GO
