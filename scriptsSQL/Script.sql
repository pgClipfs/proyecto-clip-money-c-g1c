USE [virtual_wallet]
GO
/****** Object:  Schema [virtualWallet]    Script Date: 15/12/2020 18:30:50 ******/
CREATE SCHEMA [virtualWallet]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [char](10) NOT NULL,
	[apellido] [char](10) NOT NULL,
	[dni] [int] NULL,
	[dniFotoFrente] [image] NULL,
	[dniFotoReverso] [image] NULL,
	[direccion] [char](15) NULL,
	[nacionalidad] [char](15) NULL,
	[provincia] [char](15) NULL,
	[ciudad] [char](15) NULL,
	[fechaNacimiento] [date] NULL,
	[situacionCrediticia] [char](10) NULL,
	[usuario] [char](10) NOT NULL,
	[contraseña] [char](150) NOT NULL,
	[email] [char](50) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra.venta.divisas]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra.venta.divisas](
	[idCompraVentaDivisas] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[importe] [numeric](28, 2) NOT NULL,
	[comision] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_compra.venta.divisas] PRIMARY KEY CLUSTERED 
(
	[idCompraVentaDivisas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[criptomonedas]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[criptomonedas](
	[idCriptomoneda] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[comision] [numeric](18, 2) NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_criptomonedas] PRIMARY KEY CLUSTERED 
(
	[idCriptomoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[idCuenta] [bigint] IDENTITY(1,1) NOT NULL,
	[moneda] [char](10) NOT NULL,
	[banco] [char](25) NOT NULL,
	[numeroCuenta] [bigint] NOT NULL,
	[saldo] [numeric](18, 0) NOT NULL,
	[tipoCuenta] [char](10) NOT NULL,
	[estado] [char](10) NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [PK_cuentas] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extracciones]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extracciones](
	[idExtraccionDeposito] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
	[consulta] [char](25) NULL,
 CONSTRAINT [PK_extracciones.depositos] PRIMARY KEY CLUSTERED 
(
	[idExtraccionDeposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fci]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fci](
	[idFci] [bigint] IDENTITY(1,1) NOT NULL,
	[rescatar] [numeric](28, 0) NULL,
	[transferir] [numeric](28, 0) NULL,
	[suscribir] [char](25) NULL,
	[importe] [numeric](28, 0) NOT NULL,
	[idInversion] [bigint] NOT NULL,
	[comision] [numeric](28, 2) NOT NULL,
 CONSTRAINT [PK_fci] PRIMARY KEY CLUSTERED 
(
	[idFci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inversiones]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inversiones](
	[idInversion] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
 CONSTRAINT [PK_inversiones] PRIMARY KEY CLUSTERED 
(
	[idInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[idOperacion] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[tipoOperacion] [char](25) NOT NULL,
	[idCuentaDestino] [bigint] NULL,
	[idCuenta] [bigint] NOT NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[idOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago.servicios]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago.servicios](
	[idPagoServicios] [bigint] IDENTITY(1,1) NOT NULL,
	[empresa] [char](25) NULL,
	[rubro] [char](10) NULL,
	[idOperacion] [bigint] NULL,
	[importe] [numeric](28, 0) NULL,
	[vencimiento] [datetime] NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[idPagoServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plazo.fijo]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plazo.fijo](
	[idPlazoFijo] [bigint] IDENTITY(1,1) NOT NULL,
	[idInversion] [bigint] NOT NULL,
	[tasa] [numeric](18, 2) NOT NULL,
	[montoMinimo] [numeric](28, 0) NOT NULL,
	[plazoMinimo] [char](25) NOT NULL,
 CONSTRAINT [PK_plazo.fijo] PRIMARY KEY CLUSTERED 
(
	[idPlazoFijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transferencias]    Script Date: 15/12/2020 18:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transferencias](
	[idTransferencia] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[tipo] [char](25) NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
	[plazoAcreditacion] [datetime] NOT NULL,
	[concepto] [char](25) NOT NULL,
 CONSTRAINT [PK_transferencias] PRIMARY KEY CLUSTERED 
(
	[idTransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (1, N'Ignacio   ', N'Aguero    ', 32373322, NULL, NULL, N'San Luis 23    ', N'Argentino      ', N'Jujuy          ', N'Jujuy          ', CAST(N'1986-07-08' AS Date), N'Aprobado  ', N'usuario1  ', N'usuario1                                                                                                                                              ', N'ignaciomaguero@gmail.com                          ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (2, N'Martin    ', N'Gorombeta ', 30545670, NULL, NULL, N'Dean Funes 48  ', N'Argentino      ', N'Cordoba        ', N'Cordoba        ', CAST(N'1990-10-02' AS Date), N'Aprobado  ', N'usuario2  ', N'usuario2                                                                                                                                              ', N'usuario2@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (3, N'Silvia    ', N'Moyano    ', 26858913, NULL, NULL, N'9 de Julio 540 ', N'Argentina      ', N'Cordoba        ', N'Cordoba        ', CAST(N'1979-03-01' AS Date), N'Denegado  ', N'usuario3  ', N'usuario3                                                                                                                                              ', N'usuario3@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (4, N'Martin    ', N'Guzman    ', 36809123, NULL, NULL, N'San Martin 125 ', N'Argentina      ', N'Mendoza        ', N'Rafaela        ', CAST(N'1995-11-05' AS Date), N'Aprobado  ', N'usuario4  ', N'usuario4                                                                                                                                              ', N'usuario4@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (5, N'Roberto   ', N'Sanchez   ', 14303425, NULL, NULL, N'Alem 28        ', N'Argentino      ', N'Buenos Aires   ', N'Buenos Aires   ', CAST(N'1965-02-07' AS Date), N'Denegado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario5@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (6, N'Juan      ', N'Lopez     ', 32958445, NULL, NULL, N'Santa Rosa 715 ', N'Argentina      ', N'Buenos Aires   ', N'Buenos Aires   ', CAST(N'1978-04-30' AS Date), N'Aprobado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario6@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (8, N'Luana     ', N'Gorriti   ', 29122564, NULL, NULL, N'Jujuy 320      ', N'Argentina      ', N'San Juan       ', N'San Juan       ', CAST(N'1995-08-12' AS Date), N'Aprobado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario7@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (9, N'Juana     ', N'Molina    ', 37822576, NULL, NULL, N'Santa Fe 130   ', N'Argentina      ', N'La Rioja       ', N'Chilecito      ', CAST(N'1999-05-29' AS Date), N'Denegado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario8@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (10, N'Lautaro   ', N'Gagliardo ', 40285472, NULL, NULL, N'Richieri 432   ', N'Argentina      ', N'Santa Fe       ', N'Rosario        ', CAST(N'2001-08-23' AS Date), N'Aprobado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario9@gmail.com                                ')
INSERT [dbo].[clientes] ([idCliente], [nombre], [apellido], [dni], [dniFotoFrente], [dniFotoReverso], [direccion], [nacionalidad], [provincia], [ciudad], [fechaNacimiento], [situacionCrediticia], [usuario], [contraseña], [email]) VALUES (11, N'Nicolas   ', N'Talev     ', 35644226, NULL, NULL, N'Suipacha 35    ', N'Argentina      ', N'San Luis       ', N'San Luis       ', CAST(N'1990-02-05' AS Date), N'Aprobado  ', N'usuario5  ', N'usuario5                                                                                                                                              ', N'usuario10@gmail.com                               ')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[compra.venta.divisas] ON 

INSERT [dbo].[compra.venta.divisas] ([idCompraVentaDivisas], [idOperacion], [importe], [comision]) VALUES (1, 25, CAST(200.00 AS Numeric(28, 2)), CAST(0.50 AS Numeric(18, 2)))
INSERT [dbo].[compra.venta.divisas] ([idCompraVentaDivisas], [idOperacion], [importe], [comision]) VALUES (2, 26, CAST(200.00 AS Numeric(28, 2)), CAST(0.50 AS Numeric(18, 2)))
INSERT [dbo].[compra.venta.divisas] ([idCompraVentaDivisas], [idOperacion], [importe], [comision]) VALUES (3, 21, CAST(1200.00 AS Numeric(28, 2)), CAST(0.50 AS Numeric(18, 2)))
INSERT [dbo].[compra.venta.divisas] ([idCompraVentaDivisas], [idOperacion], [importe], [comision]) VALUES (4, 44, CAST(200.00 AS Numeric(28, 2)), CAST(0.50 AS Numeric(18, 2)))
INSERT [dbo].[compra.venta.divisas] ([idCompraVentaDivisas], [idOperacion], [importe], [comision]) VALUES (5, 45, CAST(200.00 AS Numeric(28, 2)), CAST(0.50 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[compra.venta.divisas] OFF
GO
SET IDENTITY_INSERT [dbo].[criptomonedas] ON 

INSERT [dbo].[criptomonedas] ([idCriptomoneda], [idOperacion], [comision], [importe]) VALUES (1, 27, CAST(0.50 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)))
INSERT [dbo].[criptomonedas] ([idCriptomoneda], [idOperacion], [comision], [importe]) VALUES (2, 28, CAST(0.50 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)))
INSERT [dbo].[criptomonedas] ([idCriptomoneda], [idOperacion], [comision], [importe]) VALUES (3, 46, CAST(0.50 AS Numeric(18, 2)), CAST(0.30 AS Numeric(18, 2)))
INSERT [dbo].[criptomonedas] ([idCriptomoneda], [idOperacion], [comision], [importe]) VALUES (4, 47, CAST(0.50 AS Numeric(18, 2)), CAST(0.70 AS Numeric(18, 2)))
INSERT [dbo].[criptomonedas] ([idCriptomoneda], [idOperacion], [comision], [importe]) VALUES (5, 48, CAST(0.50 AS Numeric(18, 2)), CAST(0.40 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[criptomonedas] OFF
GO
SET IDENTITY_INSERT [dbo].[cuentas] ON 

INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (1, N'ARS       ', N'Santander                ', 8935673229, CAST(500 AS Numeric(18, 0)), N'CA        ', N'Activa    ', 1)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (2, N'ARS       ', N'Galicia                  ', 8954376346, CAST(20 AS Numeric(18, 0)), N'CC        ', N'Activa    ', 2)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (3, N'U$S       ', N'Itau                     ', 8905632564, CAST(5 AS Numeric(18, 0)), N'CC        ', N'Inactiva  ', 3)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (14, N'ARS       ', N'Frances                  ', 8910356739, CAST(33 AS Numeric(18, 0)), N'CA        ', N'Inactiva  ', 4)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (15, N'ARS       ', N'HSBC                     ', 8912432538, CAST(49 AS Numeric(18, 0)), N'CA        ', N'Activa    ', 5)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (16, N'EUR       ', N'Banco Nacion             ', 6754535645, CAST(2000 AS Numeric(18, 0)), N'CC        ', N'Activa    ', 6)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (20, N'U$S       ', N'ICBC                     ', 5464564576, CAST(5000 AS Numeric(18, 0)), N'CC        ', N'Inactiva  ', 8)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (21, N'ARS       ', N'Galicia                  ', 3423423443, CAST(20000 AS Numeric(18, 0)), N'CA        ', N'Activa    ', 9)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (22, N'ARS       ', N'Banco de Cordoba         ', 3242435433, CAST(25000 AS Numeric(18, 0)), N'CC        ', N'Activa    ', 10)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (23, N'EUR       ', N'Santander                ', 8768764545, CAST(30450 AS Numeric(18, 0)), N'CA        ', N'Inactiva  ', 11)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (24, N'U$S       ', N'Santander                ', 6495483467, CAST(10000 AS Numeric(18, 0)), N'CA        ', N'Activa    ', 1)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (25, N'U$S       ', N'Galicia                  ', 5478324647, CAST(7000 AS Numeric(18, 0)), N'CA        ', N'Activa    ', 2)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (26, N'BTC       ', N'Itau                     ', 2324646743, CAST(5 AS Numeric(18, 0)), N'CM        ', N'Activa    ', 3)
INSERT [dbo].[cuentas] ([idCuenta], [moneda], [banco], [numeroCuenta], [saldo], [tipoCuenta], [estado], [idCliente]) VALUES (27, N'BTC       ', N'ICBC                     ', 3243437543, CAST(2 AS Numeric(18, 0)), N'CM        ', N'Activa    ', 8)
SET IDENTITY_INSERT [dbo].[cuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[extracciones] ON 

INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (1, 13, CAST(980.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (2, 6, CAST(1500.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (3, 11, CAST(800.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (4, 24, CAST(450.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (5, 10, CAST(2000.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[extracciones] ([idExtraccionDeposito], [idOperacion], [importe], [consulta]) VALUES (6, 23, CAST(800.00 AS Numeric(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[extracciones] OFF
GO
SET IDENTITY_INSERT [dbo].[fci] ON 

INSERT [dbo].[fci] ([idFci], [rescatar], [transferir], [suscribir], [importe], [idInversion], [comision]) VALUES (1, NULL, NULL, NULL, CAST(100000 AS Numeric(28, 0)), 1, CAST(0.10 AS Numeric(28, 2)))
INSERT [dbo].[fci] ([idFci], [rescatar], [transferir], [suscribir], [importe], [idInversion], [comision]) VALUES (2, NULL, NULL, NULL, CAST(200000 AS Numeric(28, 0)), 2, CAST(0.20 AS Numeric(28, 2)))
SET IDENTITY_INSERT [dbo].[fci] OFF
GO
SET IDENTITY_INSERT [dbo].[inversiones] ON 

INSERT [dbo].[inversiones] ([idInversion], [idOperacion]) VALUES (1, 29)
INSERT [dbo].[inversiones] ([idInversion], [idOperacion]) VALUES (2, 30)
INSERT [dbo].[inversiones] ([idInversion], [idOperacion]) VALUES (3, 31)
INSERT [dbo].[inversiones] ([idInversion], [idOperacion]) VALUES (4, 32)
SET IDENTITY_INSERT [dbo].[inversiones] OFF
GO
SET IDENTITY_INSERT [dbo].[operaciones] ON 

INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (6, CAST(N'2020-10-13T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (7, CAST(N'2020-10-13T00:00:00.000' AS DateTime), N'Transferencia            ', 3, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (10, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 3)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (11, CAST(N'2020-10-08T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 14)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (12, CAST(N'2020-10-03T00:00:00.000' AS DateTime), N'Transferencia            ', 3, 15)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (13, CAST(N'2020-10-13T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 16)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (20, CAST(N'2020-10-13T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 15)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (21, CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'Compra Dolares           ', 20, 21)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (23, CAST(N'2020-10-07T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 22)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (24, CAST(N'2020-10-01T00:00:00.000' AS DateTime), N'Extraccion               ', NULL, 23)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (25, CAST(N'2020-10-04T00:00:00.000' AS DateTime), N'Compra Dolares           ', 24, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (26, CAST(N'2020-10-15T00:00:00.000' AS DateTime), N'Compra Dolares           ', 25, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (27, CAST(N'2020-09-01T00:00:00.000' AS DateTime), N'Compra Bitcoin           ', 26, 3)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (28, CAST(N'2020-09-02T00:00:00.000' AS DateTime), N'Compra Bitcoin           ', 27, 20)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (29, CAST(N'2020-08-01T00:00:00.000' AS DateTime), N'FCI                      ', NULL, 15)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (30, CAST(N'2020-05-02T00:00:00.000' AS DateTime), N'FCI                      ', NULL, 21)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (31, CAST(N'2020-07-02T00:00:00.000' AS DateTime), N'Plazo Fijo               ', NULL, 22)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (32, CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Plazo Fijo               ', NULL, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (33, CAST(N'2020-08-01T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (34, CAST(N'2020-09-02T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 14)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (35, CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'Transferencia            ', 14, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (36, CAST(N'2020-06-07T00:00:00.000' AS DateTime), N'Transferencia            ', 22, 21)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (37, CAST(N'2020-07-02T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (38, CAST(N'2020-08-23T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 15)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (39, CAST(N'2020-09-07T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 21)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (40, CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 22)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (41, CAST(N'2020-01-29T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 14)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (42, CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (43, CAST(N'2020-08-19T00:00:00.000' AS DateTime), N'Pago Servicios           ', NULL, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (44, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Compra Dolares           ', 24, 1)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (45, CAST(N'2020-11-02T00:00:00.000' AS DateTime), N'Compra Dolares           ', 25, 2)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (46, CAST(N'2020-10-30T00:00:00.000' AS DateTime), N'Compra Bitcoin           ', 26, 3)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (47, CAST(N'2020-11-03T00:00:00.000' AS DateTime), N'Compra Bitcoin           ', 27, 20)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (48, CAST(N'2020-11-05T00:00:00.000' AS DateTime), N'Compra Bitcoin           ', 26, 3)
INSERT [dbo].[operaciones] ([idOperacion], [fechaHora], [tipoOperacion], [idCuentaDestino], [idCuenta]) VALUES (49, CAST(N'2020-11-06T00:00:00.000' AS DateTime), N'Transferencia            ', 3, 15)
SET IDENTITY_INSERT [dbo].[operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[pago.servicios] ON 

INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (1, N'Epec                     ', N'Luz       ', 20, CAST(2800 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (2, N'Ecogas                   ', N'Gas       ', 37, CAST(1000 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (3, N'Aguas Cordobesas         ', N'Agua      ', 39, CAST(300 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (4, N'FIbertel                 ', N'Internet  ', 34, CAST(3000 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (5, N'Claro                    ', N'Telefonia ', 38, CAST(800 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (6, N'Personal                 ', N'Telefonia ', 40, CAST(700 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (7, N'Movistar                 ', N'Telefonia ', 41, CAST(900 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (8, N'Directv                  ', N'Cable     ', 33, CAST(5000 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (9, N'Cablevision              ', N'Cable     ', 42, CAST(4000 AS Numeric(28, 0)), NULL)
INSERT [dbo].[pago.servicios] ([idPagoServicios], [empresa], [rubro], [idOperacion], [importe], [vencimiento]) VALUES (10, N'Netflix                  ', N'Streaming ', 43, CAST(2500 AS Numeric(28, 0)), NULL)
SET IDENTITY_INSERT [dbo].[pago.servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[plazo.fijo] ON 

INSERT [dbo].[plazo.fijo] ([idPlazoFijo], [idInversion], [tasa], [montoMinimo], [plazoMinimo]) VALUES (2, 3, CAST(0.34 AS Numeric(18, 2)), CAST(50000 AS Numeric(28, 0)), N'30                       ')
INSERT [dbo].[plazo.fijo] ([idPlazoFijo], [idInversion], [tasa], [montoMinimo], [plazoMinimo]) VALUES (3, 4, CAST(0.34 AS Numeric(18, 2)), CAST(80000 AS Numeric(28, 0)), N'60                       ')
SET IDENTITY_INSERT [dbo].[plazo.fijo] OFF
GO
SET IDENTITY_INSERT [dbo].[transferencias] ON 

INSERT [dbo].[transferencias] ([idTransferencia], [idOperacion], [tipo], [importe], [plazoAcreditacion], [concepto]) VALUES (1, 12, N'Normal                   ', CAST(4000.00 AS Numeric(18, 2)), CAST(N'2020-10-04T00:00:00.000' AS DateTime), N'Varios                   ')
INSERT [dbo].[transferencias] ([idTransferencia], [idOperacion], [tipo], [importe], [plazoAcreditacion], [concepto]) VALUES (2, 7, N'Inmediata                ', CAST(5000.00 AS Numeric(18, 2)), CAST(N'2020-10-14T00:00:00.000' AS DateTime), N'Expensas                 ')
INSERT [dbo].[transferencias] ([idTransferencia], [idOperacion], [tipo], [importe], [plazoAcreditacion], [concepto]) VALUES (3, 35, N'Normal                   ', CAST(500.00 AS Numeric(18, 2)), CAST(N'2020-03-11T00:00:00.000' AS DateTime), N'Varios                   ')
INSERT [dbo].[transferencias] ([idTransferencia], [idOperacion], [tipo], [importe], [plazoAcreditacion], [concepto]) VALUES (5, 36, N'Inmediata                ', CAST(15000.00 AS Numeric(18, 2)), CAST(N'2020-06-07T00:00:00.000' AS DateTime), N'Alquiler                 ')
INSERT [dbo].[transferencias] ([idTransferencia], [idOperacion], [tipo], [importe], [plazoAcreditacion], [concepto]) VALUES (6, 49, N'Normal                   ', CAST(16000.00 AS Numeric(18, 2)), CAST(N'2020-11-07T00:00:00.000' AS DateTime), N'Alquiler                 ')
SET IDENTITY_INSERT [dbo].[transferencias] OFF
GO
/****** Object:  Index [IX_cuentas]    Script Date: 15/12/2020 18:30:51 ******/
ALTER TABLE [dbo].[cuentas] ADD  CONSTRAINT [IX_cuentas] UNIQUE NONCLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra.venta.divisas]  WITH CHECK ADD  CONSTRAINT [FK_compra.venta.divisas_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[compra.venta.divisas] CHECK CONSTRAINT [FK_compra.venta.divisas_operaciones]
GO
ALTER TABLE [dbo].[criptomonedas]  WITH CHECK ADD  CONSTRAINT [FK_criptomonedas_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[criptomonedas] CHECK CONSTRAINT [FK_criptomonedas_operaciones]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_clientes]
GO
ALTER TABLE [dbo].[extracciones]  WITH CHECK ADD  CONSTRAINT [FK_extracciones.depositos_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[extracciones] CHECK CONSTRAINT [FK_extracciones.depositos_operaciones]
GO
ALTER TABLE [dbo].[fci]  WITH CHECK ADD  CONSTRAINT [FK_fci_inversiones] FOREIGN KEY([idInversion])
REFERENCES [dbo].[inversiones] ([idInversion])
GO
ALTER TABLE [dbo].[fci] CHECK CONSTRAINT [FK_fci_inversiones]
GO
ALTER TABLE [dbo].[inversiones]  WITH CHECK ADD  CONSTRAINT [FK_inversiones_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[inversiones] CHECK CONSTRAINT [FK_inversiones_operaciones]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_cuentas] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[cuentas] ([idCuenta])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_cuentas]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_cuentas1] FOREIGN KEY([idCuentaDestino])
REFERENCES [dbo].[cuentas] ([idCuenta])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_cuentas1]
GO
ALTER TABLE [dbo].[pago.servicios]  WITH CHECK ADD  CONSTRAINT [FK_pago.servicios_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[pago.servicios] CHECK CONSTRAINT [FK_pago.servicios_operaciones]
GO
ALTER TABLE [dbo].[plazo.fijo]  WITH CHECK ADD  CONSTRAINT [FK_plazo.fijo_inversiones] FOREIGN KEY([idInversion])
REFERENCES [dbo].[inversiones] ([idInversion])
GO
ALTER TABLE [dbo].[plazo.fijo] CHECK CONSTRAINT [FK_plazo.fijo_inversiones]
GO
ALTER TABLE [dbo].[transferencias]  WITH CHECK ADD  CONSTRAINT [FK_transferencias_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[transferencias] CHECK CONSTRAINT [FK_transferencias_operaciones]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_persona]    Script Date: 15/12/2020 18:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_persona]  
@IdCliente INT
	
AS

BEGIN
	DELETE FROM clientes WHERE idCliente=@idCliente
END

SELECT * FROM clientes

GO
/****** Object:  StoredProcedure [dbo].[modificar_persona]    Script Date: 15/12/2020 18:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modificar_persona]
@IdCliente int,
@Nombre char(10),
@Apellido char(10),
@Direccion char(15),
@Provincia char(15),
@Ciudad char(15)
AS
BEGIN
UPDATE Clientes	
   SET Nombre=@Nombre,
	   Apellido=@Apellido,
	   Direccion=@Direccion,
	   Provincia=@Provincia,
	   Ciudad=@Ciudad
WHERE  IdCliente=@idCliente
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_login]    Script Date: 15/12/2020 18:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[obtener_login]
	@username char(10),
	@password char(150)
AS
BEGIN
	select * from clientes where usuario=@username and contraseña=@password
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_personas]    Script Date: 15/12/2020 18:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[obtener_personas]
	
AS
BEGIN
	select * from clientes
END
GO
