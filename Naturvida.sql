USE [master]
GO
/****** Object:  Database [NaturVida]    Script Date: 26/04/2023 7:37:39 ******/
CREATE DATABASE [NaturVida]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NaturVida', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NaturVida.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NaturVida_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NaturVida_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NaturVida] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NaturVida].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NaturVida] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NaturVida] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NaturVida] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NaturVida] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NaturVida] SET ARITHABORT OFF 
GO
ALTER DATABASE [NaturVida] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NaturVida] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NaturVida] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NaturVida] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NaturVida] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NaturVida] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NaturVida] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NaturVida] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NaturVida] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NaturVida] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NaturVida] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NaturVida] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NaturVida] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NaturVida] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NaturVida] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NaturVida] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NaturVida] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NaturVida] SET RECOVERY FULL 
GO
ALTER DATABASE [NaturVida] SET  MULTI_USER 
GO
ALTER DATABASE [NaturVida] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NaturVida] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NaturVida] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NaturVida] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NaturVida] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NaturVida] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NaturVida] SET QUERY_STORE = OFF
GO
USE [NaturVida]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Documento] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[Direccion] [varchar](250) NULL,
	[Telefono] [varchar](10) NULL,
	[Correo] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactu] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Documento_Cliente] [int] NULL,
	[Codigo_Vendedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura_Detalle]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Detalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Factura] [int] NULL,
	[Codigo_Productos] [int] NULL,
	[Cantidad] [int] NULL,
	[Valor_Unidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Codigo] [int] NOT NULL,
	[Descripción] [varchar](50) NULL,
	[Valor_Unidad] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedores]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[Codigo] [int] NOT NULL,
	[Usuario] [varchar](15) NULL,
	[Contraseña] [varchar](250) NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([Documento_Cliente])
REFERENCES [dbo].[Cliente] ([Documento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([Codigo_Vendedor])
REFERENCES [dbo].[Vendedores] ([Codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Factura_Detalle]  WITH CHECK ADD FOREIGN KEY([Codigo_Productos])
REFERENCES [dbo].[Productos] ([Codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Factura_Detalle]  WITH CHECK ADD FOREIGN KEY([Numero_Factura])
REFERENCES [dbo].[Factura] ([IdFactu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZARVENDE]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[ACTUALIZARVENDE]
@Codigo INT,
@Nombre VARCHAR(50),
@Contraseña VARCHAR (250),
@Usuario VARCHAR(15)
AS
UPDATE Vendedores SET Codigo = @Codigo,Nombre = @Nombre,Contraseña=@Contraseña,Usuario=@Usuario
WHERE Codigo = @Codigo
GO
/****** Object:  StoredProcedure [dbo].[AGGVENDEDOR]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AGGVENDEDOR]
@Cod int ,
@Usuario varchar(15),
@Contraseña varchar(250),
@Nombre varchar(50)
AS
INSERT INTO Vendedores VALUES(@Cod,@Usuario,@Contraseña,@Nombre)
GO
/****** Object:  StoredProcedure [dbo].[DocRep]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DocRep]
  @Doc Int
  as
  select Documento from Cliente where Documento=@Doc
GO
/****** Object:  StoredProcedure [dbo].[EliminarV]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarV]
@Codigo INT
AS
DELETE Vendedores
WHERE Codigo = @Codigo
GO
/****** Object:  StoredProcedure [dbo].[FiltrarC]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FiltrarC]
 @Doc int
 AS
 select*from Cliente where Documento=@Doc
GO
/****** Object:  StoredProcedure [dbo].[FiltrarVendedor]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FiltrarVendedor]
 @Codigo int
 AS
 select*from Vendedores where Codigo=@Codigo
GO
/****** Object:  StoredProcedure [dbo].[IdRep]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[IdRep]
  @Codigo Int
  as
  select Codigo from Productos where Codigo=@Codigo
GO
/****** Object:  StoredProcedure [dbo].[MostrarClie]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MostrarClie]
 as
 select*from Cliente
GO
/****** Object:  StoredProcedure [dbo].[mostrarP]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarP]
as
select * from Productos

GO
/****** Object:  StoredProcedure [dbo].[MostrarU]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MostrarU]
 @Codigo int
 AS
 select*from Productos where Codigo=@Codigo
GO
/****** Object:  StoredProcedure [dbo].[MostrarVendedores]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MostrarVendedores]
  as
  select*from Vendedores
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALCLIENT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ACTUALCLIENT]
@Docu INT,
@Nombre VARCHAR(250),
@Direccion VARCHAR (250),
@Tel VARCHAR(10),
@Corr VARCHAR(250)
AS
UPDATE Cliente SET Documento = @Docu,Nombre = @Nombre,Direccion = @Direccion,Telefono = @Tel,Correo = @Corr
WHERE Documento = @Docu
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZARPROD]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ACTUALIZARPROD]
@Cod INT,
@CodNew INT, 
@Descri VARCHAR(30),
@ValUnd INT,
@Cant INT
AS
UPDATE Productos SET  Descripción = @Descri, Valor_Unidad = @ValUnd,Cantidad = @Cant
WHERE Codigo = @Cod
GO
/****** Object:  StoredProcedure [dbo].[SP_AGGFACT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_AGGFACT]
	@Fech DATE,
	@DoClient INT,
	@CodVende INT
	AS
	INSERT INTO Factura VALUES(@Fech,@DoClient,@CodVendE)

GO
/****** Object:  StoredProcedure [dbo].[SP_AGGFACTDETA]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_AGGFACTDETA]
	@IDFac INT,
	@CodProd INT,
	@Cant INT,
	@ValUnidad INT
	AS
	INSERT INTO Factura_Detalle VALUES(@IDFac,@CodProd,@Cant,@ValUnidad)
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARINVENTARIO]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BUSCARINVENTARIO]
@Prod INT
AS
SELECT P.Descripción,P.Cantidad,SUM(F.Cantidad) AS 'Vendido' FROM Factura_Detalle AS F
JOIN Productos AS P on F.Codigo_Productos = P.Codigo
where P.Codigo = @Prod GROUP BY P.Descripción,P.Cantidad
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARINVENTARIOS]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BUSCARINVENTARIOS]
AS
SELECT P.Descripción,P.Cantidad,SUM(F.Cantidad) AS 'Vendido' FROM Factura_Detalle AS F
JOIN Productos AS P on F.Codigo_Productos = P.Codigo
GROUP BY P.Descripción,P.Cantidad
GO
/****** Object:  StoredProcedure [dbo].[SP_DESCONTARCANT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[SP_DESCONTARCANT]
	@Codprod INT,
	@Cantidad INT
	AS
	UPDATE Productos SET Cantidad = Cantidad - @Cantidad
	WHERE Codigo = @Codprod
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARCLIENT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ELIMINARCLIENT]
@Docu INT
AS
DELETE Cliente
WHERE Documento = @Docu
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPROD]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ELIMINARPROD]
@Cod INT 
AS
DELETE Productos
WHERE Codigo = @Cod
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTARCLIENT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERTARCLIENT]
@Docu INT,
@Nombre VARCHAR(250),
@Direccion VARCHAR (250),
@Tel VARCHAR(10),
@Corr VARCHAR(250)
AS
INSERT INTO Cliente VALUES(@Docu,@Nombre,@Direccion,@Tel,@Corr)
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTARPRODUCT]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERTARPRODUCT]
@Codigo INT,
@Descri VARCHAR(30),
@ValUnd INT,
@Cantida INT
AS
INSERT INTO Productos VALUES(@Codigo,@Descri,@ValUnd,@Cantida)
GO
/****** Object:  StoredProcedure [dbo].[ultimo_num]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ultimo_num]
 as
 select top 1 IdFactu from Factura order by IdFactu desc
GO
/****** Object:  StoredProcedure [dbo].[ValidacionCO]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ValidacionCO]
@Usuario varchar(15),
@Contrasena varchar(250)
as
select Usuario,Contraseña from Vendedores where Usuario=@Usuario and Contraseña=@Contrasena
GO
/****** Object:  StoredProcedure [dbo].[VendedorR]    Script Date: 26/04/2023 7:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[VendedorR]
  @Codigo Int
  as
  select Codigo from Vendedores where Codigo=@Codigo
GO
USE [master]
GO
ALTER DATABASE [NaturVida] SET  READ_WRITE 
GO
